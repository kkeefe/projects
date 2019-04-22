----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:40:32 11/26/2018 
-- Design Name: 
-- Module Name:    ATmeg32U4_microcontroller - Behavioral 
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

entity ATmeg32U4_microcontroller is
  generic(
    CLK_RATE         : integer := 50000000;
    SERIAL_BAUD_RATE : integer := 500000;
    )
    Port (

      cclk : in STD_LOGIC;

      --spi I/O
      // AVR SPI Signals
      spi_miso    : out STD_LOGIC;
      spi_mosi    : in  STD_LOGIC;
      spi_sck     : in  STD_LOGIC;
      spi_ss      : in  STD_LOGIC;
      ss_fpga     : in  STD_LOGIC;
      spi_channel : out STD_LOGIC;

      --avr signals
      avr_tx : in  STD_LOGIC;
      avr_rx : out STD_LOGIC;

      --adc signals
      channel        : in  std_logic_vector(3 downto 0);
      new_sample     : out std_logic;
      sample         : out std_logic_vector(9 downto 0);
      sample_channel : out std_logic_vector(3 downto 0);

      --serial tx interface
      tx_data     : in  std_logic_vector(7 downto 0);
      new_tx_data : in  std_logic;
      tx_busy     : out std_logic;
      tx_block    : out std_logic;

      --serial rx interface
      rx_data     : out std_logic_vector(7 downto 0);
      new_rx_data : out std_logic
      );
end ATmeg32U4_microcontroller;

architecture Behavioral of ATmeg32U4_microcontroller is

  constant CLK_PER_BIT : integer := CLK_RATE / SERIAL_BAUD_RATE;

  signal ready    : std_logic;
  signal n_rdy    : std_logic := not ready;
  signal spi_done : std_logic;
  signal spi_dout : std_logic_vector(7 downto 0);

  signal tx_m       : std_logic;
  signal spi_miso_m : std_logic;

  signal byte_ct_d, byte_ct_q               : std_logic;
  signal sample_d, sample_q                 : std_logic_vector(9 downto 0);
  signal new_sample_d, new_sample_q         : std_logic;
  signal sample_channel_d, sample_channel_q : std_logic_vector(3 downto 0);
  signal block_d, block_q                   : std_logic_vector(3 downto 0);
  signal busy_d, busy_q                     : std_logic;

begin

--assign signals to top level ports
  new_sample     <= new_sample_q;
  sample         <= sample_q;
  sample_channel <= sample_channel_q;

  update_avr_usb : process(byte_ct_d, sample_d, new_sample_d, sample_channel_d, busy_d, block_d) is
  begin
    byte_ct_d        <= byte_ct_q;
    sample_d         <= sample_q;
    new_sample_d     <= '0';
    sample_channel_d <= sample_channel_q;
    busy_d           <= busy_q;
    block_d          <= block_q(2 downto 0) & tx_block;
    if(block_q(3) xor block_q(2)) then
      busy_d <= '0';
    end if;
    if(!tx_busy and new_tx_data) then
      busy_d <= '1';
    end if;
    if(spi_ss) then
      byte_ct_d <= '0';
    end if;
    if(spi_done = '1') then
      if(byte_ct_d = '0') then
        sample_d  <= spi_dout;
        byte_ct_d <= '1';
      else
        sample_d(9 downto 0) <= spi_dout(1 downto 0);
        sample_channel_d     <= spi_dout(7 downto 4);
        byte_ct_d            <= '1';
        new_sample_d         <= '1';
      end if;
    end if;
  end process;

  update_regs : process(clk) is
  begin
    if(rising_edge(clk))then
      if(n_rdy) then
        byte_ct_q    <= '0';
        sample_q     <= (others => '0');
        new_sample_q <= '0';
      else
        byte_ct_q    <= byte_ct_d;
        sample_q     <= sample_d;
        new_sample_q <= new_sample_d;
      end if;
    end if;
    block_q          <= block_d;
    busy_q           <= busy_d;
    sample_channel_q <= sample_channel_d;
  end process;

  cclk_detect : entity work.cclk_detect
    port map (
      clk   => clk,
      rst   => rst,
      cclk  => cclk,
      ready => ready
      );

  spi_slave_fsm : entity work.spi_slave_control
    port map (
      clk  => clk,
      rst  => n_rdy,
      ss   => spi_ss,
      mosi => spi_mosi,
      miso => spi_miso,
      sck  => spi_sck,
      done => spi_done,
      din  => x"ff",
      dout => spi_dout
      );

  serial_rx_fsm : entity work.serial_rx_fsm
    port map (
      clk      => clk,
      rst      => n_rdy,
      rx       => rx,
      data     => rx_data,
      new_data => new_rx_data
      );

  serial_tx_fsm : entity work.serial_tx_fsm
    port map (
      clk      => clk,
      rst      => n_rdy,
      block_tx => busy_q,
      busy     => tx_busy,
      tx       => tx_m,
      data     => tx_data,
      new_data => new_tx_data
      );

end Behavioral;

