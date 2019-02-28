library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-- For Xilinx primitives
library UNISIM;
use UNISIM.VComponents.all;

entity 2n_Encoder is
  generic(
    n_bits : integer := 2;
    );
  port (
    enable : in  STD_LOGIC;
    acode  : in  std_logic_vector(n_bits*2 - 1 downto 0);
    bcode  : out std_logic_vector(n_bits - 1 downto 0)
    );

end 2n_Encoder;

architecture Behavioral of 2n_Encoder is

begin

  if (enable = '1') then

    with acode select
      bcode <= "00" when "0001",
               "01" when "0010",
               "10" when "0100",
               "11" when "1000",
               "ZZ" when others;

  else

      bcode <= (others => '0');
    
  end if;
  
end Behavioral;
