----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:34:15 08/26/2018 
-- Design Name: 
-- Module Name:    process_trigger - Behavioral 
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

entity process_trigger is
    Generic(
		input_size  : integer := 8;
		output_size : integer := 8
	 );
	 
	 Port (
			clk 			  : in  STD_LOGIC;
         rst 			  : in  STD_LOGIC;
         async_bit_in  : in  STD_LOGIC_VECTOR(input_size-1 downto 0);
         async_bit_out : out STD_LOGIC_VECTOR(output_size-1 downto 0);
         new_hit 		  : out STD_LOGIC  
			  );
end process_trigger;

architecture Behavioral of process_trigger is

signal prev_hit : STD_LOGIC_VECTOR(input_size-1 downto 0) := (others => '0');

begin

--begin clock process to analyze hits
process(clk, rst) begin
if (rising_edge(clk)) then
	if(rst = '1') then				
		async_bit_out   <= (others => '0');
		new_hit         <= '0';
	else						
		if(async_bit_in(input_size-1 downto 0) /= prev_hit(input_size-1 downto 0)) then --test for hit change
			new_hit 	      <= '1';
			async_bit_out  <= async_bit_in;
			prev_hit 		<= async_bit_in;
		else	
			new_hit <= '0';
			--async_bit_out <= (others => '0');	
		end if; 			
	end if;
 end if;
end process;

end Behavioral;

