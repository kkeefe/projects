----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:03:44 10/18/2018 
-- Design Name: 
-- Module Name:    data_processing_top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.UtilityPkg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_processing_top is
    Port ( 
			  --inputs from the ASIC / FPGA to take the DATA in..
			  clk               : in  STD_LOGIC;
			  clk125            : in  STD_LOGIC; --exists only for fifo eth clock..
           rst               : in  STD_LOGIC;
           input_pins        : in  STD_LOGIC_VECTOR(63 downto 0);
			  data_addr_bef	  : in  STD_LOGIC_VECTOR(3 downto 0);
			  data_addr_aft     : in  STD_LOGiC_VECTOR(3 downto 0);
			  --evtNumber         : out std_logic_vector(31 downto 0);
			  dataReady         : out std_logic;
           --outputs to send to the AXIS stream
			  output_data       : out STD_LOGIC_VECTOR(7 downto 0);
			  output_data_ready : in  std_logic;
			  output_data_last  : out std_logic;
			  output_data_valid : out std_logic;
			
			--reg control interfact
			-- Register interface to Microblaze IO module
				regAddr        : out slv(31 downto 0);
				--regAddrStrb    : out sl;
				--regWrStrb      : out sl;
				--regRdStrb      : out sl;
				--regReady       : in  sl;
				--regWrData      : out slv(31 downto 0);
				regRdData      : in  slv(31 downto 0)
				--regDataByteEn  : out slv(3 downto 0) 
		);

end data_processing_top;

architecture Behavioral of data_processing_top is

	--signals to speak between data ports and FSM
	signal data_inputs     : std_logic_vector(63 downto 0);
	signal data_addr_wr    : std_logic_vector(7 downto 0); --where the current writing is happening
	signal data_addr_hit   : std_logic_vector(7 downto 0); --address of a hit occuring
	signal data_addr_rd    : std_logic_vector(7 downto 0); --address the FSM is currently reading from
	signal phase_sel       : std_logic_vector(1 downto 0);
	signal trigger_outputs : std_logic_vector(63 downto 0);
	signal data_outputs    : std_logic_vector(63 downto 0);
  
  --new_hit
   signal new_hit         : std_logic;
	signal data_addr_befs  : std_logic_vector(3 downto 0);
	signal data_addr_afts  : std_logic_vector(3 downto 0);
  
  --read output signals to fifo
	signal evtDataValid    : std_logic;
	signal evtData         : std_logic_vector(31 downto 0);
	signal evtDataLast     : std_logic;
	signal evtFifoReady    : std_logic;
  
  --clks and rsts 
	signal clk100          : std_logic;
	signal clk400          : std_logic;
	signal rst_n           : std_logic;

	signal dataReadys      : std_logic;

begin


data_addr_befs <= data_addr_bef;
data_addr_afts <= data_addr_aft;

data_inputs <= input_pins;
dataReady   <= dataReadys;
rst_n       <= not rst;
------------------------------------------------------------------------------------------------------
------------------------------------------DATA IN-----------------------------------------------------
------------------------------------------------------------------------------------------------------
data_ports1 : entity work.data_ports 
	PORT MAP(
		CLK100         => clk100,
		CLK400         => clk400,
		RST            => rst,
		DATA_INPUT     => data_inputs,
		data_address   => data_addr_rd, --current reading address
		phase_sel      => phase_sel,
		data_addr_out  => data_addr_wr, --current writing address
		TRIGGER_OUTPUT => trigger_outputs,
		DATA_OUTPUT    => data_outputs
	);
------------------------------------------------------------------------------------------------------
------------------------------------------FSM / EthPackets--------------------------------------------
------------------------------------------------------------------------------------------------------
read_out_data1 : entity work.read_out_data 
	PORT MAP(
		clk100            => clk100,
		rst               => rst,
		new_trigger       => new_hit,
		--addr_wr is where the BRAM is currently writting..
		data_read_in      => data_outputs, 
		data_addr_hit     => data_addr_hit,
		data_phase_out    => phase_sel,
		--this is the address that the read_out_data is reading from to send to the AXIS stream..
		data_read_out     => data_addr_rd, 
		data_addr_bef     => data_addr_befs,
		data_addr_aft     => data_addr_afts,		
		--evtCount          => evtNumber,
		--outputs to fifo
		evtDataValid      => evtDataValid,
		evtData           => evtData,
		evtDataLast       => evtDataLast,
		evtFifoReady      => evtFifoReady,
		--data is ready to ready
		dataReady         => dataReadys
	);

------------------------------------------------------------------------------------------------------
------------------------------------TRIGGER / ADDRESS SELECT------------------------------------------
------------------------------------------------------------------------------------------------------

trigger_addr_sel1 : entity work.trigger_addr_sel 
	PORT MAP(
		clk100        => clk100,
		rst           => rst,
		trigger_input => trigger_outputs,
		addr_in       => data_addr_wr,
		addr_out      => data_addr_hit,
		new_hit       => new_hit 
	);

------------------------------------------------------------------------------------------------------
------------------------------------------FIFO OUT----------------------------------------------------
------------------------------------------------------------------------------------------------------
axis_fifo1 : entity work.axis_fifo
  PORT MAP (
    ACLK             => clk100,
    ARESETN          => rst_n,
    --output data which contains the entire ethernet frame..
	 S00_AXIS_ACLK    => clk100,
    S00_AXIS_ARESETN => rst_n,
    S00_AXIS_TVALID  => evtDataValid,
    S00_AXIS_TREADY  => evtFifoReady,
    S00_AXIS_TDATA   => evtData,
    S00_AXIS_TLAST   => evtDataLast,
    --output values to the ethernet
	 M00_AXIS_ACLK    => clk125,
    M00_AXIS_ARESETN => rst_n,
    M00_AXIS_TVALID  => output_data_valid,
    M00_AXIS_TREADY  => output_data_ready,
    M00_AXIS_TDATA   => output_data,
    M00_AXIS_TLAST   => output_data_last
 );
------------------------------------------------------------------------------------------------------
------------------------------------------clk gen---------------------------------------------------------
------------------------------------------------------------------------------------------------------
clk_gen1: entity work.clk_gen
  port map
   (-- Clock in ports
    CLK_IN1  => CLK,
    -- Clock out ports
    CLK_OUT1 => clk100,
    CLK_OUT2 => clk400,
    RESET    => rst
	 );
 -- Status and control signals



end Behavioral;

