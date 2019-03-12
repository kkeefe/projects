----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kevin Keefe
-- 
-- Create Date:    12/2/2018
-- Design Name: 
-- Module Name:    cclk_detect - Behavioral 
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

entity cclk_detect is
  generic(
    CLK_RATE         : integer := 50000000;
    SERIAL_BAUD_RATE : integer := 500000;
    )
    Port (
      clk   : in  STD_LOGIC;
      rst   : in  STD_LOGIC;
      cclk  : in  STD_LOGIC;
      ready : out STD_LOGIC
      );
end cclk_detect;

architecture Behavioral of cclk_detect is

  --constant CTR_SIZE = @clog2(CLK_RATE/SERIAL_BAUD_RATE);

  signal ctr_d, ctr_q     : std_logic_vector(CTR_SIZE - 1 downto 0);
  signal ready_d, ready_q : std_logic;

  constant ctr_q_check := std_logic_vector(CTR_SIZE -1 downto 0) := (others => '1');

  
begin

  ready <= ready_q;

  detect_clk : process(ctr_q, cclk) is
  begin
    ready_d <= '0';
    if(cclk = '0') then
      ctr_d <= '0';
    elsif(ctr_q ! = ctr_q_check) then
      ctr_d <= ctr_q + 1;
    else
      ctr_q   <= ctr_q;
      ready_q <= '1';
    end if;
  end process;

  update_clk : process(clk) is
  begin
    if(rising_edge(clk)) then
      if(rst = '1') then
        ctr_q   <= '0';
        ready_q <= '0';
      else
        ctr_q   <= ctr_d;
        ready_q <= ready_d;
      end if;
    end process;
  
end Behavioral;

