----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:44:04 07/09/2018 
-- Design Name: 
-- Module Name:    Blinky_TOP - Behavioral 
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

entity Blinky_TOP is
    Port ( CLOCK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           LED : in  STD_LOGIC);
end Blinky_TOP;

architecture Behavioral of Blinky_TOP is

begin


end Behavioral;

