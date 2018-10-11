----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:22:59 05/16/2018 
-- Design Name: 
-- Module Name:    SPI_top - Behavioral 
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

entity SPI_top is
    Port ( --mojo2.ucf clk, rst, and cclk, led
			  clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           cclk : in  STD_LOGIC;
			  led : out STD_LOGIC_VECTOR(7 downto 0);
           --avr inputs
			  avr_rx_busy : in  STD_LOGIC;
           spi_mosi : in  STD_LOGIC;
           spi_ss : in  STD_LOGIC;
			  spi_sck : in STD_LOGIC;
           avr_tx : in  STD_LOGIC;
			  --avr outputs
			  spi_channel : out  STD_LOGIC_VECTOR (3 downto 0);
           avr_rx : out  STD_LOGIC;
			  spi_miso : out  STD_LOGIC;
			  --clock shield
			  clock_up : in STD_LOGIC;
			  clock_down : in STD_LOGIC;
			  clock_select : in STD_LOGIC;
			  clock_d1_c : out STD_LOGIC_VECTOR (7 downto 0)
           );
end SPI_top;

architecture Behavioral of SPI_top is

--unused ADC signals --

signal new_sample : STD_LOGIC;								 --'1' indicates new ADC sample
signal sample : STD_LOGIC_VECTOR (9 downto 0); 			 --data that the ADC reads
signal sample_channel : STD_LOGIC_VECTOR (3 downto 0); --decides which port to read from ADC
signal channel : STD_LOGIC_VECTOR (3 downto 0);        --data to read from ADC

-------------Signals to communicate with the AVR-----------


signal new_tx_data, new_rx_data, tx_busy : STD_LOGIC;	 --'1' indicates new SPI data
signal tx_data, rx_data : STD_LOGIC_VECTOR (7 downto 0);

-------------data to be written to the RAM-------------------

signal data_out : STD_LOGIC_VECTOR (7 downto 0); 
signal data_in  : STD_LOGIC_VECTOR (7 downto 0);
signal addr 	 : integer range 0 to 15;

begin

-----------instantiate AVR and RAM modules-------------------------------------

AVR : entity work.avr_interface port map (
		
		--mojo connections--
		clk => clk,
		rst => rst,									
		cclk => cclk,								
		
		--avr spi signals--
		spi_miso => spi_miso,
		spi_mosi => spi_mosi,
		spi_sck => spi_sck,
		spi_ss => spi_ss,
		spi_channel => spi_channel,
		
		--serial signals--
		tx => avr_rx, --input to fpga
		rx => avr_tx, --output to fpga
		
		---ADC INTERFACE----UNUSED
		channel => channel,
		new_sample => new_sample,
		sample => sample,
		sample_channel => sample_channel,
		
		----Rx and Tx User Interface----
		tx_data => tx_data,		   	--8 bit input to AVR
		new_tx_data => new_tx_data,	--pulse is '1' when want to receive tx_data
		tx_busy => tx_busy,				--'1' when transmitter is busy. Will cause AVR to ignore new data
		tx_block => avr_rx_busy,		--to AVR, '1' if tx busy
		rx_data => rx_data,				--8 bit input from avr to FPGA
		new_rx_data => new_rx_data);	--when '1', rx_data is valid

--UNUSED VALUES SET TO ZERO BITS--
channel <= "0000";
new_sample <= '0';
sample <= "0000000000";
sample_channel <= "0000";


RAM : entity work.RAM_module port map (
	wr_ena => new_rx_data,  
	clk => clk,
	addr => addr,
	data_in => data_in,
	data_out => data_out);


-----------------------------tell RAM and AVR to communicate----------------------------------

	
--avr receives data new data, tell it to write (transfer/tx) to ram--
process(new_tx_data, clk) 

--reset the count every clock cycle
Variable Count : integer range 0 to 50000000; -- only update the signals once a second

begin 
	if(clk'event and clk='1') then
		Count := Count + 1;
		if(new_tx_data = '1' and Count > 249999999) then
			data_in <= tx_data;
			addr <= addr + 1; -- after you write go to the next spot
		end if;
	end if;
end process;

--avr RECEIVES new data -- write to the RAM module

process(new_rx_data, clk) 
	
Variable Count : integer range 0 to 50000000;

begin	
	if(clk'event and clk='1') then
		if(new_rx_data = '1' and Count < 25000000) then
			data_in <= rx_data;
			addr <= addr + 1;
		end if;
	end if;
end process;




--led on mojo board to debug, pin 4 is 'clock_up'
led <= data_out;
clock_d1_c <= tx_data;


end Behavioral;

