----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:26:54 10/16/2018 
-- Design Name: 
-- Module Name:    data_ports - Behavioral 
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

use work.PLL_integer_array.ALL;
use work.type_def_pkg.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_ports is
    Port ( CLK100         : in  STD_LOGIC_vector(2 downto 0);
			  CLK400         : in  STD_LOGIC_VECTOR(2 downto 0);
           ClkDataFSM	  : in  STD_LOGIC;
			  RST            : in  STD_LOGIC;
           DATA_INPUT     : in  STD_LOGIC_VECTOR(63 downto 0);
			  data_address   : in  STD_LOGIC_VECTOR(7 downto 0);
           phase_sel		  : in  std_logic_vector(1 downto 0);   
			  data_addr_out  : out std_logic_vector(7 downto 0);
			  hit_count_ref  : in  std_logic_vector(31 downto 0);
			  TRIGGER_OUTPUT : out STD_LOGIC_VECTOR(63 downto 0);
           DATA_OUTPUT    : out STD_LOGIC_VECTOR(63 downto 0);
			  ioce    		  : in  std_logic_vector(2 downto 0);
			  hit_count_read : out SiPM_Pixel_hitCount
			  );
end data_ports;

architecture Behavioral of data_ports is

type hit_memory is array (63 downto 0) of std_logic_vector(3 downto 0);
signal hit_4_phase : hit_memory;

type address_out is array (63 downto 0) of std_logic_vector(7 downto 0);
signal data_addr_outs : address_out;

signal SiPM_pixel_hit_count_s : SiPM_pixel_hitcount;

--type SiPM_pixel_hit_unsgn is array (63 downto 0) of unsigned(31 downto 0);
--signal SiPM_pixel_hit_unsgn_s : SiPM_pixel_hit_unsgn;

--for assigning the phase you want to read to the output from the particular memeory
signal phase_select : std_logic_vector(1 downto 0);
signal mem_select   : std_logic_vector(7 downto 0);

--create the ports for the top design
signal trigger_outputs    : std_logic_vector(63 downto 0);
--signal SiPM_pixel_cnt_ref : std_logic_vector(63 downto 0) := (others => '0');
signal scaler_update		  : std_logic;
signal hit_ref_unsgn      : unsigned(31 downto 0);

begin

----------------------------------port assignments---------------------------------------------------------
phase_select   <= phase_sel;           --assign the bit_out to read with a phase selector
mem_select     <= data_address;        --assign the memeory you want to read from
data_addr_out  <= data_addr_outs(0);
hit_ref_unsgn  <= unsigned(hit_count_ref);


bit_out_assign : for i in 0 to 63 generate
	with phase_select select
		data_output(i) <= hit_4_phase(i)(0) when "00", --last bit in time, 
							   hit_4_phase(i)(1) when "01",
							   hit_4_phase(i)(2) when "10",
							   hit_4_phase(i)(3) when "11"; --most recent bit
end generate bit_out_assign;


----------------------------------hit assignments---------------------------------------------------------
gen_data_handling : for i in 0 to 63 generate 
	pixel_data : entity work.data_handling_module 
	PORT MAP(
		clk100  	     => clk100(pll_array_ints(i)),
		clk400        => clk400(pll_array_ints(i)),
		ClkDataFSM	  => ClkDataFSM,
		rst           => rst,
		data_in   	  => data_input(i),		  		  --data_input_pins
		data_addr 	  => mem_select,          		  --data address to read from
		data_addr_out => data_addr_outs(i),
		scaler_update => scaler_update,
		hit_count     => SiPM_pixel_hit_count_s(i), --there is no current reset for the hit_count..
		new_hit       => trigger_output(i),         --"weight" of the trigger
		data_out  	  => hit_4_phase(i),		  		  --4 bit parallel output to read from	
		ioce      	  => ioce(pll_array_ints(i))
	);
end generate gen_data_handling;

--determine_pixel_counts : for i in 0 to 63 generate
--	SiPM_pixel_hit_unsgn_s(i) <= unsigned(SiPM_pixel_hit_count_s(i));		
--	process(SiPm_pixel_hit_unsgn_s(i)) begin
--		if (SiPM_pixel_hit_unsgn_s(i) >= hit_ref_unsgn) then
--			SiPM_pixel_cnt_ref(i) <= '1';
--		else 
--			SiPM_pixel_cnt_ref(i) <= '0';
--		end if;	
--	end process;
--end generate determine_pixel_counts; 

--count on the 125 MHz clk..
process(clk100(0)) 	
	variable scaler_count : unsigned(31 downto 0) := (others => '0');	
	begin	
	if(rising_edge(clk100(0))) then
		if(scaler_count = hit_ref_unsgn) then
			scaler_count    := (others => '0');
			hit_count_read  <= SiPM_pixel_hit_count_s;
			scaler_update   <= '1';
		else
			scaler_count  := scaler_count + 1;
			scaler_update <= '0';
		end if;
	end if;	
end process;

end Behavioral;

