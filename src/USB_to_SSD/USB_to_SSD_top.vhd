----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:56:35 10/14/2018 
-- Design Name: 
-- Module Name:    USB_to_SSD_top - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity USB_to_SSD_top is
    Port (
	 
	--MOJO BOARD PORTS:
	--inputs
	clk, cclk, rst_n          : in STD_LOGIC;
	avr_tx, avr_rx_busy 		  : in STD_LOGIC;
	spi_mosi, spi_ss, spi_sck : in STD_LOGIC;
	--outputs
	led              : out STD_LOGIC_VECTOR(7 downto 0);
	avr_rx, spi_miso : out STD_LOGIC;
	spi_channel      : out STD_LOGIC_VECTOR (3 downto 0);	
	
	--io shield ports
	io_dip    : in STD_LOGIC_VECTOR(23 downto 0);
	io_button : in STD_LOGIC_VECTOR(4 downto 0);
	io_sel    : inout STD_LOGIC_VECTOR(3 downto 0);
	io_seg    : out STD_LOGIC_VECTOR(7 downto 0);
	io_led    : out STD_LOGIC_VECTOR(23 downto 0)

);

end USB_to_SSD_top;

architecture Behavioral of USB_to_SSD_top is

	signal rst : std_logic;

--BCD, SSD, and adder signals
	signal bcdoutput : STD_LOGIC_VECTOR (15 downto 0);
	signal bcdinput : STD_LOGIC_VECTOR (11 downto 0); --bcd has 12 bit input, and 16 bit output. 
	signal ssdinput : STD_LOGIC_VECTOR (15 downto 0);

--ADC sample readings and output
	signal channel, sample_channel : STD_LOGIC_VECTOR (3 downto 0);
	signal new_sample : STD_LOGIC;
	signal sample : STD_LOGIC_VECTOR (9 downto 0);

--AVR READINGS!
	signal tx_data     : STD_LOGIC_VECTOR(7 downto 0);	
	signal new_tx_data : STD_LOGIC;
	signal tx_busy     : STD_LOGIC;
	signal tx_block 	 : STD_LOGIC;

	signal rx_data 	 : STD_LOGIC_VECTOR(7 downto 0);
	signal new_rx_data : STD_LOGIC;

--input_process signals 
signal triggeR_input : std_logic_vector(7 downto 0);
signal read_out      : std_logic_vector(7 downto 0);
signal new_measure   : std_logic;

begin

--assign signals to the top level ports:
rst         <= not rst_n; -- what is the purpose of these kinds of resets anyways????
io_led      <= io_dip;
tx_data     <= read_out;
new_tx_data <= new_measure;

AVR : entity work.avr_interface port map (
		clk  => clk,
		rst  => rst,									
		cclk => cclk,								
		
		spi_miso    => spi_miso,
		spi_mosi    => spi_mosi,
		spi_sck     => spi_sck,
		spi_ss      => spi_ss,
		spi_channel => spi_channel,
		
		tx => avr_rx,
		rx => avr_tx,
		
		channel        => channel,
		new_sample     => new_sample,
		sample         => sample,
		sample_channel => sample_channel,
		
		tx_data     => tx_data,			
		new_tx_data => new_tx_data,				
		tx_busy     => tx_busy,					
		tx_block    => avr_rx_busy,		
		
		rx_data     => rx_data,					
		new_rx_data => new_rx_data
		);		

--read from the avr to the sync bit!
trigger_input <= rx_data; 

input_process : entity work.tranLoc_TOP 
	GENERIC MAP (		
		input_size  => 8,
		output_size => 8	
	)
	PORT MAP (
		
		CLOCK => clk,
		RESET => rst,
		TRIGGER_INPUT => trigger_input,
		READ_OUT 	  => read_out,
		NEW_MEASURE	  => new_measure
		
	);
--send the read data only when it is new!
process(new_measure, clk, rst) begin
	if(rising_edge(clk)) then
		if(new_measure = '1') then
			bcdinput <= "0000" & read_out;
			led (7 downto 0) <= (others => '0');
		elsif(new_measure = '0') then
			led(7 downto 0) <= (others => '1');
	end if;
 end if;
end process;


BCD : entity work.BinaryToDecimal port map (				--converts 12 bit binary to decimal
		bcdinput  => bcdinput,									
		bcdoutput => bcdoutput
);								

--send the decimal number to the ssd screen
ssdinput <= bcdoutput;

SSD : entity work.SSD_display port map (					--projects input (product) to SSD
		clk     => clk,
		product => ssdinput,
		io_sel  => io_sel,
		io_seg  => io_seg
	);



end Behavioral;

