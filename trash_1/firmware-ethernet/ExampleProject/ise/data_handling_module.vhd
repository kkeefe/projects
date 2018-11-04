----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:02:41 10/14/2018 
-- Design Name: 
-- Module Name:    data_handling_module - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity data_handling_module is
    Port ( 
			  clock100      : in  STD_LOGIC;
			  clock400      : in  STD_LOGIC;
           reset         : in  STD_LOGIC;
           data_in       : in  STD_LOGIC;
           data_addr     : in  STD_LOGIC_VECTOR(7 downto 0);
			  data_addr_out : out std_logic_vector(7 downto 0);
			  new_hit       : out STD_LOGIC;
           data_out      : out STD_LOGIC_VECTOR(3 downto 0);
			  ioce     	    : in std_logic
			 );
end data_handling_module;

architecture Behavioral of data_handling_module is
	
	signal clk100, clk400, rst : std_logic;
	
	--data_handling ports
	signal data_out_s  : STD_LOGIC_VECTOR(3 downto 0);

	--ISERDES2 ports
	signal clkdiv : std_logic;
	signal d, ce0 : std_logic;
	signal ISERDES2_output : std_logic_vector(3 downto 0);
	
	--data process signals 
	signal trigger_input  : std_logic_vector(3 downto 0);
	signal read_out 		 : std_logic_vector(3 downto 0);
	signal new_measure 	 : std_logic;
	
	--BRAM signals
	signal wea   : std_logic_vector(0 downto 0);
	signal addra : std_logic_vector(7 downto 0);
	signal dina  : std_logic_vector(3 downto 0);
	signal addrb : std_logic_vector(7 downto 0);
	signal dinb  : std_logic_vector(3 downto 0);
	signal doutb : std_logic_vector(3 downto 0);

begin

-------------------------assign signal ports --------------------------------------------------
	d             <= data_in;         --connect input to SerDes
	trigger_input <= ISERDES2_output; --connect SerDes output to trigger process
	dina 			  <= read_out;		    --read from the process hits to the BRAM module
	data_out      <= doutb;				 --connect trigger process to Bram for write.
	data_addr_out <= addra;				 --this sends the current writing address out to the top level ports..
	clk100        <= clock100;        --assign the clocks; this is better assign inputs and instantiate this, other than have 128 clk gen xco's..
	clk400        <= clock400;
	ce0           <= '1';	          --always enable IserDes write
	rst           <= reset;           --assign reset input
	wea(0)        <= '1';             --always write enable the bram.. 
	addrb         <= data_addr;       --8 bit input to this module to determine what address to read from..
	new_hit       <= new_measure;     --this single bit indicates whether or not a new hit occured in this chain..
		
------------------------- instantiate ISERDES2 --------------------------------------------------
data_acquire : entity work.ISERDES_primitive 
	PORT MAP(
		ce0       		 => ce0, 		--clk enable input
		clkdiv    		 => clk100,		--global clock network input, assign to global clk
		clk0     		 => clk400,		--I/O clock network input, assign to ethClk?
		d               => d,			--input data, this is the data input after being delayed by the iodelay 2 block..
		ISERDES2_output => ISERDES2_output,
		rst       		 => rst,
		ioce      		 => ioce
	);
------------------------- instantiate buffer input --------------------------------------------------
data_process : entity work.tranLoc_TOP 
	Generic Map(
		input_size  => 4,
		output_size => 4
	)	
	PORT MAP(
		CLOCK         => clk100,
		RESET         => rst,
		TRIGGER_INPUT => trigger_input,
		READ_OUT      => read_out,
		NEW_MEASURE   => new_measure
	);

-------------------------assign write conditions --------------------------------------------------
process(new_measure, clk100) 
	variable address_var : unsigned(7 downto 0) := "00000000";
	begin
	if (rising_edge(clk100)) then
			address_var := address_var + 1; --move the writing address forward every clock cycle
			addra <= std_logic_vector(address_var);
			--if(new_measure = '1') then --when the hit is new, write to a new location when a new hit occurs, this condition is obviously going to change..
						
		--end if;
	end if;
end process;

-------------------------instantiate a bram module ------------------------------------------------

BRAM_storage : entity work.BRAM_storage
  PORT MAP (
    clka  => clk100,
    wea   => wea,
    addra => addra,
    dina  => dina,
    clkb  => clk100,
	 addrb => addrb,
	 doutb => doutb
  );	
	
end Behavioral;

