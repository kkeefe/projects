----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:46:56 08/22/2018 
-- Design Name: 
-- Module Name:    Sync_Bit - Behavioral 
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

entity Sync_Bit is
    GENERIC (
	 --used to determine the length of the bit mappings to top_module
		input_length  : integer := 1;
		output_length : integer := 8;
		sync_stages   : integer := 2
	 );
	 Port ( 
		--Clock and Reset mapping
		clk 		  : in  STD_LOGIC;
      rst 		  : in  STD_LOGIC;
		--input is some async generic length std_vector
      a_sync_bit : in  STD_LOGIC_VECTOR(input_length-1 downto 0);
		--output is synced to clock at different length.
      syncbit    : out STD_LOGIC_VECTOR(output_length-1 downto 0)
	);
		
end Sync_Bit;

architecture Behavioral of Sync_Bit is

signal q_sync_bit : STD_LOGIC_VECTOR(input_length-1 downto 0);
signal syncbitPipe : STD_LOGIC_VECTOR(sync_stages-2 downto 0);

begin

	cdc_reg1 : FDRE
	generic map (
		INIT => '0'
	)
	port map (
		C 	=> clk,
		CE => '1',
		R	=> rst,
		D  => a_sync_bit,
		Q 	=> data_sync1
	);



end Behavioral;

