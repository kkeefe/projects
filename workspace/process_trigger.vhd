----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kevin Keefe
-- 
-- Create Date:    20:34:15 08/26/2018 
-- Design Name: trigger stuff
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity process_trigger is
  Generic(
    input_size  : integer := 4;
    output_size : integer := 4
    );
  Port (
    clk                : in  STD_LOGIC;
    rst                : in  STD_LOGIC;
    data_input         : in  STD_LOGIC_VECTOR(input_size-1 downto 0);
    scaler_count       : in  STD_LOGIC_VECTOR(31 downto 0);
    scaler_count_pixel : out STD_LOGIC_VECTOR(31 downto 0);
    new_hit            : out STD_LOGIC
    );
end process_trigger;

architecture Behavioral of process_trigger is

  constant NULL_HIT : STD_LOGIC_VECTOR(input_size - 1 downto 0) := (others => '0');

  signal s_scaler_count_pixel : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
  signal s_current_count      : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

begin


  process(clk)
  begin

    if rising_edge(clk) then
      
      if rst = '1' then
        new_hit            <= '0';
        s_current_count    <= x"00000000";
        scaler_count_pixel <= x"00000000";
      else
        --test for update count
        if s_current_count = scaler_count then
          scaler_count_pixel <= s_scaler_count_pixel;
          s_current_count    <= x"00000001";  -- setting this value to one ensures counting 'precisely'
        --s_scaler_count_pixel    <= x"00000000";
        else
          --update the signals after the process is completed..
          s_current_count <= std_logic_vector((unsigned(s_current_count) + 1));
        end if;

        -- tracking for the output triggers
        if data_input /= NULL_HIT then
          new_hit              <= '1';
          s_scaler_count_pixel <= std_logic_vector((unsigned(s_scaler_count_pixel) + 1));
        --  vPrev_hit                 := data_input;
        else
          new_hit <= '0';
        end if;

      end if;
    end if;
  end process;


               end Behavioral;

