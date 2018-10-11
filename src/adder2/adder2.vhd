----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:59:42 02/06/2018 
-- Design Name: 
-- Module Name:    adder2 - Behavioral 
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

entity adder2 is
	 Generic (n : integer := 8); --default value is 8 	-- aka 8 bit adder
    Port (  input1, input2 : in  STD_LOGIC_VECTOR (n-1 downto 0); 
				SUM: out  STD_LOGIC_VECTOR (n downto 0));
end adder2;
------------------------------------------------------------------------------------------------------
architecture Behavioral of adder2 is

Signal product: STD_LOGIC_VECTOR (n downto 0);
Signal CARRY  : STD_LOGIC_VECTOR (n downto 0);

begin

Adder2 : for i in 0 to n-1 generate	                               --n bit adder
	product(i) <= input1(i) xor input2(i) xor CARRY(i);
	CARRY(i+1) <= (input1(i) and input2(i)) or (input1(i) and CARRY(i)) or (input2(i) and CARRY(i));
 end generate;

carry(0) <= '0';
product(n) <= Carry(n);
sum <= product; 

end Behavioral;

