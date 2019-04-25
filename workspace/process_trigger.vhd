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
    input_size  : integer := 8;
    output_size : integer := 8
    );
  Port (
    clk                : in  STD_LOGIC;
    rst                : in  STD_LOGIC;  --currently unused so giving warning..
    data_input         : in  STD_LOGIC_VECTOR(input_size-1 downto 0);
    scaler_count       : in  STD_LOGIC_VECTOR(31 downto 0);
    scaler_count_pixel : out STD_LOGIC_VECTOR(31 downto 0);
    new_hit            : out STD_LOGIC
    );
end process_trigger;

architecture Behavioral of process_trigger is

  signal scaler_count_s       : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
  signal scaler_count_pixel_s : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

begin

  --begin clock process to analyze hits
  --count on the 125 MHz clk.. --these are the scaler counts..
  --p_scaler_update : process(clk125(0))

  process(clk)

    variable prev_hit                 : STD_LOGIC_VECTOR(input_size-1 downto 0) := (others => '0');
    variable scaler_count_unsgn       : unsigned(31 downto 0)                   := (others => '0');
    variable scaler_count_pixel_unsgn : unsigned(31 downto 0)                   := (others => '0');

  begin

    if (rising_edge(clk)) then

--      --update the scaler_count_pixel after the appropriate integration period..
--      if scaler_count_s = scaler_count then
--        scaler_count_pixel_s     <= std_logic_vector(scaler_count_pixel_unsgn);
--        scaler_count_unsgn       := (others => '0');
--        scaler_count_pixel_unsgn := (others => '0');
--      else
--        scaler_count_unsgn := scaler_count_unsgn + 1;
--      end if;

      --test for hit change
      if scaler_count_s = scaler_count then
        scaler_count_pixel_s     <= std_logic_vector(scaler_count_pixel_unsgn);
        scaler_count_unsgn       := (others => '0');
        scaler_count_pixel_unsgn := (others => '0');
		else
        scaler_count_unsgn := scaler_count_unsgn + 1;
		end if;
      
		if data_input /= prev_hit then
        new_hit                  <= '1';
        prev_hit                 := data_input;
        scaler_count_pixel_unsgn := scaler_count_pixel_unsgn + 1;
		else
		  new_hit <= '0';
      end if;

      --update the signals after the process is completed..
      scaler_count_pixel <= scaler_count_pixel_s;
      scaler_count_s     <= std_logic_vector(scaler_count_unsgn);
      
    end if;
  end process;

--     variable scaler_count : unsigned(31 downto 0) := (others => '0');
--   begin
--     if(rising_edge(clk125(0))) then
--       if(scaler_count = scaler_ref_unsgn) then
--         scaler_update  <= '1';        
--         scaler_count_read <= SiPM_pixel_scaler_count_unsgn;
--         scaler_count   := (others => '0');      
--       else
--         scaler_count  := scaler_count + 1;
--         scaler_update <= '0';
--       end if;
--     end if;
--   end process p_scaler_update;
  
end Behavioral;

