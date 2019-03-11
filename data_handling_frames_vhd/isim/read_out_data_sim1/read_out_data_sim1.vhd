--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:49:14 10/23/2018
-- Design Name:   
-- Module Name:   /home/ise/Xilinx/test_1/test_1/data_handling2/isim/read_out_data_sim1/read_out_data_sim1.vhd
-- Project Name:  read_out_data_sim1
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
 
ENTITY read_out_data_sim1 IS
END read_out_data_sim1;
 
ARCHITECTURE behavior OF read_out_data_sim1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT read_out_data
    PORT(
         clk100 			: IN  std_logic;
         rst 				: IN  std_logic;
         new_trigger    : IN  std_logic;
         data_read_in   : IN  std_logic_vector(63 downto 0);
         data_addr_hit  : IN  std_logic_vector(7 downto 0);
         data_addr_bef  : IN  std_logic_vector(3 downto 0);
         data_addr_aft 	: IN  std_logic_vector(3 downto 0);
         data_phase_out : OUT  std_logic_vector(1 downto 0);
         data_read_out 	: OUT  std_logic_vector(7 downto 0);
         evtDataValid 	: OUT  std_logic;
         evtData 			: OUT  std_logic_vector(31 downto 0);
         evtDataLast 	: OUT  std_logic;
         evtFifoReady 	: IN  std_logic;
         dataReady 		: OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk100 			: std_logic := '0';
   signal rst 				: std_logic := '0';
   signal new_trigger   : std_logic := '0';
   signal data_read_in  : std_logic_vector(63 downto 0) := (others => '0');
   signal data_addr_hit : std_logic_vector(7 downto 0) := (others => '0');
   signal data_addr_bef : std_logic_vector(3 downto 0) := (others => '0');
   signal data_addr_aft : std_logic_vector(3 downto 0) := (others => '0');
   signal evtFifoReady  : std_logic := '0';

 	--Outputs
   signal data_phase_out : std_logic_vector(1 downto 0);
   signal data_read_out  : std_logic_vector(7 downto 0);
   signal evtDataValid   : std_logic;
   signal evtData 		 : std_logic_vector(31 downto 0);
   signal evtDataLast 	 : std_logic;
   signal dataReady 		 : std_logic;

   -- Clock period definitions
   constant clk100_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: read_out_data PORT MAP (
          clk100		 => clk100,
          rst => rst,
          new_trigger => new_trigger,
          data_read_in => data_read_in,
          data_addr_hit => data_addr_hit,
          data_addr_bef => data_addr_bef,
          data_addr_aft => data_addr_aft,
          data_phase_out => data_phase_out,
          data_read_out => data_read_out,
          evtDataValid => evtDataValid,
          evtData => evtData,
          evtDataLast => evtDataLast,
          evtFifoReady => evtFifoReady,
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
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	

      wait for clk100_period*1;

      -- insert stimulus here 

			evtFifoReady  <= '1';
			data_addr_aft <= "0011";
			data_addr_bef <= "0011";
			data_addr_hit <= "00001010";

      wait for clk100_period*1;

			new_trigger   <= '1';

	for i in 0 to 31 loop
		data_read_in(i) <= '1';
	end loop;
	
	for i in 32 to 63 loop
		data_read_in(i) <= '0';
	end loop;

	
      wait for clk100_period*1;

			data_addr_hit <= "00001000";
			new_trigger   <= '0';


	for i in 0 to 31 loop
		data_read_in(i) <= '0';
	end loop;
	
	for i in 32 to 63 loop
		data_read_in(i) <= '1';
	end loop;



      wait for clk100_period*1.5;

	for i in 0 to 31 loop
		data_read_in(i) <= '1';
	end loop;
	
	for i in 32 to 63 loop
		data_read_in(i) <= '0';
	end loop;


      wait for clk100_period*2;


	for i in 0 to 31 loop
		data_read_in(i) <= '0';
	end loop;
	
	for i in 32 to 63 loop
		data_read_in(i) <= '1';
	end loop;



      wait;
   end process;

END;
