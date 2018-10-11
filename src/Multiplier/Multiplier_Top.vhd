----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:03:31 03/27/2018 
-- Design Name: 
-- Module Name:    NMultiplier_Top - Behavioral 
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

entity NMultiplier_Top is
	 Generic (n : integer := 2); 								--multiplier is n bit multiplier
    Port ( Multiplier : in  STD_LOGIC_VECTOR (n-1 downto 0);		--n bit input
           Multiplicand : in  STD_LOGIC_VECTOR (n-1 downto 0);		--n bit input
           Product : out  STD_LOGIC_VECTOR ((2*n)-1 downto 0);		--2n bit output
           start : in  STD_LOGIC;		--when to begin multiplication
           clk : in  STD_LOGIC;			--used to regulate register
           done : out  STD_LOGIC);		--used to signify multiplcation is finished
end NMultiplier_Top;


architecture Behavioral of NMultiplier_Top is

Function Shift (signal a : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
begin 
 return a & '0';
end shift;

Signal mult0, mult1 : STD_LOGIC_VECTOR (n-1 downto 0); --signals used from entity to drive multiplication process
Signal acc0, acc1 : STD_LOGIC_VECTOR((2*n)-2 downto 0);  --used to store information on accumulator register
Signal TempProduct : STD_LOGIC_VECTOR ((2*n)-1 downto 0);  --needs one more bit from shifting

begin

mult0 <= multiplier;
mult1 <= multiplicand;

adder2 : entity work.adder2 --n bit adder for n bit multiplier must double bits
generic map ( n => n+1 )
port map (
input1 => acc0,
input2 => acc1,
sum => sum);


end Behavioral;

