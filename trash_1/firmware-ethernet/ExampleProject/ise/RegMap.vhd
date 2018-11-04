library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.UtilityPkg.all;
--use work.Version.all;
--use work.P1Pkg.all;
-- For Xilinx primitives
library UNISIM;
use UNISIM.VComponents.all;

entity RegMap is
  port (
    clk           : in  sl;
    sRst          : in  sl;
    -- Register interfaces to UART controller
    regAddr       : in  slv(31 downto 0);
    regWrData     : in  slv(31 downto 0);
    regRdData     : out slv(31 downto 0);
    regReq        : in  sl;
    regOp         : in  sl;
    regAck        : out sl
    );
end RegMap;

architecture Behavioral of RegMap is
  
  signal efuseVal    : slv(31 downto 0);
  signal deviceDna   : slv(63 downto 0);

  signal scratchPad  : slv(31 downto 0);
  
  -- Signals for LAPPD Board: SRC MAC,IP
  signal LAPPD_srcMac : slv(63 downto 0);
  signal LAPPD_srcIP  : slv(31 downto 0);
  
  -- Signals for the NishiBackplaneIonCannon: Outgoing Port, Dest MAC, Dest IP, Dest port}
  signal NBIC_ports   : slv (31 downto 0);
  signal NBIC_destIP  : slv (31 downto 0);
  signal NBIC_destMac : slv(63 downto 0);
  
  -- Signals for itchy and scratchy
  signal itchy_scratchy : slv(31 downto 0);     
    
  constant BITS_ADDR_C : integer := 32;               
  constant BITS_DATA_C : integer := 32;
  
  attribute dont_touch : string;
--   attribute dont_touch of i2cSclT : signal is "true";
--   attribute dont_touch of i2cSdaT : signal is "true";

begin

  process (clk) 
    variable adcAddr : integer range 0 to 3 := 0;
  begin
    if rising_edge(clk) then
      -- if sRst = '1' then
      --    p1ConfigReg <= CONFIG_TYPE_INIT_C;
      -- else
      -- Default for all registers write and read in one cycle.
      -- This can be overridden below for specific registers.
      regAck    <= regReq;

      --
      -- Register mapping: provincial
      -- KC 10/20/18
      --
      -- *) Segmented at 4K boundaries based on "logical" subsystems
      -- *) Spaced by 32 bits to accommodate a full metadata register for
      --    each register.
      --
      if regAddr(15 downto 12) = x"0" then
        case regAddr(11 downto 0) is
          --- Registers: 0x000 (raw device stuff)
          when x"000" => regRdData <= x"c0decafe";
          when x"008" => regRdData <= deviceDna(31 downto 0);
          when x"010" => regRdData <= deviceDna(63 downto 32);
          when x"018" => regRdData <= efuseVal;
                         
          -- Signal itchy_scratchy
          when x"020" => regRdData <= itchy_scratchy;
                         if regOp = '1' and regReq = '1' then
                           itchy_scratchy <= regWrData;
                         end if;

          --- Registers: 0x100 (LAPPD uBlaze stuff)
          -- Signal LAPPD_srcMac
          when x"100" => regRdData <= LAPPD_srcMac (31 downto 0);
                        if regOp = '1' and regReq = '1' then
                          LAPPD_srcMac (31 downto 0) <= regWrData;
                        end if;          

          when x"108" => regRdData <= LAPPD_srcMac (63 downto 32);
                        if regOp = '1' and regReq = '1' then
                          LAPPD_srcMac (63 downto 32) <= regWrData;
                        end if;          

          -- Signal LAPPD_srcIP
          when x"110" => regRdData <= LAPPD_srcIP;
                        if regOp = '1' and regReq = '1' then
                          LAPPD_srcIP <= regWrData;
                        end if;

          -- Registers: 0x200 (NBIC hardware stuff)
          -- Signal NBIC_destMac
          when x"200" => regRdData <= NBIC_destMac (31 downto 0);
                        if regOp = '1' and regReq = '1' then
                          NBIC_destMac (31 downto 0) <= regWrData;
                        end if;          

          when x"208" => regRdData <= NBIC_destMac (63 downto 32);
                        if regOp = '1' and regReq = '1' then
                          NBIC_destMac (63 downto 32) <= regWrData;
                        end if;          

          -- Signal NBIC_destIP              
          when x"210" => regRdData <= NBIC_destIP;
                        if regOp = '1' and regReq = '1' then
                          NBIC_destIP <= regWrData;
                        end if;

          -- Signal NBIC_ports
          -- The source port is in the low bytes, the dest
          -- port is in the high bytes
          when x"218" => regRdData <= NBIC_ports;
                        if regOp = '1' and regReq = '1' then
                          NBIC_ports <= regWrData;
                        end if;
                         
          -- Set the boobcode if you tried to get something that wasn't there
          when others => regRdData <= x"B00BC0DE";
        end case;
      else
        regRdData <= x"DEADC0DE";
      end if;
    end if;
  end process;

  -----------------------------------------------------
  -- Xilinx primitives or simple derivatives thereof --
  -----------------------------------------------------
--  -- One-time burnable eFUSE (32-bit)
--  U_Efuse : EFUSE_USR
--    generic map (
--      SIM_EFUSE_VALUE => X"00000000" -- Value of the 32-bit non-volatile value used in simulation
--      )
--    port map (
--      EFUSEUSR => efuseVal -- 32-bit output: User eFUSE register value output
--      );
--  -- Device DNA (64-bit)
  
  
  U_DeviceDna : entity work.DeviceDna
    port map ( 
      clk       => clk,
      rst       => sRst,
      -- Parallel interface for current ticks value
      dnaOut    => deviceDna
      );
  
  

end Behavioral;
