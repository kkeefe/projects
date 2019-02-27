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
			clk 			  : in  STD_LOGIC;
         rst 			  : in  STD_LOGIC;
         data_input    : in  STD_LOGIC_VECTOR(input_size-1 downto 0);
			--data_output	 : out std_logic_vector(input_size-1 downto 0);
         scaler_update : in  std_logic;
			hit_count     : out STD_LOGIC_VECTOR(31 downto 0);
			new_hit 		  : out STD_LOGIC  
			 );
end process_trigger;

architecture Behavioral of process_trigger is

	--signal new_trig_hit : std_logic;
	signal hit_count_s : unsigned(31 downto 0) := (others => '0');

begin

	--assign the scaler to the output..
	hit_count <= std_logic_vector(hit_count_s);

--begin clock process to analyze hits
	process(clk, scaler_update) 

	variable prev_hit : STD_LOGIC_VECTOR(input_size-1 downto 0) := (others => '0');

	begin
		if (rising_edge(clk)) then
			if(scaler_update = '1') then
					new_hit     <= '0';
					prev_hit    := (others => '0');
					hit_count_s <= (others => '0');
			elsif(data_input /= prev_hit) then --test for hit change
					new_hit 	   <= '1';
					prev_hit    := data_input;
					hit_count_s <= hit_count_s + 1;
			else	
					new_hit 	<= '0';
			 end if;
			end if;
		end process;

--	generate_sync : for i in 0 to input_size-1 generate  --These need to run at FSM Clk Rate
--		bit_sync : entity work.syncBit_en
--				port map (
--					  clk      => clk,   		  
--					  rst      => rst,
--					  --CE       => '1',
--					  async_in => data_input(i),  
--					  sync_out => data_output(i)	
--				);
--	end generate;
--	
--		bit_sync : entity work.syncBit_en
--				port map (
--					  clk      => clk,   	
--					  rst      => rst,
--					  --CE       => '1',
--					  async_in => new_trig_hit,  
--					  sync_out => new_hit		  
--				);

end Behavioral;

