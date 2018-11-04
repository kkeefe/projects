----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:06:47 03/02/2018 
-- Design Name: 
-- Module Name:    signal_display_top - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity signal_display_top is 
	Generic(n : integer := 8); --used in adder, for n bit adder
	port (
	
	--clk, with spi and avr std logics
	clk, cclk, rst_n, spi_mosi, spi_ss, spi_sck, avr_tx, avr_rx_busy : in STD_LOGIC;
	avr_rx, spi_miso : out STD_LOGIC;
	spi_channel : out STD_LOGIC_VECTOR (3 downto 0);
	
	--mojo board / io shield ports
	io_dip : in STD_LOGIC_VECTOR(23 downto 0);
	io_button : in STD_LOGIC_VECTOR(4 downto 0);
	io_sel : inout STD_LOGIC_VECTOR(3 downto 0);
	io_seg : out STD_LOGIC_VECTOR(8 downto 0);
	led : out STD_LOGIC_VECTOR(7 downto 0);
	io_led : out STD_LOGIC_VECTOR(23 downto 0)
	);

end signal_display_top;

architecture Behavioral of signal_display_top is

--BCD, SSD, and adder signals
signal sum : STD_LOGIC_VECTOR (8 downto 0);
signal bcdoutput : STD_LOGIC_VECTOR (15 downto 0);
signal bcdinput : STD_LOGIC_VECTOR (11 downto 0); --bcd has 12 bit input, and 16 bit output. 
signal ssdinput : STD_LOGIC_VECTOR (15 downto 0);

--ADC sample readings and output
signal channel, sample_channel : STD_LOGIC_VECTOR (3 downto 0);
signal new_sample, rst : STD_LOGIC;
signal sample : STD_LOGIC_VECTOR (9 downto 0);
signal output : STD_LOGIC_VECTOR (7 downto 0);
	
begin


BCD : entity work.BinaryToDecimal port map (				--converts 12 bit binary to decimal
		bcdinput => bcdinput,									
		bcdoutput => bcdoutput);								

SSD : entity work.SSD_display port map (					--projects input (product) to SSD
		clk => clk,
		product(15 downto 0) => ssdinput(15 downto 0),
		io_sel(3 downto 0) => io_sel(3 downto 0),
		io_seg(7 downto 0) => io_seg(7 downto 0));

AVR : entity work.avr_interface port map (
		clk => clk,
		rst => rst,									
		cclk => cclk,								
		spi_miso => spi_miso,
		spi_mosi => spi_mosi,
		spi_sck => spi_sck,
		spi_ss => spi_ss,
		spi_channel => spi_channel,
		tx => avr_rx,
		rx => avr_tx,
		channel => channel,
		new_sample => new_sample,
		sample => sample,
		sample_channel => sample_channel,
		tx_data => "00000000",			--data that is sent or written
		new_tx_data => '0',				--pulse is '1' when want to send tx_data
		tx_busy => open,					--'1' when transmitter is busy. Will cause AVR to ignore new data
		tx_block => avr_rx_busy,		--
		rx_data => open,					--serial interface to avr, byte of data
		new_rx_data => open);			--when '1', rx_data is valid

io_led <= io_dip;  --lights up io_shield leds with dip switches 	
led <= sample(7 downto 0); --mojo base board lights up from adc sample output
bcdinput(9 downto 0) <= sample; --sample is written to bcd input to display on SSD

with io_button select 
ssdinput <= "0000000" & sum when "10000" | "01000" | "00100",	--sum is only 9 bits
				bcdoutput when others; 

end Behavioral;

