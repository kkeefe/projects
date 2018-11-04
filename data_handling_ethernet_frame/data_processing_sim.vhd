--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:05:27 10/19/2018
-- Design Name:   
-- Module Name:   /home/ise/Xilinx/projects/src/data_handling/data_processing_sim.vhd
-- Project Name:  data_handling
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: read_out_data
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
 
ENTITY data_processing_sim IS
END data_processing_sim;
 
ARCHITECTURE behavior OF data_processing_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT read_out_data
    PORT(
         clk100            : IN  std_logic;
         clk125            : IN  std_logic;
         rst               : IN  std_logic;
         trigger_hit       : IN  std_logic_vector(63 downto 0);
         data_read_in      : IN  std_logic_vector(63 downto 0);
         data_addr_write   : IN  std_logic_vector(7 downto 0);
         data_phase_out    : OUT  std_logic_vector(1 downto 0);
         data_read_out     : OUT  std_logic_vector(7 downto 0);
         eventCount        : OUT  std_logic_vector(31 downto 0);
         output_data_valid : OUT  std_logic;
         output_data       : OUT  std_logic_vector(7 downto 0);
         output_data_last  : OUT  std_logic;
         output_data_ready : IN  std_logic;
         dataReady         : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk100            : std_logic := '0';
   signal clk125            : std_logic := '0';
   signal rst               : std_logic := '0';
   signal trigger_hit       : std_logic_vector(63 downto 0) := (others => '0');
   signal data_read_in      : std_logic_vector(63 downto 0) := (others => '0');
   signal data_addr_write   : std_logic_vector(7 downto 0) := (others => '0');
   signal output_data_ready : std_logic := '0';

 	--Outputs
   signal data_phase_out    : std_logic_vector(1 downto 0);
   signal data_read_out     : std_logic_vector(7 downto 0);
   signal eventCount        : std_logic_vector(31 downto 0);
   signal output_data_valid : std_logic;
   signal output_data       : std_logic_vector(7 downto 0);
   signal output_data_last  : std_logic;
   signal dataReady         : std_logic;

   -- Clock period definitions
   constant clk100_period : time := 10 ns;
   constant clk125_period : time := 8 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: read_out_data PORT MAP (
          clk100 => clk100,
          clk125 => clk125,
          rst => rst,
          trigger_hit => trigger_hit,
          data_read_in => data_read_in,
          data_addr_write => data_addr_write,
          data_phase_out => data_phase_out,
          data_read_out => data_read_out,
          eventCount => eventCount,
          output_data_valid => output_data_valid,
          output_data => output_data,
          output_data_last => output_data_last,
          output_data_ready => output_data_ready,
          dataReady => dataReady
        );

   -- Clock process definitions
   clk100_process :process
   begin
		clk100 <= '0';
		wait for clk100_period/2;
		clk100 <= '1';
		wait for clk100_period/2;
   end process;
 
   clk125_process :process
   begin
		clk125 <= '0';
		wait for clk125_period/2;
		clk125 <= '1';
		wait for clk125_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk100_period*10;

      -- insert stimulus here 


      -- insert stimulus here 
		for i in 0 to 63 loop
			TRIGGER_hit(i)  <= '1';
			Data_read_in (i)  <= '1';
		end loop;

			data_addr_write   <= "00001111"; 
			data_output_ready <= '1';
		
		wait for CLOCK_period*1;
		
		
		for i in 0 to 63 loop
			TRIGGER_INPUT(i)  <= '0';
			Data_read_in (i)  <= '1';
		end loop;

			data_addr_write   <= "0001000"; 
			dataeady <= '1';		
		
		
--		for i in 0 to 3 loop
--			TRIGGER_INPUT(i) <= '0';
--		end loop;
--  		
--		wait for CLOCK_period*1.5;
--		
--		for i in 4 to 7 loop
--			TRIGGER_INPUT(i) <= '0';
--		end loop;
--		 
--		wait for CLOCK_period*1.5;
--		
--		for i in 0 to 7 loop
--			TRIGGER_INPUT(i) <= '1';
--		end loop;		 


      wait;
   end process;

END;
