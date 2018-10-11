----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:11:32 06/27/2018 
-- Design Name: 
-- Module Name:    foo_top - Behavioral 
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

entity foo_top is
    Generic(
			CLOCK_COUNT : integer := 50000000; --50 MHz generic interger count
	 );
	 Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           led_0 : out  STD_LOGIC);
end foo_top;

architecture Behavioral of foo_top is

signal CLOCK : std_logic;
signal RESET : std_logic;
signal led : std_logic;

begin

[flash] : process(CLOCK, RESET)

variable counter : integer range 0 to CLOCK_COUNT;

begin 

 if(rst = '1') then	
	counter := 0;
	led <= '0';
	
 elsif(clk'EVENT and clk = '1') then
	led <= not(led);
	counter := counter + 1;
	end if;
 end if;
end process [flash];

clk <= CLOCK;
rst <= RESET;
LED_0 <= led;

end Behavioral;

