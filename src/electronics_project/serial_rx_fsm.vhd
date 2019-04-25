----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kevin Keefe
-- 
-- Create Date:    12/2/2018
-- Design Name: 
-- Module Name:    serial_rx_fsm - Behavioral 
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

entity serial_rx_fsm is
  generic(
    CLK_RATE         : integer := 50000000;
    SERIAL_BAUD_RATE : integer := 500000;
    )
    Port (
      clk      : in  std_logic;
      rst      : in  std_logic;
      rx       : out std_logic;
      data     : in  std_logic_vector(7 downto 0);
      new_data : in  std_logic
      );
end serial_rx_fsm;

architecture Behavioral of serial_rx_fsm is

  constant CTR_SIZE = $clog2(CLK_RATE/SERIAL_BAUD_RATE);

  type StateType is (ST_IDLE, ST_WAIT_HALF, ST_WAIT_FULL, ST_WAIT_HIGH);

  type rx_transfer is record
    state    : StateType;
    rx       : std_logic;
    data     : std_logic_vector(7 downto 0);
    bit_ctr  : std_logic_vector(2 downto 0);
    new_data : std_logic;
    ctr      : std_logic;
  end record;

  constant rx_init : rx_transfer := (
    state    => ST_IDLE,
    rx       => '0',
    data     => (others => '0'),
    bit_ctr  => (others => '0'),
    new_data => '0',
    ctr      => '0'
    );

  signal r   : rx_transfer := rx_init;
  signal rin : rx_transfer := rx_init;
  
begin

  rx_fsm : process(block_rx, data, new_data) is
    variable v : rx_transfer := rx_init;
  begin
    v := r;
    case(r.state) is

      when ST_IDLE =>
        v.bit_ctr := "000";
        v.ctr     := '0';
        if(r.rx = '0') then
          v.stae := ST_WAIT_HALF;
        end if;

      when ST_WAIT_HALF =>
        v.ctr    := r.ctr + 1;
        if(r.ctr == (CLK_PER_BIT >> 1)) then
          v.ctr   := '0';
          v.state := ST_WAIT_FULL;
        end if;

      when ST_WAIT_FULL =>
        v.ctr := r.ctr + 1;
        if(r.ctr = CLK_PER_BIT -1) then
          v.data       := r.rx & r.data(7 downto 1);
          v.bit_ctr    := r.bit_ctr + 1;
          v.ctr        := '0';
          if(r.bit_ctr == 7) then
            v.state := ST_WAIT_HIGH;
            v.new_data = '1';
          end if;
        end if;

      when ST_WAIT_HIGH =>
        if(r.rx = '1') then
          v.state := ST_IDLE;
        end if;

      when others =>
        v.state := ST_IDLE;

    end case;
    if(rst = '1') then
      v := rx_init;
    end if;
    rx       <= r.rx;
    rin      <= v;
  end process;

--don't forget to update the reading signal
    seq : process (clk) is
    begin
      if (rising_edge(clk)) then
        r <= rin;
      end if;
    end process seq;
    
end Behavioral;


