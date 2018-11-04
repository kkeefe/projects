library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
use work.UtilityPkg.all;
use work.Eth1000BaseXPkg.all;
use work.GigabitEthPkg.all;

library UNISIM;
use UNISIM.VComponents.all;

entity scrodEthernetExample is
   generic (
      REG_ADDR_BITS_G : integer := 16;
      REG_DATA_BITS_G : integer := 16;
      NUM_IP_G        : integer := 2;
      GATE_DELAY_G    : time := 1 ns
   );
   port ( 
      --ASIC Scrod ports --Side "A"
		AsicOut_TRIG_OUTPUT_R0_C0_CH : in slv(7 downto 0);
		AsicOut_TRIG_OUTPUT_R0_C1_CH : in slv(7 downto 0);
		AsicOut_TRIG_OUTPUT_R0_C2_CH : in slv(7 downto 0);
		AsicOut_TRIG_OUTPUT_R0_C3_CH : in slv(7 downto 0);
		
		AsicOut_TRIG_OUTPUT_R1_C0_CH : in slv(7 downto 0);
		AsicOut_TRIG_OUTPUT_R1_C1_CH : in slv(7 downto 0);
		AsicOut_TRIG_OUTPUT_R1_C2_CH : in slv(7 downto 0);
		AsicOut_TRIG_OUTPUT_R1_C3_CH : in slv(7 downto 0);
		
--		--ASIC Scrod ports --Side "B"
--		AsicOut_TRIG_OUTPUT_R2_C0_CH : in slv(7 downto 0);
--		AsicOut_TRIG_OUTPUT_R2_C1_CH : in slv(7 downto 0);
--		AsicOut_TRIG_OUTPUT_R2_C2_CH : in slv(7 downto 0);
--		AsicOut_TRIG_OUTPUT_R2_C3_CH : in slv(7 downto 0);
--		
--		AsicOut_TRIG_OUTPUT_R3_C0_CH : in slv(7 downto 0);
--		AsicOut_TRIG_OUTPUT_R3_C1_CH : in slv(7 downto 0);
--		AsicOut_TRIG_OUTPUT_R3_C2_CH : in slv(7 downto 0);
--		AsicOut_TRIG_OUTPUT_R3_C3_CH : in slv(7 downto 0);
		
		-- Direct GT connections
      gtTxP        : out sl;
      gtTxN        : out sl;
      gtRxP        :  in sl;
      gtRxN        :  in sl;
      gtClkP       :  in sl;
      gtClkN       :  in sl;

      -- Alternative clock input
      fabClkP      :  in sl;
      fabClkN      :  in sl;
      -- SFP transceiver disable pin
      txDisable    : out sl;
      -- Status and diagnostics out
      ethSync      : out  sl;
      ethReady     : out  sl;

      --must declare led..    
		led          : out  slv(15 downto 0)

      );
end scrodEthernetExample;

