library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-- For Xilinx primitives
library UNISIM;
use UNISIM.VComponents.all;

entity 2n_Decoder is
  generic(
    n_bits : integer := 2;
    );
  port (
    enable : in  STD_LOGIC;
    acode  : in  std_logic_vector(n_bits - 1 downto 0);
    bcode  : out std_logic_vector(n_bits*2 - 1 downto 0)
    );

end 2n_Decoder;

architecture Behavioral of 2n_Decoder is

begin

  2n_generate : for i in 0 to n_bits -1 generate
    
    if (enable = '1') then

      bcode(4*i + 0) <= not acode(2*i + 0) and not acode(2*i + 1);
      bcode(4*i + 1) <= acode(2*i + 0) and not acode(2*i + 1);
      bcode(4*i + 2) <= not acode(2*i + 0) and acode(2*i + 1);
      bcode(4*i + 3) <= acode(2*i + 0) and acode(2*i + 1);

    else

      bcode <= (others => '0');
      
    end if;
    
  end generate 2n_generate;

end Behavioral;
