----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Kevin Keefe 
-- 
-- Create Date:    13:30:25 11/26/2018 
-- Design Name: 
-- Module Name:    MCP3202_readout - Behavioral --updated from the current name for the downgraded speed ADC.
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

entity ADC7276_readout is
  Port (
    clk            : in  STD_LOGIC;
    RST            : in  STD_LOGIC;
    sdata          : in  STD_LOGIC;
    cs_n           : out STD_LOGIC;
    sdout          : out STD_LOGIC;
    begin_read     : in  STD_LOGIC;
    channel_sel    : in  STD_LOGIC;
    digital_output : out STD_LOGIC_VECTOR(11 downto 0);
    evt_count      : out STD_LOGIC_VECTOR(11 downto 0)
    );
end ADC7276_readout;

architecture Behavioral of ADC7276_readout is

  type StateType is (ST_IDLE, ST_DIN_SEL, ST_READ, ST_OUT);  -- read adc FSM

  type Read_ADC is record
    state        : StateType;
    ADC_count    : integer range 0 to 15;
    sdout        : std_logic;
    evt_count    : std_logic_vector(11 downto 0);
    adc_signal   : STD_LOGIC_VECTOR(11 downto 0);
    serial_input : STD_LOGIC_VECTOR(12 downto 0);
    begin_read   : STD_LOGIC;
  end record;

  constant ADC_init : Read_ADC := (
    state        => ST_IDLE,
    ADC_count    => 0,
    sdout        => '0',
    adc_signal   => (others => '0'),
    evt_count    => (others => '0'),
    serial_input => (others => '0'),
    begin_read   => '0'
    );

  signal r           : Read_ADC := ADC_init;
  signal rin         : Read_ADC := ADC_init;
  signal dig_rev_out : std_logic_vector(11 downto 0);
  
begin

--begin assignments to top level ports from the FSM
--send read_data low when you want to begin a read
  digital_output <= dig_rev_out;

ADC_FSM : process (r, begin_read, sdata, channel_sel, rst)
        variable v : Read_ADC;
begin  -- process FSM
                v := r;
 case(r.state) is
        when ST_IDLE =>
                 v           := ADC_init;
                 v.evt_count := r.evt_count;
                 if(begin_read = '1') then
                        v.state      := ST_DIN_SEL;
                        v.evt_count  := std_logic_vector(unsigned(r.evt_count) + 1);
                        v.begin_read := '1';
                        v.ADC_count  := 0;
                 end if;
         when ST_DIN_SEL =>
                 v.begin_read := '1';

                 if r.ADC_count = 0 then     --power on the ADC
                        v.sdout     := '1';
                        v.ADC_count := r.ADC_count + 1;
                 elsif r.ADC_count = 1 then  --DIFF mode sel 1 is always single ended pair
                        v.sdout     := '1';
                        v.ADC_count := r.ADC_count + 1;
                 elsif r.ADC_count = 2 then  --ODD SIGN sel 
                        v.sdout     := channel_sel;
                        v.ADC_count := r.ADC_count + 1;
                 else                   --MSB bit first -1 true,
                        v.sdout     := '1';
                        v.state     := ST_READ;
                        v.ADC_count := 0;
                 end if;
    when ST_READ =>
                        v.begin_read := '1';
                if(r.ADC_count = 12) then
                        v.state := ST_OUT;
                else
                        v.sdout                     := '0';
                        v.ADC_count                 := r.ADC_count + 1;
                        v.serial_input(r.ADC_count) := sdata;
                end if;

    when ST_OUT =>
                 v.begin_read := '0';
                 v.adc_signal := r.serial_input(12 downto 1);
                 v.state      := ST_IDLE;
         when others =>
                 v.state := ST_IDLE;
                 v       := ADC_init;
  end case;

  -- Reset logic
  if (rst = '1') then
    v := ADC_init;
  end if;

--reverse the bit order since the ADC ports in the MSB first..
  cs_n        <= not r.begin_read;      --cs_n is active low..
  dig_rev_out <= r.adc_signal(0) & r.adc_signal(1) & r.adc_signal(2) & r.adc_signal(3) & r.adc_signal(4) & r.adc_signal(5) & r.adc_signal(6) &
                 r.adc_signal(7) & r.adc_signal(8) & r.adc_signal(9) & r.adc_signal(10) & r.adc_signal(11);
  evt_count <= r.evt_count;
  sdout     <= r.sdout;

        -- Assignment of combinatorial variable to signal
  rin <= v;
end process ADC_FSM;

--don't forget to update the reading signal
seq : process (clk) is
begin
  if (rising_edge(clk)) then
    r <= rin;
  end if;
end process seq;


end Behavioral;