architecture Behavioral of scrodEthernetExample is

  --inputs used for clking and bufPLL
  signal fabClk       : sl;
  signal ethClk62     : sl;
  signal ethClk125    : sl;
  signal clk100       : slv (2 downto 0);
  signal clk400_PLL   : slv (2 downto 0);
  signal locked  		 : slv (2 downto 0);
  --microblaze clk to control the reg map
  signal microblaze_clk_gen_out : sl;
  signal clk400_SLV   : slv(2 downto 0);
  signal ioce_slv		 : slv(2 downto 0);


  signal userRst     : sl;
  --signal userRst_O   : sl;

  signal ethRxLinkSync  : sl;
  signal ethAutoNegDone : sl;

  -- User Data interfaces
  signal userTxDataChannels      : slv(7 downto 0);
  signal userTxDataValids        : sl;
  signal userTxDataLasts         : sl;
  signal userTxDataReadys        : sl;

  signal userRxDataChannels      : slv(7 downto 0);
  signal userRxDataValids        : sl;
  signal userRxDataLasts         : sl;
  signal userRxDataReadys        : sl;

	--IO signals
  signal iomodule_0_IO_Addr_Strobe_pin  : std_logic;
  signal iomodule_0_IO_Read_Strobe_pin  : std_logic;
  signal iomodule_0_IO_Write_Strobe_pin : std_logic;
  signal iomodule_0_IO_Address_pin 	    : std_logic_vector(31 downto 0);
  signal iomodule_0_IO_Byte_Enable_pin  : std_logic_vector(3 downto 0);
  signal iomodule_0_IO_Write_Data_pin   : std_logic_vector(31 downto 0);
  signal iomodule_0_IO_Read_Data_pin    : std_logic_vector(31 downto 0);
  signal iomodule_0_IO_Ready_pin 		 : std_logic;


	--connecting ports for the data_processing_top module for the ASIC pins
  signal input_pins_A   : slv(63 downto 0);
  --signal input_pins_B   : slv(63 downto 0);
  signal data_addr_befs : slv(3 downto 0) := "0010"; --set these values to read two each,
  signal data_addr_afts : slv(3 downto 0) := "0011"; --the this number includes the address itself.. (total addresses read is the sum of bef and afts..
  signal dataReadys		: sl;

	signal evtData 	      : slv(31 downto 0);
	signal evtDataFifoReady : sl;
	signal evtDataLast      : sl;
	signal evtDataValid     : sl;

--  signal output_data       : slv(7 downto 0);
--  signal output_data_ready : sl;
--  signal output_data_last  : sl;
--  signal output_data_valid : sl;


  --included from A7 top design
  -- Vivado attributes to keep signals for debugging
  attribute dont_touch : string;
  attribute dont_touch of led : signal is "true";  
   
begin

   ethSync           <= ethRxLinkSync;
   ethReady          <= ethAutoNegDone;
	fabClk 				<= clk100(0);
	
	--fab clk pins used to generate 100 and 400 MHz lines, although this alternative clk signal is killed in S6 anyways..
	--U_IBUFGDS : IBUFGDS port map ( I => fabClkP, IB => fabClkN, O => fabClk);
   
 	--------------------------------
   -- Gigabit Ethernet Interface --
   --------------------------------
   U_S6EthTop : entity work.S6EthTop
      generic map (
        NUM_IP_G     => 2,
        --included from A7
        GATE_DELAY_G => GATE_DELAY_G
      )
      port map (
         -- Direct GT connections
         gtTxP           => gtTxP, --used input signals
         gtTxN           => gtTxN,
         gtRxP           => gtRxP,
         gtRxN           => gtRxN,
         gtClkP          => gtClkP, --used in U_IBUFDS
         gtClkN          => gtClkN, --used in U_IBUFDS
         -- --not included in A7
         -- -- Alternative clock input from fabric
         fabClkIn        => fabClk,
         -- SFP transceiver disable pin
         txDisable       => txDisable,
         -- Clocks out from Ethernet core
         ethUsrClk62     => ethClk62,
         ethUsrClk125    => ethClk125,
         -- Status and diagnostics out
         ethSync         => ethRxLinkSync,
         ethReady        => ethAutoNegDone,
         led             => led,
         -- User clock inputs
         userClk         => ethClk125,
         userRstIn       => '0',
         userRstOut      => userRst,

         -- all data below has lost index: (1)
         userTxData      => userTxDataChannels,
         userTxDataValid => userTxDataValids,
         userTxDataLast  => userTxDataLasts,
         userTxDataReady => userTxDataReadys,

         --received data
         userRxData      => userRxDataChannels,
         userRxDataValid => userRxDataValids,
         userRxDataLast  => userRxDataLasts,
         userRxDataReady => userRxDataReadys
      );

   --------------------------------------
   -- MicroBlaze ISE Spartan 6 Wrapper --
   --------------------------------------

microblaze_0 : entity work.self_wrapper_axi_microblaze
	port map (
 
			userRstIn          => '0',
			userClk				 => ethClk125,	
			userClk100         => clk100(0),
			
			--transmitted data
			userTxDataChannel => userTxDataChannels,
         userTxDataValid   => userTxDataValids,
         userTxDataLast    => userTxDataLasts,
         userTxDataReady   => userTxDataReadys,
         
			--received data
         userRxDataChannel => userRxDataChannels,
         userRxDataValid   => userRxDataValids,
         userRxDataLast    => userRxDataLasts,
         userRxDataReady   => userRxDataReadys,

--			output_data       => output_data,		
--			output_data_ready => output_data_ready,	
--			output_data_last  => output_data_last,		
--			output_data_valid => output_data_valid,

			evtDataValid      => evtDataValid,
			evtData           => evtData,
			evtDataLast       => evtDataLast,
			evtDataFifoReady  => evtDataFifoReady,
			
			--iomodule pins
			iomodule_0_IO_Addr_Strobe_pin   => iomodule_0_IO_Addr_Strobe_pin,
			iomodule_0_IO_Read_Strobe_pin   => iomodule_0_IO_Read_Strobe_pin,
			iomodule_0_IO_Write_Strobe_pin  => iomodule_0_IO_Write_Strobe_pin,
			iomodule_0_IO_Address_pin 		  => iomodule_0_IO_Address_pin,
			iomodule_0_IO_Byte_Enable_pin   => iomodule_0_IO_Byte_Enable_pin,
			iomodule_0_IO_Write_Data_pin    => iomodule_0_IO_Write_Data_pin,
			iomodule_0_IO_Read_Data_pin 	  => iomodule_0_IO_Read_Data_pin,
			iomodule_0_IO_Ready_pin         => iomodule_0_IO_Ready_pin,
		
			microblaze_clk_gen_out          => microblaze_clk_gen_out
		
      );
      
	---------------------------------------
   --------- REGISTER CONTROLS -----------
   ---------------------------------------
	
	Inst_RegControl: entity work.RegControl PORT MAP(
		clk           => microblaze_clk_gen_out,
		sRst 			  => userRst,
		regAddr 		  => iomodule_0_IO_Address_pin,
		regAddrStrb   => iomodule_0_IO_Addr_Strobe_pin,
		regWrStrb 	  => iomodule_0_IO_Write_Strobe_pin,
		regRdStrb     => iomodule_0_IO_Read_Strobe_pin,
		regReady 	  => iomodule_0_IO_Ready_pin,
		regWrData  	  => iomodule_0_IO_Write_Data_pin,
		regRdData 	  => iomodule_0_IO_Read_Data_pin,
		regDataByteEn => iomodule_0_IO_Byte_Enable_pin
	);
	 
	 
									---------------------------------------
									-- Data Processing / Handling Module --
									---------------------------------------
	 
----------------------------------ASSIGN PINS TO SIGNAL VALUES--------------------------------------------------
	--ASIC Scrod ports --Side "A"
	input_pins_a <= 
							AsicOut_TRIG_OUTPUT_R0_C0_CH &
							AsicOut_TRIG_OUTPUT_R0_C1_CH &
							AsicOut_TRIG_OUTPUT_R0_C2_CH &
							AsicOut_TRIG_OUTPUT_R0_C3_CH &
							
							AsicOut_TRIG_OUTPUT_R1_C0_CH &
							AsicOut_TRIG_OUTPUT_R1_C1_CH &
							AsicOut_TRIG_OUTPUT_R1_C2_CH &
							AsicOut_TRIG_OUTPUT_R1_C3_CH;
--ASIC Scrod ports --Side "B"
--input_pins_b <= 
--							AsicOut_TRIG_OUTPUT_R2_C0_CH &
--							AsicOut_TRIG_OUTPUT_R2_C1_CH &
--							AsicOut_TRIG_OUTPUT_R2_C2_CH &
--							AsicOut_TRIG_OUTPUT_R2_C3_CH &
--							
--							AsicOut_TRIG_OUTPUT_R3_C0_CH &
--							AsicOut_TRIG_OUTPUT_R3_C1_CH &
--							AsicOut_TRIG_OUTPUT_R3_C2_CH &
--							AsicOut_TRIG_OUTPUT_R3_C3_CH;

------------------------------------------------------------------------------------------------------------------	 
	 
	 data_proccesing0 : entity work.data_processing_top
    Port Map ( 
			  --inputs from the ASIC / FPGA to take the DATA in..
			  clk100            => clk100(0),					--note that this needs to be that 100 MHz clk..
			  --clk125            => ethClk125,
			  clk400            => clk400_slv,
           rst               => userRst,
           input_pins        => input_pins_a,			--std_logic_vector of the 64 pins from the SiPm face..
			  data_addr_bef	  => data_addr_befs,			--4 bit slv to determine the num of addr to read before the hit
			  data_addr_aft     => data_addr_afts,			--4 bit slv to determine the num of addr to read after the hit
			  dataReady         => dataReadys,				--1 bit sl to say when the data is ready to read
           --outputs to send to the AXIS stream
			  evtDataValid      => evtDataValid,
			  evtData           => evtData,
			  evtDataLast       => evtDataLast,
			  evtDataFifoReady  => evtDataFifoReady,
			  --output data changing..
--			  output_data       => output_data,				--8 bit output to the eth stream
--			  output_data_ready => output_data_ready,		--1 bit input from the eth stream
--			  output_data_last  => output_data_last,		--1 bit output to the eth stream
--			  output_data_valid => output_data_valid,		--1 bit output to the eth stream
			  ioce              => ioce_slv
			);	 

------------------------------------------------------------------------------------------------------
------------------------------------------clk gen-----------------------------------------------------
------------------------------------------------------------------------------------------------------
clk_generate : for i in 0 to 2 generate 
	clk_gen1: entity work.clk_gen
	  port map
		(-- Clock in ports
		 CLK_IN1	  => microblaze_clk_gen_out,
		 -- Clock out ports
		 CLK_OUT1  => clk100(i),
		 CLK_OUT2  => clk400_PLL(i),
		 RESET     => userRst,
		 LOCKED    => locked(i)
		 );
	 -- Status and control signals

phase_lock : bufPLL
	Generic Map(
		ENABLE_SYNC => TRUE --false when driven by a buffG which is possible for ~300MHz cllk400 out..
	)
	port map (
		GCLK   => clk100(i),
		PLLIN  => clk400_PLL(i),
		locked => locked(i), 
		lock   => open,
		ioclk  => clk400_slv(i),
		serdesstrobe => ioce_slv(i) --place in the serdes2 primitive blocks
	);	

end generate;
--		
end Behavioral;
