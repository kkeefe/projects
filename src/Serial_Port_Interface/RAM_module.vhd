----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:09:18 05/16/2018 
-- Design Name: 
-- Module Name:    RAM_module - Behavioral 
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

entity RAM_module is
    Generic ( bits : integer := 8;	  --# of bits per word	
				  words : integer := 16); --# of words in the memory 
	 Port ( wr_ena : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           addr : in  INTEGER RANGE 0 TO words-1;
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           data_out : out  STD_LOGIC_VECTOR (7 downto 0));
end RAM_module;

architecture Behavioral of RAM_module is

	type vector_array is array (0 to words-1) of 
		STD_LOGIC_VECTOR (bits-1 downto 0);
	Signal memory : vector_array;
	
begin

--write to the memory address if wr_ena & clock
	process(clk, wr_ena)
		begin
		if (wr_ena='1') then
			if (clk'event and clk='1') then
				memory(addr) <= data_in;
			end if;
		end if;
	end process;
	
--always read from the memory address
data_out <= memory(addr);

end Behavioral;

