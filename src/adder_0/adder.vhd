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

entity first is
    Port ( clk : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (7 downto 0));
end first;

architecture Behavioral of first is

	signal pulse : std_logic := '0';
	signal count : integer range 0 to 49999999;

begin
	counter : process(clk)
	begin
		if (clk'event and clk = '1') then
			if count = 49999999 then
			count <= 0;
			pulse <= not pulse;
		else
			count <= count + 1;
			end if;
		end if;
	end process;

LED (7 downto 0) <= (others => pulse);

end Behavioral; 

