----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:31:17 03/09/2018 
-- Design Name: 
-- Module Name:    Input_module_1 - Behavioral 
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

entity Input_module_1 is 

Generic (n : integer := 9); --ports, signals have n+1 bits

port (
	clk, rst, new_sample : in STD_LOGIC;
	channel : out STD_LOGIC_VECTOR (3 downto 0);
	sample : in STD_LOGIC_VECTOR (n downto 0);
	sample_channel : in STD_LOGIC_VECTOR(3 downto 0);
	output : out STD_LOGIC_VECTOR(n downto 0));
	
end Input_module_1;

architecture Behavioral of Input_module_1 is

signal sample_d, sample_q : STD_LOGIC_VECTOR(n downto 0);
signal pwm : STD_LOGIC;

begin

PWM_module : entity work.PWM_module port map(
		clk => clk,
		rst => rst,
		compare => sample_q,
		pwm => pwm);

process(new_sample, sample_channel) begin
if (new_sample & sample_channel = "00000") then
	sample_d <= sample;
 end if; 
end process; 

process(clk, rst) begin

 if(rst = '1') then
	sample_q <= (others => '0');
 else
	sample_q <= sample_d;
end if;
end process;

output <= sample_q;

end Behavioral;

