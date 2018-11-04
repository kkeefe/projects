--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:08:08 10/20/2018
-- Design Name:   
-- Module Name:   /home/ise/Xilinx/test_1/test_1/data_handling2/isim/data_ports1_sim/ISERDES2_sim1.vhd
-- Project Name:  data_ports1_sim
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ISERDES_primitive
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
 
ENTITY ISERDES2_sim1 IS
END ISERDES2_sim1;
 
ARCHITECTURE behavior OF ISERDES2_sim1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ISERDES_primitive
    PORT(
         ce0 : IN  std_logic;
         clkdiv : IN  std_logic;
         clk0 : IN  std_logic;
         d : IN  std_logic;
         ISERDES2_output : OUT  std_logic_vector(3 downto 0);
         rst : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ce0 : std_logic := '1';
   signal clkdiv : std_logic := '0';
   signal clk0 : std_logic := '0';
   signal d : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal ISERDES2_output : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clkdiv_period : time := 10 ns;
   constant clk0_period : time := 2.5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ISERDES_primitive PORT MAP (
          ce0 => ce0,
          clkdiv => clkdiv,
          clk0 => clk0,
          d => d,
          ISERDES2_output => ISERDES2_output,
          rst => rst
        );

   -- Clock process definitions
   clkdiv_process :process
   begin
		clkdiv <= '0';
		wait for clkdiv_period/2;
		clkdiv <= '1';
		wait for clkdiv_period/2;
   end process;
 
   clk0_process :process
   begin
		clk0 <= '0';
		wait for clk0_period/2;
		clk0 <= '1';
		wait for clk0_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 50 ns.
      wait for 50 ns;	

      wait for clkdiv_period*5;
			
      -- insert stimulus here 
		wait for clk0_period*1.8;
		d <= '1';

		wait for clk0_period*2;
		d <= '0';

		wait for clk0_period*2;
		d <= '1';
		
		wait for clk0_period*2;
		d <= '0';


      wait;
   end process;

END;
