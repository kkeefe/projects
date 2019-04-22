-------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:57:14 11/29/2018
-- Design Name:   
-- Module Name:   /home/ise/Xilinx/projects/src/electronics_firmware/src/electroncs475_project/DAC_TB.vhd
-- Project Name:  electroncs475_project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DAC5621_interface
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

ENTITY DAC_TB IS
END DAC_TB;

ARCHITECTURE behavior OF DAC_TB IS

  -- Component Declaration for the Unit Under Test (UUT)
  
  COMPONENT DAC5621_interface
    PORT(
      clk                   : IN  std_logic;
      rst						 : IN  std_logic;
      sdin                  : OUT std_logic;
      sync_n                : OUT std_logic;
      DAC_DIGITAL_THRESHOLD : IN  std_logic_vector(11 downto 0);
      update_dac            : IN  std_logic
      );
  END COMPONENT;


  --Inputs
  signal rst 						 : std_logic 							:= '0';
  signal clk                   : std_logic                     := '0';
  signal DAC_DIGITAL_THRESHOLD : std_logic_vector(11 downto 0) := (others => '0');
  signal update_dac            : std_logic                     := '0';

  --Outputs
  signal sdin   : std_logic;
  signal sync_n : std_logic;

  -- Clock period definitions
  constant clk_period  : time := 10 ns;
  constant sclk_period : time := 10 ns;
  
BEGIN

  -- Instantiate the Unit Under Test (UUT)
  uut : DAC5621_interface PORT MAP (
    clk                   => clk,
    rst						  => rst,
    sdin                  => sdin,
    sync_n                => sync_n,
    DAC_DIGITAL_THRESHOLD => DAC_DIGITAL_THRESHOLD,
    update_dac            => update_dac
    );

  -- Clock process definitions
  clk_process : process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;

  -- Stimulus process
  stim_proc : process
  begin
    -- hold reset state for 100 ns.
    wait for 50 ns;

    wait for clk_period*2;

    -- insert stimulus here 
    update_dac <= '1';

    --DAC_DIGITAL_THRESHOLD <= "010101010101";
    DAC_DIGITAL_THRESHOLD <= "111111111111";
    
	 wait;
  end process;

END;
