--updated sim version 11/9/2018
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--Kurtis Sensei
--use work.UtilityPkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all

entity ETH_header is
  
  generic (
    data_size : natural := 32;      -- size of each data word you tend to ship
    endianess : string  := "BIG");  -- label the type of the endianess for which you plan to ship your data
  port (
    Destination_MAC : in std_logic_vector(47 downto 0);
    Source_MAC      : in std_logic_vector(47 downto 0);
    ipv4_Dest_IP    : in std_logic_vector(31 downto 0);
    ipv4_Source_IP  : in std_logic_vector(31 downto 0);

    clk : in std_logic;
    rst : in std_logic;

    UDP_src_prt  : in std_logic_vector(15 downto 0);
    UDP_dest_prt : in std_logic_vector(15 downto 0);

    data_output : out std_logic_vector(data_size - 1 downto 0);
    data_length : in  std_logic_vector(15 downto 0)
    );

  architecture Behavioral of ETH_header is


  ----------------------------------------------- FSM - RECORD - STATES ------------------------------------------------



  type StateType is (
          idle, ETH_HEADER_S, IPV4_HEADER_S, UDP_HEADER_S, DONE
            );
  type ETH_FSM is record
    state            : StateType;
    eth_evtNumber    : std_logic_vector(31 downto 0);
    eth_Data         : std_logic_vector(31 downto 0);
    eth_DataValid    : std_logic;
    eth_DataLast     : std_logic;
    eth_DataKeep     : std_logic_vector(3 downto 0);
    --eth and ipv4 members
    eth_header_Count : std_logic_vector(2 downto 0);
    eth_dataReady    : std_logic;
  end record Hit_Event;

  constant HIT_INIT_C : Hit_Event := (
    state            => idle,
    eth_evtNumber    => (others => '0'),
    eth_Data         => (others => '0'),
    eth_DataValid    => '0',
    eth_DataLast     => '0',
    eth_DataKeep     => (others => '0'),
    --eth and ipv4 members
    eth_header_Count => "000",
    eth_dataReady    => '0'
    );    

  signal r   : Hit_Event := HIT_INIT_C;
  signal rin : Hit_Event;

  ----------------------------------------------- FSM - RECORD - STATES ------------------------------------------------



  --------------------------------------------ETHERNET / IPv4 / UDP SIGNALS---------------------------------------------

  --ethernet constants  
  constant eth_TYPE_1     : std_logic_vector(7 downto 0)  := x"08";
  constant eth_TYPE_2     : std_logic_vector(7 downto 0)  := x"00";
  constant IHL_VERSION    : std_logic_vector(7 downto 0)  := x"45";
  constant ECN_DSCP       : std_logic_vector(7 downto 0)  := x"00";
  constant offset_2       : std_logic_vector(7 downto 0)  := x"00";
  constant flags_offset_1 : std_logic_vector(7 downto 0)  := x"40";
  constant s_TTL          : std_logic_vector(7 downto 0)  := x"03";
  constant s_protocol     : std_logic_vector(7 downto 0)  := x"11";
  constant udp_checksum   : std_logic_vector(15 downto 0) := x"0000";

  signal identification_1 : std_logic_vector(7 downto 0);
  signal identification_2 : std_logic_vector(7 downto 0);
  signal header_chksm_1   : std_logic_vector(7 downto 0);
  signal header_chksm_2   : std_logic_vector(7 downto 0);

  --evtNumber(15 downto 0) is used in lieu of s_identification
  signal s_identification : std_logic_vector(15 downto 0);

  --eth / ipv4 signals
  signal s_total_length : std_logic_vector(15 downto 0);

  signal ipv4_header_checksum : std_logic_vector(15 downto 0);

  -- signal eth_SrcMac  : std_logic_vector(47 downto 0);
  -- signal eth_DestMac : std_logic_vector(47 downto 0);
  -- signal ipv4_DestIP : std_logic_vector(31 downto 0);
  -- signal ipv4_SrcIP  : std_logic_vector(31 downto 0);

  --    new udp_packet info
  signal udp_SrcPort  : std_logic_vector(15 downto 0);
  signal udp_DestPort : std_logic_vector(15 downto 0);
  signal s_udp_length : std_logic_vector(15 downto 0);
  --udp checksum (all zero's)

  --------------------------------------------END ETH / IPV4 SIGNALS ---------------------------------------------------

  begin  -- architecture Behavioral


  --hopeful corrections to what the Src and DestMac values are stored as..

    --ipv4 IP
    ipv4_DestIP <= Source_

    ipv4_DestIP <= prt_NBIC_destIP(31 downto 0);
    ipv4_SrcIP <= prt_LAPPD_SrcIP(31 downto 0);

  --udp ports, src is first 16 bits as read, but is still flipped..
  udp_SrcPort  <= prt_NBIC_ports(31 downto 24) & prt_NBIC_ports(23 downto 16);
  udp_DestPort <= prt_NBIC_ports(15 downto 8) & prt_NBIC_ports(7 downto 0);

  --    assign the byte signals their updated values..
  s_identification <= r.evtNumber(15 downto 0);
  length_1         <= s_total_length(7 downto 0);
  length_2         <= s_total_length(15 downto 8);
  identification_1 <= s_identification(7 downto 0);
  identification_2 <= s_identification(15 downto 8);
  header_chksm_1   <= ipv4_header_checksum(7 downto 0);
  header_chksm_2   <= ipv4_header_checksum(15 downto 8);

  end architecture Behavioral;


-- Example of a likely function you'll need in the eth header_procedure
  constant IHL_VERSION : std_logic_vector(7 downto 0) := x"45";
  constant ECN_DSCP    : std_logic_vector(7 downto 0) := x"00";
  constant flags_offset_1 : std_logic_vector(7 downto 0) := x"40";
  constant offset_2       : std_logic_vector(7 downto 0) := x"00";
  constant s_TTL        : std_logic_vector(7 downto 0) := x"03";
  constant s_protocol   : std_logic_vector(7 downto 0) := x"11";

  signal s_total_length : std_logic_vector(15 downto 0) -- user supplied input
  signal s_identification : std_logic_vector(15 downto 0); -- user supplied input
  signal ipv4_SrcIp : std_logic_vector(31 downto 0); -- microBlaze supplied input
  signal ipv4_DestIp : std_logic_vector(31 downto 0); -- microBlaze supplied input

  
  proc_ipChecksum : process
    (ipv4_SrcIp, ipv4_destIp,s_identification, s_total_length) is
    variable iWord1     : std_logic_vector(31 downto 0) := (others => '0');
    variable iWord2     : std_logic_vector(31 downto 0) := (others => '0');
    variable iWord3     : std_logic_vector(31 downto 0) := (others => '0');
    variable iWord4     : std_logic_vector(31 downto 0) := (others => '0');
    variable iWord5     : std_logic_vector(31 downto 0) := (others => '0');
    variable iWord6     : std_logic_vector(31 downto 0) := (others => '0');
    variable iWord7     : std_logic_vector(31 downto 0) := (others => '0');
    variable iWord8     : std_logic_vector(31 downto 0) := (others => '0');
    variable iWord9     : std_logic_vector(31 downto 0) := (others => '0');
    variable iChecksum1 : unsigned(31 downto 0)         := (others => '0');
    variable iChecksum2 : unsigned(31 downto 0)         := (others => '0');
    variable iChecksum3 : unsigned(31 downto 0)         := (others => '0');
    variable iChecksum4 : unsigned(15 downto 0)         := (others => '0');
  begin
    -- Prep words
    iWord1 := x"0000" & IHL_VERSION & ECN_DSCP;
    iWord2 := x"0000" & s_total_length;
    --identification?
    iWord7 := x"0000" & s_identification;
    iWord3 := x"0000" & flags_offset_1 & offset_2;
    iWord4 := x"0000" & s_TTL & s_protocol;
    iWord5 := x"0000" & ipv4_SrcIp(7 downto 0) & ipv4_SrcIp(15 downto 8);
    iWord6 := x"0000" & ipv4_SrcIp(23 downto 16) & ipv4_SrcIp(31 downto 24);
    iWord8     := x"0000" & ipv4_destIp(7 downto 0) & ipv4_destIp(15 downto 8);
    iWord9     := x"0000" & ipv4_destIp(23 downto 16) & ipv4_destIp(31 downto 24);
    -- Static part
    iChecksum1 := unsigned(iWord1) +    -- x4500 
                  unsigned(iWord2) +    -- x0318
                  -- + ipId(2 bytes)     --
                  unsigned(iWord3) +    -- x4000
                  unsigned(iWord4) +    -- x0311
                  -- + ipChecksum(this)
                  unsigned(iWord5) +    -- x???? [known at compile time]
                  unsigned(iWord6);     -- xC0A8
    -- Dynamic part
    iChecksum2 := iChecksum1 +
                  unsigned(iWord7) +    -- x????
                  unsigned(iWord8) +  -- x???? [also known at compile time usually?]
                  unsigned(iWord9);     -- xC0A8
    -- Do the carry once
    iChecksum3 := (x"0000" & iChecksum2(15 downto 0)) +
                  (x"0000" & iChecksum2(31 downto 16));
    -- Do the carry again
    iChecksum4           := iChecksum3(15 downto 0) + iChecksum3(31 downto 16);
    -- Perform one's complement
    ipv4_header_checksum <= not(std_logic_vector(iChecksum4));
  end process;

  ----------------- Length Function Calculator ----------------------------
  -- returns a 15 : 0 slv
  -- udp_length / ipv4_length = udp_length + 20
  -------------------------------------------------------------------------
  -- proc_s_total_length : process (num_addr_afts, num_addr_befs) is

  --   variable counts_after    : unsigned(15 downto 0) := (others => '0');
  --   variable counts_before   : unsigned(15 downto 0) := (others => '0');
  --   variable bytes_in_frames : unsigned(15 downto 0) := (others => '0');
    
  -- begin
    
  --   counts_after  := unsigned(x"000" & num_addr_afts);
  --   counts_before := unsigned(x"000" & num_addr_befs);

  --   bytes_in_frames := counts_before + counts_after;
  --   bytes_in_frames := bytes_in_frames(10 downto 0) & "00000";
  --   bytes_in_frames := 40 + bytes_in_frames;

  --   s_total_length <= std_logic_vector(bytes_in_frames);
  --   s_udp_length   <= std_logic_vector(bytes_in_frames - 20);
    
  -- end process;

    
