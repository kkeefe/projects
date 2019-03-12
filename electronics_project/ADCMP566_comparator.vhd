----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:44:12 11/26/2018 
-- Design Name: 
-- Module Name:    ADCMP566_comparator - Behavioral 
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

entity ADCMP566_comparator is
  Port (
    clk     : in  STD_LOGIC;
    Q       : in  STD_LOGIC;
    Q_n     : in  STD_LOGIC;
    new_hit : out STD_LOGIC
    );
end ADCMP566_comparator;

architecture Behavioral of ADCMP566_comparator is

	signal comp_trig : std_logic;
	signal new_trig  : std_logic := '0';

begin

 comp_ibufds : ibufds 
	Port Map (
		I  => Q,
		IB => Q_n,
		O  => comp_trig		
	);
  
  find_hit : process(clk, comp_trig) is
  begin
    if(rising_edge(clk)) then
      if(comp_trig = '1' and new_trig = '0') then
        new_hit  <= '1';
		  new_trig <= '1';
      elsif(comp_trig = '0' and new_trig = '1') then
		  new_trig <= '0';
		else 
        new_hit <= '0';
      end if;
    end if;
  end process;

end Behavioral;

