----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kevin Keefe
-- 
-- Create Date:    12/2/2018
-- Design Name: 
-- Module Name:    spi_slave_control - Behavioral 
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

entity spi_slave_control is
  generic(
    CLK_RATE         : integer := 50000000;
    SERIAL_BAUD_RATE : integer := 500000;
    )
    Port (
      clk  : in  std_logic;
      rst  : in  std_logic;
      ss   : in  std_logic;
      mosi : in  std_logic;
      miso : out std_logic;
      sck  : in  std_logic;
      done : out std_logic;
      din  : in  std_logic_vector(7 downto 0);
      dout : out std_logic_vector(7 downto 0)
      );
end spi_slave_control;

architecture Behavioral of spi_slave_control is

  type spi_transfer is record
    ss       : std_logic;
    mosi     : std_logic;
    miso     : std_logic;
    sck      : std_logic;
    done     : std_logic;
    sck_old  : std_logic;
    data     : std_logic_vector(7 downto 0);
    data_out : std_logic_vector(7 downto 0);
    bit_ctr  : std_logic_vector(2 downto 0);
  end record;

  constant spi_init : spi_transfer := (
    ss       => '0',
    mosi     => '0',
    miso     => '1',
    sck      => '0',
    done     => '0',
    sck_old  => '0',
    data     => (others => '0'),
    data_out => (others => '0'),
    bit_ctr  => (others => '0')
    );

  signal r   : spi_transfer := spi_init;
  signal rin : spi_transfer := spi_init;
  
begin

  spi_fsm : process(ss, rst, mosi, sck, din) is
    variable v : spi_transfer := spi_init;
  begin

    v.ss       := ss;
    v.mosi     := mosi;
    v.miso     := r.miso;
    v.sck      := sck;
    v.sck_old  := r.sck;
    v.data     := r.data;
    v.done     := '0';
    v.data_out := r.data_out;
    v.bit_ctr  := r.bit_ctr;
    
    if(r.ss = '1') then
      v.bit_ctr := "000";
      v.data   := din;
      v.miso   := r.data(7);
    else if(!r.sck_old and r.sck) then
           v.data    := r.data(6 downto 0) & r.mosi;
           v.bit_ctr := r.bit_ctr + 1;
           if(r.bit_ctr = "111") then
             v.data_out := r.data(6 downto 0) & r.mosi;
             v.done     := '1';
             v.data     := din;
           end if;
    else if(r.sck_old and not r.sck) then
           v.miso := r.data(7)
         end if;
    end if;

    if(rst = '1') then
      v := spi_init;
    end if;

    done <= r.done;
    dout <= r.data_out;
    miso <= r.miso;
    rin <= v;

  end process;

--don't forget to update the reading signal
    seq : process (clk) is
    begin
      if (rising_edge(clk)) then
        r <= rin;
      end if;
    end process seq;
    
end Behavioral;


