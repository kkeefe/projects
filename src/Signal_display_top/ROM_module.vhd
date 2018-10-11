----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:40 05/16/2018 
-- Design Name: 
-- Module Name:    ROM_module - Behavioral 
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

entity ROM_module is
    Generic ( bits : integer := 8; --# of bits per word
				  words: integer := 8); --# of words in the memory
	 Port ( addr: IN INTERGER RANGE 0 TO WORDS-1;
           data : out  STD_LOGIC_VECTOR (BITS-1 downto 0));
end ROM_module;
--------------------------------------------------------------------------------------------
architecture Behavioral of ROM_module is
	TYPE vector_array is ARRAY (0 to words-1) of
		STD_LOGIC_VECTOR (bits-1 DOWNTO 0);
	CONSTANT memory: vectory_array := (	"00000000",
													"00000010",
													"00000100",
													"00001000",
													"00010000",
													"00100000",
													"01000000",
													"10000000");
begin

data <= memry(addr);

end Behavioral;

