--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:35:33 10/20/2018
-- Design Name:   
-- Module Name:   /home/ise/Xilinx/test_1/test_1/data_handling2/isim/data_ports1_sim/data_ports_sim1.vhd
-- Project Name:  data_ports1_sim
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: data_ports
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
 
ENTITY data_ports_sim1 IS
END data_ports_sim1;
 
ARCHITECTURE behavior OF data_ports_sim1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT data_ports
    PORT(
         CLK100 			: IN  std_logic;
         CLK400 			: IN  std_logic;
         RST 				: IN  std_logic;
         DATA_INPUT 		: IN  std_logic_vector(63 downto 0);
         data_address 	: IN  std_logic_vector(7 downto 0);
         phase_sel		: IN  std_logic_vector(1 downto 0);
         data_addr_out 	: OUT  std_logic_vector(7 downto 0);
         TRIGGER_OUTPUT : OUT  std_logic_vector(63 downto 0);
         DATA_OUTPUT 	: OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK100       : std_logic := '0';
   signal CLK400       : std_logic := '0';
   signal RST          : std_logic := '0';
   signal DATA_INPUT   : std_logic_vector(63 downto 0) := (others => '0');
   signal data_address : std_logic_vector(7 downto 0) := (others => '0');
   signal phase_sel 	  : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal data_addr_out  : std_logic_vector(7 downto 0);
   signal TRIGGER_OUTPUT : std_logic_vector(63 downto 0);
   signal DATA_OUTPUT    : std_logic_vector(63 downto 0);

   -- Clock period definitions
   constant CLK100_period : time := 10 ns;
   constant CLK400_period : time := 2.5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: data_ports PORT MAP (
          CLK100 			 => CLK100,
          CLK400 			 => CLK400,
          RST 				 => RST,
          DATA_INPUT     => DATA_INPUT,
          data_address   => data_address,
          phase_sel      => phase_sel,
          data_addr_out  => data_addr_out,
          TRIGGER_OUTPUT => TRIGGER_OUTPUT,
          DATA_OUTPUT 	 => DATA_OUTPUT
        );

   -- Clock process definitions
   CLK100_process :process
   begin
		CLK100 <= '0';
		wait for CLK100_period/2;
		CLK100 <= '1';
		wait for CLK100_period/2;
   end process;
 
   CLK400_process :process
   begin
		CLK400 <= '0';
		wait for CLK400_period/2;
		CLK400 <= '1';
		wait for CLK400_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 50 ns.
      wait for 50 ns;	

      wait for CLK100_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
