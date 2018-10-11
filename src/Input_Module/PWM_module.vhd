----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:37:10 03/09/2018 
-- Design Name: 
-- Module Name:    PWM_module - Behavioral 
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

entity PWM_module is
    Generic (n : integer := 9);							--n+1 is the bits of the input
	 Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           compare : in  STD_LOGIC_VECTOR (n downto 0);
           pwm : out  STD_LOGIC);
end PWM_module;

architecture Behavioral of PWM_module is

signal pwm_d, pwm_q : STD_LOGIC;
signal ctr_d, ctr_q : STD_LOGIC_VECTOR (n downto 0);

begin

pwm <= pwm_q;

ctroutput: for i in 0 to n generate

ctr_d(i) <= ctr_q(i) and '1';
end generate;

process(compare, ctr_q) begin
	if(compare > ctr_q) then
		pwm_d <= '1';
	else
		pwm_d <= '0';
 end if;
end process;

process(rst, clk) begin
	if(clk'event and clk = '1') then
		if (rst = '1') then
		ctr_q <= (others => '0');
	else 
		ctr_d <= ctr_q;
 
 end if;

pwm_d <= pwm_q;

end if;
 
 
 
end process;

end Behavioral;

