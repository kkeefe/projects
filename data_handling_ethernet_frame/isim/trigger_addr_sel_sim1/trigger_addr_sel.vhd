----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:52:01 10/19/2018 
-- Design Name: 
-- Module Name:    trigger_addr_sel - Behavioral 
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

entity trigger_addr_sel is
    Port ( clk100        : in   STD_LOGIC;
           rst           : in   STD_LOGIC;
           trigger_input : in   STD_LOGIC_VECTOR(63 downto 0);
           addr_in       : in   STD_LOGIC_vector(7 downto 0);
           addr_out      : out  STD_LOGIC_VECTOR(7 downto 0);
           new_hit       : out  STD_LOGIC
			  );
end trigger_addr_sel;

architecture Behavioral of trigger_addr_sel is


signal prev_trigger     : std_logic_vector(63 downto 0) := (others => '0');
signal trigger_hits     : std_logic_vector(63 downto 0);

signal data_addr_writes : std_logic_vector(7 downto 0);
signal data_addr_write  : std_logic_vector(7 downto 0);

signal new_trigger      : std_logic;

begin

--assign the inputs
trigger_hits    <= trigger_input;  --trigger input based on comparison of 4 phases from prev clock cycle
data_addr_write <= addr_in;		  --this is is the address associated with this trig signal

--assign the outputs
new_hit  <= new_trigger;	    		--prompt the FSM to start recording
addr_out <= data_addr_writes;  		--tell the FSM where to begin its search

--trigger factor
process(clk100) begin
	if(rising_edge(clk100)) then
		if(trigger_hits /= prev_trigger) then --if the trigger value has changed at all, indicate that the FSM should start reading.
			new_trigger      <= '1';
			data_addr_writes <= data_addr_write;
			prev_trigger     <= trigger_hits;      --update the new trigger condition, currently prev_trigger is all '0's...
		elsif(trigger_hits = prev_trigger) then 
			new_trigger <= '0';                    --this will cuase the new_trigger value to go low at the next clock cycle, with no change..
		end if;
	end if;
end process;



end Behavioral;

