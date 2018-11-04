----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:26:04 02/22/2018 
-- Design Name: 
-- Module Name:    BinaryToDecimal - Behavioral 
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
use IEEE.numeric_std.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BinaryToDecimal is
    Port ( 
			  bcdinput : in STD_LOGIC_VECTOR(11 downto 0);
			  bcdoutput: out STD_LOGIC_VECTOR(15 downto 0));
	end BinaryToDecimal;

architecture Behavioral of BinaryToDecimal is

SIGNAL reader : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL decimal : STD_LOGIC_VECTOR(15 downto 0);

begin


Conversion : process(bcdinput (11 downto 0))

	variable temp : STD_LOGIC_VECTOR (11 downto 0);
	variable bcd : unsigned (15 downto 0) := (others => '0');
	
begin
 bcd := (others => '0');
 temp (11 downto 0) := bcdinput(11 downto 0);
 
 for i in 0 to 11 loop
 
 if bcd(3 downto 0) > 4 then
  bcd(3 downto 0) := bcd(3 downto 0) + 3;
 end if; 
 
 if bcd(7 downto 4) > 4 then
  bcd(7 downto 4) := bcd(7 downto 4) + 3;
 end if;
 
 if bcd(11 downto 8) > 4 then
  bcd(11 downto 8) := bcd(11 downto 8) + 3;
 end if;
 
 bcd := bcd(14 downto 0) & temp(11);
 temp := temp(10 downto 0) & '0';
 
end loop;

Decimal <= STD_LOGIC_VECTOR(bcd(15 downto 0));

end process;

bcdoutput <= decimal;

end Behavioral;

