--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:10:13 04/26/2019
-- Design Name:   
-- Module Name:   /mnt/hgfs/ntc/projects/workspace/sim/process_trigger_TBV.vhd
-- Project Name:  work_space_project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: process_trigger
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
--USE ieee.numeric_std.ALL;
 
ENTITY process_trigger_TBV IS
END process_trigger_TBV;
 
ARCHITECTURE behavior OF process_trigger_TBV IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT process_trigger
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         data_input : IN  std_logic_vector(3 downto 0);
         scaler_count : IN  std_logic_vector(31 downto 0);
         scaler_count_pixel : OUT  std_logic_vector(31 downto 0);
         new_hit : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic 										 := '0';
   signal rst : std_logic 										 := '0';
   signal data_input : std_logic_vector(3 downto 0)    := x"0";
   signal scaler_count : std_logic_vector(31 downto 0) := x"00000004"; -- count to three..

 	--Outputs
   signal scaler_count_pixel : std_logic_vector(31 downto 0);
   signal new_hit : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: process_trigger PORT MAP (
          clk => clk,
          rst => rst,
          data_input => data_input,
          scaler_count => scaler_count,
          scaler_count_pixel => scaler_count_pixel,
          new_hit => new_hit
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 50 ns;	

      wait for clk_period*5;

      -- insert stimulus here 
		data_input <= x"f";
      wait for clk_period*2;

		data_input <= x"0";
      wait for clk_period*2;

		data_input <= x"E";
      wait for clk_period*2;

		data_input <= x"0";
      wait for clk_period*2;

		data_input <= x"A";
      wait for clk_period*2;

		data_input <= x"0";
      wait for clk_period*2;

		data_input <= x"1";
      wait for clk_period*2;

		data_input <= x"0";
      wait for clk_period*2;
		
		data_input <= x"f";
      wait for clk_period*2;

		data_input <= x"0";
      wait for clk_period*2;

		data_input <= x"E";
      wait for clk_period*2;

		data_input <= x"0";
      wait for clk_period*2;

		data_input <= x"A";
      wait for clk_period*2;

		data_input <= x"0";
      wait for clk_period*2;

		data_input <= x"1";
      wait for clk_period*2;

		data_input <= x"0";
      wait for clk_period*2;


      wait;
   end process;

END;
