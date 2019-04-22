----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:16:58 03/02/2018 
-- Design Name: 
-- Module Name:    SSD_display - Behavioral 
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

entity SSD_display is port (
  
  clk : in STD_LOGIC;
  product : in STD_LOGIC_VECTOR(15 downto 0);
  io_sel : inout STD_LOGIC_VECTOR(3 downto 0):= "1110";
  io_seg : out STD_LOGIC_VECTOR(7 downto 0));

end SSD_display;

architecture Behavioral of SSD_display is

  Signal Reader : STD_LOGIC_VECTOR(3 downto 0);

begin

  process(clk, product)     												--binary to hex process
    
    Variable count : integer range 0 to 62500;
    
  begin 	
    if(clk'event and clk = '1') then
      count := count + 1; 
      if(count = 62499) then count := 0;
                             io_sel(3 downto 0) <= io_sel(2 downto 0) & io_sel(3);
                             case io_sel is
                               when "1011" => reader(3 downto 0) <= product(15 downto 12);
                               when "1101" => reader(3 downto 0) <= product(11 downto 8);
                               when "1110" => reader(3 downto 0) <= product(7 downto 4);		
                               when "0111" => reader(3 downto 0) <= product(3 downto 0);
                               when others => NULL;	
                             end case;
      end if;
    end if;
  end process; 

  with reader(3 downto 0) select            				--binary to hexidecimal converter                   
io_seg (7 downto 0) <= "11111001" when "0001", --1
                       "10100100" when "0010", --2
                       "10110000" when "0011", --3
                       "10011001" when "0100", --4 	-- selection of io
                       "10010010" when "0101", --5		-- displays, digit
                       "10000010" when "0110", --6		-- converter
                       "11111000" when	"0111", --7							  	
                       "10000000" when "1000", --8					
                       "10011000" when "1001", --9
                       "11000000" when "1010", --A
                       "10000011" when "1011", --B
                       "11000110" when "1100", --C
                       "10100001" when "1101", --D
                       "10000110" when "1110", --E
                       "10001110" when "1111", --F
                       "11000000" when others; --0 value


end Behavioral;

