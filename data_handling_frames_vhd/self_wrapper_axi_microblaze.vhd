----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:40:53 10/05/2018 
-- Design Name: 
-- Module Name:    self_wrapper_axi_microblaze - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;
use work.UtilityPkg.all;
use work.Eth1000BaseXPkg.all;
use work.GigabitEthPkg.all;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity self_wrapper_axi_microblaze is

port(

      -- User data paths in and out, including clocks and reset
      userClk            : in  sl;
      userRstIn          : in  sl;
      --userRstOut         : out sl;

		--Tx lines go out from here and are transfered to the S6 eth top module.
      userTxDataChannel  : out  slv(7 downto 0);
      userTxDataValid    : out  sl;
      userTxDataLast     : out  sl;
      userTxDataReady    : in sl;

      -- Rx data comes in on clk125 domain
		--Rx Data leaves here and goes in to the S6Ethtop Module..
      userRxDataChannel  : in slv(7 downto 0);
      userRxDataValid    : in sl;
      userRxDataLast     : in sl;
      userRxDataReady    : out  sl
);

end self_wrapper_axi_microblaze;

architecture Behavioral of self_wrapper_axi_microblaze is

		signal rst     : std_logic;
		signal rst_n   : std_logic;
		--signal rst_out : std_logic;
		signal clk     : std_logic;
      --signal clk_n   : std_logic;

		--all of the microblaze signals are internal to this loop..
		signal microblaze_0_S0_AXIS_TLAST_pins  : std_logic;
      signal microblaze_0_S0_AXIS_TDATA_pins  : std_logic_vector(31 downto 0);
      signal microblaze_0_S0_AXIS_TVALID_pins : std_logic;
      signal microblaze_0_S0_AXIS_TREADY_pins : std_logic;
      
		signal microblaze_0_M0_AXIS_TLAST_pins  : std_logic;
      signal microblaze_0_M0_AXIS_TDATA_pins  : std_logic_vector(31 downto 0);
      signal microblaze_0_M0_AXIS_TVALID_pins : std_logic;
      signal microblaze_0_M0_AXIS_TREADY_pins : std_logic;
		
		--microblaze output clock signal
		signal clock_generator_0_CLKOUT0_pins   : std_logic;

      signal userTxDataChannels : slv(7 downto 0);
      signal userTxDataValids   : sl;
      signal userTxDataLasts    : sl;
      signal userTxDataReadys   : sl;

      -- RX data comes in on clk125 domain
      signal userRxDataChannels : slv(7 downto 0);
      signal userRxDataValids   : sl;
      signal userRxDataLasts    : sl;
      signal userRxDataReadys   : sl;
		
		-- read from the fifos, but these signals are not currently hooked up to anything..
		signal S00_FIFO_DATA_COUNT_input_fifos  : STD_LOGIC_VECTOR(31 DOWNTO 0);
		signal S00_FIFO_DATA_COUNT_output_fifos : STD_LOGIC_VECTOR(31 DOWNTO 0);
		-- read from the fifos, but these signals are not currently hooked up to anything..
		signal M00_FIFO_DATA_COUNT_input_fifos  : STD_LOGIC_VECTOR(31 DOWNTO 0);
		signal M00_FIFO_DATA_COUNT_output_fifos : STD_LOGIC_VECTOR(31 DOWNTO 0);

