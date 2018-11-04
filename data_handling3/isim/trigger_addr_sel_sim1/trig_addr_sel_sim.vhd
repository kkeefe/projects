--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:24:32 10/19/2018
-- Design Name:   
-- Module Name:   /home/ise/Xilinx/projects/src/data_handling/trig_addr_sel_sim.vhd
-- Project Name:  data_handling
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: trigger_addr_sel
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY trig_addr_sel_sim IS
END trig_addr_sel_sim;
 
ARCHITECTURE behavior OF trig_addr_sel_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT trigger_addr_sel
    PORT(
         clk100 : IN  std_logic;
         rst : IN  std_logic;
         trigger_input : IN  std_logic_vector(63 downto 0);
         addr_in : IN  std_logic_vector(7 downto 0);
         addr_out : OUT  std_logic_vector(7 downto 0);
         new_hit : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk100        : std_logic := '0';
   signal rst           : std_logic := '0';
   signal trigger_input : std_logic_vector(63 downto 0) := (others => '0');
   signal addr_in       : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal addr_out : std_logic_vector(7 downto 0) := (others => '0');
   signal new_hit  : std_logic;

   -- Clock period definitions
   constant clk100_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: trigger_addr_sel PORT MAP (
          clk100        => clk100,
          rst           => rst,
          trigger_input => trigger_input,
          addr_in       => addr_in,
          addr_out      => addr_out,
          new_hit       => new_hit
        );

   -- Clock process definitions
   clk100_process :process
   begin
		clk100 <= '0';
		wait for clk100_period/2;
		clk100 <= '1';
		wait for clk100_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 50 ns;	

      wait for clk100_period*5;

      -- insert stimulus here 
		addr_in <= "00001001";
		
		for i in 0 to 63 loop
			TRIGGER_INPUT(i) <= '1';
		end loop;

		wait for clk100_period*1;
		
		addr_in <= "00001010";
		
		for i in 0 to 63 loop
			TRIGGER_INPUT(i) <= '0';
		end loop;
  		
			

      wait;
   end process;

END;
