----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:50:00 11/29/2018 
-- Design Name: 
-- Module Name:    SSD_read_select - Behavioral 
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

entity SSD_read_select is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           io_button : in  std_logic_vector(4 downto 0);
           DAC_digital_threshold : in  std_logic_vector(11 downto 0);
           adc_digital_read : in  std_logic_vector(11 downto 0);
           evt_count : in  std_logic_vector(11 downto 0);
           MC_word : in  std_logic_vector(11 downto 0);
           bcdinput : out  std_logic_vector(11 downto 0));
end SSD_read_select;

architecture Behavioral of SSD_read_select is

  type StateType is (ST_ADC, ST_DAC, ST_EVTCOUNT, ST_MISO, ST_OTHER);

  type SSD_Select is record
    state  					  : StateType;
--    DAC_digital_threshold : std_logic_vector(11 downto 0);
--    adc_digital_read      : std_logic_vector(11 downto 0);
--    evt_count             : std_logic_vector(11 downto 0);
--    MC_word               : std_logic_vector(11 downto 0);
    output                : std_logic_vector(11 downto 0);
  end record;

  constant SSD_sel_Init : SSD_Select := (
    state => ST_OTHER,
--    DAC_digital_threshold => (others => '0'),
--    adc_digital_read      => (others => '0'),
--    evt_count             => (others => '0'),
--    MC_word               => (others => '0'),
    output                => (others => '0')
   );
	
  signal r   : SSD_Select := SSD_sel_Init;
  signal rin : SSD_Select := SSD_sel_Init;

  constant other_word : std_logic_vector(11 downto 0) := x"BAD";

begin
 
--  r.MC_word 				  <= MC_word;
--  r.evt_count 				  <= evt_count; 
--  r.adc_digital_read 	  <= adc_digital_read;
--  r.DAC_digital_threshold <= DAC_digital_threshold; 

  SSD_sel_FSM : process (r, io_button, clk, DAC_digital_threshold, adc_digital_read, evt_count, MC_word)
    variable v : SSD_Select;	
  begin  -- process FSM
    if(rising_edge(clk)) then
      if(rst = '1') then
			v.state := ST_OTHER;
		elsif(io_button /= "00000")then
        with io_button select
          v.state := ST_ADC      when "00001",
						   ST_DAC      when "00010",
						   ST_EVTCOUNT when "00100",
						   ST_MISO     when "01000",
						   ST_OTHER    when others;
      end if;      
    end if;
    
    case(r.state) is
		when ST_ADC =>
			v.output := adc_digital_read;
		when ST_OTHER =>
			v.output := other_word;
		when ST_MISO =>
			v.output := MC_word;
		when ST_EVTCOUNT =>
			v.output := evt_count;
		when ST_DAC =>
			v.output := DAC_digital_threshold;
  end case;

  bcdinput <= r.output;
  rin      <= v;
  
  end process;

--don't forget to update the reading signal
seq : process (clk) is
begin
  if (rising_edge(clk)) then
    r <= rin;
  end if;
end process seq;

  
end Behavioral;