COMPONENT AXIS_fifo_0
  PORT (
    ACLK : IN STD_LOGIC;
    ARESETN : IN STD_LOGIC;
    S00_AXIS_ACLK : IN STD_LOGIC;
    S00_AXIS_ARESETN : IN STD_LOGIC;
    S00_AXIS_TVALID : IN STD_LOGIC;
    S00_AXIS_TREADY : OUT STD_LOGIC;
    S00_AXIS_TDATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    S00_AXIS_TLAST : IN STD_LOGIC;
    M00_AXIS_ACLK : IN STD_LOGIC;
    M00_AXIS_ARESETN : IN STD_LOGIC;
    M00_AXIS_TVALID : OUT STD_LOGIC;
    M00_AXIS_TREADY : IN STD_LOGIC;
    M00_AXIS_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    M00_AXIS_TLAST : OUT STD_LOGIC;
	 S00_FIFO_DATA_COUNT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	 M00_FIFO_DATA_COUNT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

COMPONENT AXIS_fifo_1
  PORT (
    ACLK : IN STD_LOGIC;
    ARESETN : IN STD_LOGIC;
    S00_AXIS_ACLK : IN STD_LOGIC;
    S00_AXIS_ARESETN : IN STD_LOGIC;
    S00_AXIS_TVALID : IN STD_LOGIC;
    S00_AXIS_TREADY : OUT STD_LOGIC;
    S00_AXIS_TDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    S00_AXIS_TLAST : IN STD_LOGIC;
    M00_AXIS_ACLK : IN STD_LOGIC;
    M00_AXIS_ARESETN : IN STD_LOGIC;
    M00_AXIS_TVALID : OUT STD_LOGIC;
    M00_AXIS_TREADY : IN STD_LOGIC;
    M00_AXIS_TDATA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    M00_AXIS_TLAST : OUT STD_LOGIC;
	 S00_FIFO_DATA_COUNT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	 M00_FIFO_DATA_COUNT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
  );
  
END COMPONENT;


begin

--remember to map the ports to the signals!

		--note that the signal versions are followed by an s..
      -- User data paths in and out, including clocks and reset
      clk        <= userClk;
      rst        <= userRstIn;
		rst_n      <= not rst;
      --userRstOut <= rst_out;
		
		--write to the outputs.. --note that 's' endings are local signals..
      userTxDataChannel  <= userTxDataChannels;
      userTxDataValid    <= userTxDataValids;
      userTxDataLast     <= userTxDataLasts;
      userTxDataReadys   <= userTxDataReady;

      --read from the inputs..
      userRxDataChannels <= userRxDataChannel;
      userRxDataValids   <= userRxDataValid;
      userRxDataLasts    <= userRxDataLast;
      userRxDataReady    <= userRxDataReadys;
	
--begin instantiation of the AXIS IPs


--microblaze
microblaze_0 : entity work.microblaze_0_top
	port map (
 
			RESET              => rst_n, --the reset of the microblaze is actually active low..
			CLK                => clk,   --this is the 125MHz clk from the S6 core..
			
			--microblaze "inputs" keep in mind that the ready is reverse direction..	
			microblaze_0_S0_AXIS_TLAST_pin  => microblaze_0_S0_AXIS_TLAST_pins,
			microblaze_0_S0_AXIS_TDATA_pin  => microblaze_0_S0_AXIS_TDATA_pins,
			microblaze_0_S0_AXIS_TVALID_pin => microblaze_0_S0_AXIS_TVALID_pins,
			microblaze_0_S0_AXIS_TREADY_pin => microblaze_0_S0_AXIS_TREADY_pins,
			--microblaze "outputs"
			microblaze_0_M0_AXIS_TLAST_pin  => microblaze_0_M0_AXIS_TLAST_pins,
			microblaze_0_M0_AXIS_TDATA_pin  => microblaze_0_M0_AXIS_TDATA_pins,
			microblaze_0_M0_AXIS_TVALID_pin => microblaze_0_M0_AXIS_TVALID_pins,
			microblaze_0_M0_AXIS_TREADY_pin => microblaze_0_M0_AXIS_TREADY_pins,
			--100 MHz microblaze output clock..
			clock_generator_0_CLKOUT0_pin   => clock_generator_0_CLKOUT0_pins
      );
 
--FIFO input
AXIS_fifo_input : AXIS_fifo_0
  PORT MAP (
    ACLK             => clk,
    ARESETN          => rst_n,

	--input from user
    S00_AXIS_ACLK    => clk,
    S00_AXIS_ARESETN => rst_n,
    S00_AXIS_TVALID  => userRxDataValids,
    S00_AXIS_TREADY  => userRxDataReadys,
    S00_AXIS_TDATA   => userRxDataChannels,
    S00_AXIS_TLAST   => userRxDataLasts,
	--output to microblaze, make sure to run the microblaze port sides with a 100MHz clk..
    M00_AXIS_ACLK    => clock_generator_0_CLKOUT0_pins,
    M00_AXIS_ARESETN => rst_n,
	 M00_AXIS_TVALID  => microblaze_0_s0_AXIS_TVALID_pins,
    M00_AXIS_TREADY  => microblaze_0_s0_AXIS_TREADY_pins,
    M00_AXIS_TDATA   => microblaze_0_s0_AXIS_TDATA_pins,
    M00_AXIS_TLAST   => microblaze_0_s0_AXIS_TLAST_pins,
	 
	 S00_FIFO_DATA_COUNT => S00_FIFO_DATA_COUNT_input_fifos,	 
	 M00_FIFO_DATA_COUNT => M00_FIFO_DATA_COUNT_input_fifos
  );
  
--FIFO output 
AXIS_fifo_output : AXIS_fifo_1
  PORT MAP (
    ACLK             => clk,
    ARESETN          => rst_n,

	--input from microblaze, make sure to run the microblaze port sides with a 100MHz clk..
    S00_AXIS_ACLK    => clock_generator_0_CLKOUT0_pins,
    S00_AXIS_ARESETN => rst_n,
    S00_AXIS_TVALID  => microblaze_0_M0_AXIS_TVALID_pins,
    S00_AXIS_TREADY  => microblaze_0_M0_AXIS_TREADY_pins,
    S00_AXIS_TDATA   => microblaze_0_M0_AXIS_TDATA_pins,
    S00_AXIS_TLAST   => microblaze_0_M0_AXIS_TLAST_pins,
	--output to user
    M00_AXIS_ACLK    => clk,
    M00_AXIS_ARESETN => rst_n,
    M00_AXIS_TVALID  => userTxDataValids,
    M00_AXIS_TREADY  => userTxDataReadys,
    M00_AXIS_TDATA   => userTxDataChannels,
    M00_AXIS_TLAST   => userTxDataLasts,
	 
	 S00_FIFO_DATA_COUNT => S00_FIFO_DATA_COUNT_output_fifos,
	 M00_FIFO_DATA_COUNT => M00_FIFO_DATA_COUNT_output_fifos
  );
 


end Behavioral;

