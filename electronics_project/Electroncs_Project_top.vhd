----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kevin Keefe
-- 
-- Create Date:    13:27:51 11/26/2018 
-- Design Name:         PHYS475L - Semester Project
-- Module Name:    Electroncs_Project_top - Behavioral 
-- Project Name: Mass
-- Target Devices: SL9
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

entity Electroncs_Project_top is
  Port (
    --"global" inputs
    CLK         : in    STD_LOGIC;
    RST_N       : in    STD_LOGIC;
    LED         : out   std_logic_vector(7 downto 0);
    --io shield interfaces
    IO_LED      : out   std_logic_vector(23 downto 0);
    IO_DIP      : in    std_logic_vector(23 downto 0);
    IO_SEG      : out   std_logic_vector(7 downto 0);
    IO_SEL      : inout std_logic_vector(3 downto 0);
    IO_BUTTON   : in    std_logic_vector(4 downto 0);
    --avr interface
    CCLK        : in    STD_LOGIC;
    AVR_TX      : in    STD_LOGIC;
    AVR_RX      : out   STD_LOGIC;
    AVR_RX_BUSY : in    STD_LOGIC;
    SPI_MISO    : out   STD_LOGIC;
    SPI_MOSI    : in    STD_LOGIC;
    SPI_SCK     : in    STD_LOGIC;
    SPI_SS      : in    STD_LOGIC;
    SPI_CHANNEL : out   std_logic_vector(3 downto 0);
    --adc interface 
    ADC_SDATA   : in    STD_LOGIC;
    ADC_DIN		 : out 	STD_LOGIC;
    ADC_CS_N    : out   STD_LOGIC;
    --dac interface
    DAC_SYNC_N  : out   STD_LOGIC;
    DAC_SDIN    : out   STD_LOGIC;
    --comparator interface
    comp_Q      : in    STD_LOGIC;
    comp_Q_n    : in    STD_LOGIC
    );

end Electroncs_Project_top;

architecture Behavioral of Electroncs_Project_top is

  --clk signals 
  constant adc_freq : integer := 100000; --set the frequencies of the adc and dac SCLKs here
  constant dac_freq : integer := 100000;
  signal sclk_dac : std_logic := '0';
  signal sclk_adc : std_logic := '0';
  signal rst      : std_logic;

  --ADC and DAC signals
  signal ADC_digital_read      : std_logic_vector(11 downto 0);
  signal DAC_digital_threshold : std_logic_vector(11 downto 0) := (others => '0');
  signal new_hit               : std_logic;
  signal channel_sel           : std_logic;
  signal evt_count             : std_logic_vector(11 downto 0);

  --comparator signals
  --signal use_latch : std_logic :
  signal MC_word   : std_logic_vector(11 downto 0);

  --bcd signals
  signal bcdinput  : std_logic_vector(11 downto 0);
  signal bcdoutput : std_logic_vector(15 downto 0);

  --SSD signals
  signal display : std_logic_vector(15 downto 0);
  
  --avr signals
  signal channel        : std_logic_vector(3 downto 0);
  signal new_sample     : std_logic;
  signal sample         : std_logic_vector(9 downto 0);
  signal sample_channel : std_logic_vector(3 downto 0);
  --signal tx_data        : std_logic_vector(7 downto 0);
  --signal new_tx_data    : std_logic;
  signal tx_busy  	   : std_logic;
  signal tx_block 		: std_logic;
  signal rx_data  		: std_logic_vector(7 downto 0);
  signal new_rx_data  	: std_logic;
  
begin

 
  rst <= not rst_n;
  channel_sel <= io_dip(12);
  
  ADC7276_readout : entity work.ADC7276_readout PORT MAP(
    clk            => sclk_adc,
    rst 				 => rst,
    --sclk           => sclk_adc,           --requires a 48 MHz clk
    sdata          => ADC_SDATA,
    sdout 			 => ADC_DIN,
    cs_n           => ADC_CS_N,
    begin_read     => new_hit,
    channel_sel    => channel_sel,
    evt_count      => evt_count,
    digital_output => ADC_digital_read
    );

  DAC_digital_threshold <= io_dip(11 downto 0);

  DAC5621_interface : entity work.DAC5621_interface PORT MAP(
    clk                   => sclk_dac,
    rst                   => rst,
    --sclk                  => sclk_dac,    --requires a 30 MHz clk
    sdin                  => DAC_SDIN,
    sync_n                => DAC_SYNC_N,
    DAC_digital_threshold => DAC_digital_threshold,
    update_dac            => io_dip(13)
    );

  ADCMP566_comparator : entity work.ADCMP566_comparator PORT MAP(
    clk     => clk,
    Q       => comp_Q,
    Q_n     => comp_Q_n,
    new_hit => new_hit
    );

  conv_BinaryToDecimal : entity work.BinaryToDecimal PORT MAP(
    bcdinput  => bcdinput,
    bcdoutput => bcdoutput
    );

  SSD_display : entity work.SSD_display PORT MAP (
    clk     => clk,
    product => display,
    io_sel  => io_sel,
    io_seg  => io_seg
    );

  clk_gen_freq : process(clk, sclk_adc, sclk_dac)  
    variable adc_clk_rate : integer range 0 to 50000000/adc_freq;
    variable dac_clk_rate : integer range 0 to 50000000/dac_freq;
  begin
    if(rising_edge(clk)) then
      adc_clk_rate := adc_clk_rate + 1;
      dac_clk_rate := dac_clk_rate + 1;

      if dac_clk_rate = 0 then
        sclk_dac <= not sclk_dac;
      end if;
      
      if adc_clk_rate = 0 then 
        sclk_adc <= not sclk_adc;
      end if;
    end if;
  end process;

  MC_word <= io_dip(23 downto 12);
  
  SSD_read_select: entity work.SSD_read_select PORT MAP(
    clk => clk,
    rst => rst,
    io_button => io_button,
    dac_digital_threshold => dac_digital_threshold,
    adc_digital_read => adc_digital_read,
    evt_count => evt_count,
    MC_word => MC_word,
    bcdinput => bcdinput
    );

	avr_interface : entity work.avr_interface PORT MAP(
		clk 	=> clk,
		rst 	=> rst,
		cclk 	=> cclk,

		spi_miso 	=> spi_miso,
		spi_mosi 	=> spi_mosi,
		spi_sck 		=> spi_sck,
		spi_ss 		=> spi_ss,
		spi_channel => spi_channel,
		
		tx => avr_rx,
		rx => avr_tx,
		
		channel        => channel,
		new_sample     => new_sample,
		sample         => sample,
		sample_channel => sample_channel,
		
		tx_data 		=> "00000000",
		new_tx_data => '0',
		tx_busy 		=> tx_busy,
		tx_block 	=> avr_rx_busy,
		
		rx_data 		=> rx_data,
		new_rx_data => new_rx_data 
	);



-------------------------------------------------------------------------------

  display <= bcdoutput;
  io_led  <= io_dip;
  led     <= (others => '0');

end Behavioral;

