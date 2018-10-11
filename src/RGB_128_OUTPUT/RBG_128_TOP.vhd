----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:40:01 08/09/2018 
-- Design Name: 
-- Module Name:    RBG_128_TOP - Behavioral 
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

entity RBG_128_TOP is
	
port (	
	--what the RGB will read from
	--INPUT : in STD_LOGIC_VECTOR(31 downto 0);
	
	--clk, with spi and avr std logics
	clk, cclk, rst_n, spi_mosi, spi_ss, spi_sck, avr_tx, avr_rx_busy : in STD_LOGIC;
	avr_rx, spi_miso : out STD_LOGIC;
	spi_channel : out STD_LOGIC_VECTOR (3 downto 0);
	
	--clock shield / audio analyzer; this is where the rbg outputs
	clock_up, clock_down, clock_select : in STD_LOGIC;
	clock_d1_c : out STD_LOGIC_VECTOR(7 downto 0);
	clock_d2_c : out STD_LOGIC_VECTOR(7 downto 0);
	clock_d1_b : out STD_LOGIC_VECTOR(7 downto 0);
	clock_d2_b : out STD_LOGIC_VECTOR(7 downto 0);
	clock_d1_g : out STD_LOGIC_VECTOR(7 downto 0);
	clock_d2_g : out STD_LOGIC_VECTOR(7 downto 0);
	clock_d1_r : out STD_LOGIC_VECTOR(7 downto 0);
	clock_d2_r : out STD_LOGIC_VECTOR(7 downto 0);
	
--	--mojo board / io shield ports
--	io_dip : in STD_LOGIC_VECTOR(23 downto 0);
--	io_button : in STD_LOGIC_VECTOR(4 downto 0);
--	io_sel : inout STD_LOGIC_VECTOR(3 downto 0);
--	io_seg : out STD_LOGIC_VECTOR(8 downto 0);
	led : out STD_LOGIC_VECTOR(7 downto 0)
--	io_led : out STD_LOGIC_VECTOR(23 downto 0)

);

end RBG_128_TOP;

architecture Behavioral of RBG_128_TOP is

--type cell is ARRAY(15 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
--
--signal x : cell;
signal hit_in    : STD_LOGIC_VECTOR (127 downto 0);
signal red_hit   : STD_LOGIC_VECTOR (15 downto 0);
signal blue_hit  : STD_LOGIC_VECTOR (15 downto 0);
signal green_hit : STD_LOGIC_VECTOR (15 downto 0);

--BCD, SSD, and adder signals
signal bcdoutput : STD_LOGIC_VECTOR (15 downto 0);
signal bcdinput  : STD_LOGIC_VECTOR (11 downto 0); --bcd has 12 bit input, and 16 bit output. 
signal ssdinput  : STD_LOGIC_VECTOR (15 downto 0);

--ADC sample readings and output
signal channel, sample_channel : STD_LOGIC_VECTOR (3 downto 0);
signal new_sample, rst : STD_LOGIC;
signal sample 			  : STD_LOGIC_VECTOR (9 downto 0);
signal output 			  : STD_LOGIC_VECTOR (7 downto 0);

--avr readings and output
signal d_tx_data, q_tx_data: STD_LOGIC_VECTOR(7 downto 0); --data that is sent or written
signal new_tx_data 			: STD_LOGIC;				        --pulse is '1' when want to send tx_data
signal tx_busy     			: STD_LOGIC;					     --'1' when transmitter is busy. Will cause AVR to ignore new data
signal tx_block   		   : STD_LOGIC;    					  --
signal d_rx_data, q_rx_data: STD_LOGIC_VECTOR(7 downto 0); --serial interface to avr, byte of data
signal new_rx_data 			: STD_LOGIC;					 	  --when '1', rx_data is valid

begin

--connect port RBG to signals
clock_d1_c <= hit_in(15 downto 8); clock_d2_c <= hit_in(7 downto 0);
clock_d1_r <= red_hit(15 downto 8); clock_d2_r <= red_hit(7 downto 0);
clock_d1_g <= green_hit(15 downto 8); clock_d2_g <= green_hit(7 downto 0);
clock_d1_b <= blue_hit(15 downto 8); clock_d2_b <= blue_hit(7 downto 0);

BCD : entity work.BinaryToDecimal port map (				--converts 12 bit binary to decimal
		bcdinput => bcdinput,									
		bcdoutput => bcdoutput);								

AVR : entity work.avr_interface port map (				--instantiate avr module
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
		tx_data => d_rx_data,			
		new_tx_data => new_tx_data,				
		tx_busy => tx_busy,					
		tx_block => avr_rx_busy,		
		rx_data => d_tx_data,					
		new_rx_data => new_rx_data);		

--lights up from adc sample output
bcdinput(9 downto 0) <= sample; --sample is written to bcd input to display on SSD

ssdinput <= bcdoutput; 

process(clk, rst) begin
	if(rst = '1') then
		q_rx_data <= "00000000";
		q_tx_data <= "00000000";
	elsif rising_edge(clk) then
		if(new_rx_data = '1') then
			q_tx_data <= d_tx_data;
			q_rx_data <= d_rx_data;
  end if;
 end if;
end process;

--led <= q_rx_data;
red_hit(7 downto 0)  <= q_rx_data;
blue_hit(7 downto 0) <= q_tx_data;
hit_in(15 downto 8)  <= q_rx_data;
hit_in(7 downto 0)   <= q_tx_data;

end Behavioral;

