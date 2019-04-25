----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kevin Keefe
-- 
-- Create Date:    13:33:34 11/26/2018 
-- Design Name: 
-- Module Name:    AD5621_interface - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity DAC5621_interface is
  Port (
    clk                   : in  std_logic;
    rst                   : in  std_logic;
    sdin                  : out STD_LOGIC;
    sync_n                : out STD_LOGIC;
    DAC_DIGITAL_THRESHOLD : in  STD_LOGIC_VECTOR(11 downto 0);
    update_dac            : in  STD_LOGIC
    );
end DAC5621_interface;

architecture Behavioral of DAC5621_interface is

  type StateType is (ST_IDLE, ST_READ, ST_OUT);  -- read adc FSM

  type Read_DAC is record
    state         : StateType;
    DAC_count     : integer range 0 to 15;
    dac_signal    : STD_LOGIC_VECTOR(11 downto 0);
    serial_output : STD_LOGIC_VECTOR(15 downto 0);
    update_dac    : STD_LOGIC;
	 sdin				: STD_LOGIC;
  end record;

  constant DAC_init : Read_DAC := (
    state         => ST_IDLE,
    DAC_count     => 0,
    dac_signal    => (others => '0'),
    serial_output => (others => '0'),
    update_dac    => '0',
	 sdin 			=> '0'
    );

  signal r   : Read_DAC := DAC_init;
  signal rin : Read_DAC;

begin

  DAC_FSM : process (r, update_dac, DAC_DIGITAL_THRESHOLD, rst)
    variable v : Read_DAC;
  begin  -- process FSM
    v            := r;
    v.update_dac := '0';
    case(r.state) is
      when ST_IDLE =>
		 v := DAC_init;
		 if(update_dac = '1') then
			v.state         := ST_READ;
			v.serial_output := "00" & DAC_DIGITAL_THRESHOLD & "00";
			v.DAC_count     := 0;
			v.update_dac    := '0';
		 end if;
    when ST_READ =>
		v.serial_output := r.serial_output;
		 if(r.DAC_count = 15) then
			v.state      := ST_OUT;
			v.sdin       := r.serial_output(r.DAC_count);
			v.update_dac := '1';
		 else
			v.update_dac := '1';
			v.DAC_count  := r.DAC_count + 1;
			v.sdin       := r.serial_output(r.DAC_count);
		 end if;
    when ST_OUT =>
		 v.state      := ST_IDLE;
		 v.DAC_count  := 0;
		 v.update_dac := '0';
	 when others =>
		 v.state      := ST_IDLE;
		 v            := DAC_init;
  end case;

  -- Reset logic
  if (rst = '1') then
    v := DAC_init;
  end if;

  sdin <= r.sdin;
  sync_n <= not r.update_dac;           --cs_n is active low..

  -- Assignment of combinatorial variable to signal
  rin <= v;
end process DAC_FSM;

--don't forget to update the reading signal
seq : process (clk) is
begin
  if (rising_edge(clk)) then
    r <= rin;
  end if;
end process seq;

end Behavioral;

