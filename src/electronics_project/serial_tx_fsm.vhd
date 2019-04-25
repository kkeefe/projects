----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kevin Keefe
-- 
-- Create Date:    12/2/2018
-- Design Name: 
-- Module Name:    serial_tx_fsm - Behavioral 
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

entity serial_tx_fsm is
  generic(
    CLK_RATE         : integer := 50000000;
    SERIAL_BAUD_RATE : integer := 500000;
    )
    Port (
      clk      : in  std_logic;
      rst      : in  std_logic;
      tx       : out std_logic;
      block_tx : in  std_logic;
      busy     : out std_logic;
      data     : in  std_logic_vector(7 downto 0);
      new_data : in  std_logic
      );
end serial_tx_fsm;

architecture Behavioral of serial_tx_fsm is

    --constant CTR_SIZE = $clog2(CLK_RATE/SERIAL_BAUD_RATE);

  type StateType is (ST_IDLE, ST_START_BIT, ST_DATA, ST_STOP_BIT);

  type tx_transfer is record
    state    : StateType;
    block_tx : std_logic;
    busy     : std_logic;
    tx       : std_logic;
    data     : std_logic_vector(7 downto 0);
    bit_ctr  : std_logic_vector(2 downto 0);
    ctr      : std_logic;
  end record;

  constant tx_init : tx_transfer := (
    state    => ST_IDLE,
    block_tx => '0',
    tx       => '0',
    busy     => '0',
    data     => (others => '0'),
    bit_ctr  => (others => '0'),
    ctr      => '0'
    );

  signal r   : tx_transfer := tx_init;
  signal rin : tx_transfer := tx_init;
  
begin

  tx_fsm : process(block_tx, data, new_data) is
    variable v : tx_transfer := tx_init;
  begin
    v := r;
    case(r.state) is
      when ST_IDLE =>
        if(r.block_tx = '1') then
          v.busy := '1';
          v.tx   := '1';
        else
          v.busy      := '0';
          v.tx        := '1';
          v.bit_ctr_d := "000";
          v.ctr       := '0';
          if(new_data = '1') then
            v.data  := data;
            v.state := ST_START_BIT;
            v.busy  := '1';
          end if;
        end if;
      when ST_START_BIT =>
        v.busy       := '1';
        v.bit_ctr    := r.bit_ctr + 1;
        v.tx         := '0';
        if(r.bit_ctr == CLK_PER_BIT -1) then
          v.ctr   := '0';
          v.state := ST_DATA;
        end if;
      when ST_DATA =>
        v.busy   := '1';
        v.tx     := data(r.bit_ctr);
        v.ctr    := r.ctr + 1;
        if(r.ctr == CLK_PER_BIT -1) then
          v.ctr = '0';
          v.bit_ctr = r.bit_ctr + 1;
          if(r.bit_ctr = 7) then
            v.state := ST_STOP_BIT;
          end if;
        end if;
      when ST_STOP_BIT =>
        v.busy   := '1';
        v.tx     := '1';
        v.ctr    := r.ctr + 1;
        if(r.ctr == CLK_PER_BIT -1) then
          v.state := ST_IDLE;
        end if;
      when others =>
        v.state := ST_IDLE;
    end case;
    if(rst = '1') then
      v := tx_init;
    end if;
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


