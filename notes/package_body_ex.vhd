-- note a package must have a declaration and then a body definition


-- declaration of a package
package ex_pkg is

  -- ethernet header constants used by following functions and procedure.
  constant IHL_VERSION     : std_logic_vector(7 downto 0) := x"45";
  constant ECN_DSCP        : std_logic_vector(7 downto 0) := x"00";
  constant flags_offset    : std_logic_vector(7 downto 0) := x"40";
  constant fragment_offset : std_logic_vector(7 downto 0) := x"00";
  constant TTL             : std_logic_vector(7 downto 0) := x"03";
  constant IPv4_protocol   : std_logic_vector(7 downto 0) := x"11";

  -- use this function to determine the number of bytes you will send in a data
  -- frame. This includes the necessary IPv4 and UDP header info..
  function eth_calculate_length (
    signal data_frame_byte_size : natural;  -- in a single data
    signal num_data_frames      : natural)  -- how many data frames you will be shipping off in this transaction
    return std_logic_vector(15 downto 0);

function eth_calculate_IPv4_chksm (
  signal IPv4_Source_IP        : std_logic_vector(31 downto 0);
  signal IPv4_Destination_IP   : std_logic_vector(31 downto 0);
  signal packet_identification : std_logic_vector(15 downto 0);
  signal packet_length_inBytes : std_logic_vector(15 downto 0))
  return std_logic_vector(15 downto 0);

  procedure eth_build_frame_header
    generic (
      GATE_DELAY_G : time := 2 ns
      );
  (
    signal begin_frame_build     : in  std_logic;
    signal Destination_Mac_addr  : in  std_logic_vector(47 downto 0);
    signal Source_Mac_addr       : in  std_logic_vector(47 downto 0);
    signal packet_length_inBytes : in  std_logic_vector(15 downto 0);
    signal packet_identification : in  std_logic_vector(15 downto 0);
    signal IPv4_chksm            : in  std_logic_vector(15 downto 0);
    signal IPv4_Source_IP        : in  std_logic_vector(31 downto 0);
    signal IPv4_Destination_IP   : in  std_logic_vector(31 downto 0);
    signal UDP_Destination_port  : in  std_logic_vector(15 downto 0);
    signal UDP_Source_port       : in  std_logic_vector(15 downto 0);
    signal data_stream_out       : out std_logic_vector(31 downto 0);
    signal data_keep             : out std_logic_vector(3 downto 0);
    signal data_valid            : out std_logic;
    signal end_frame_build       : out std_logic
    );

end package ex_pkg;


-- definition of the package body
package body ex_pkg is


  -- purpose: use this function to calculate the IPv4 header chksm
  function eth_calculate_IPv4_chksm (
    signal IPv4_Source_IP        : std_logic_vector(31 downto 0);
    signal IPv4_Destination_IP   : std_logic_vector(31 downto 0);
    signal packet_identification : std_logic_vector(15 downto 0);
    signal packet_length_inBytes : std_logic_vector(15 downto 0))
    return std_logic_vector(15 downto 0) is
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
  begin  -- function eth_calculate_IPv4_chksm

    -- Prep words
    iWord1     := x"0000" & IHL_VERSION & ECN_DSCP;
    iWord2     := x"0000" & packet_length_inBytes;
    --identification?
    iWord7     := x"0000" & packet_identification;
    iWord3     := x"0000" & flags_offset & fragment_offset;
    iWord4     := x"0000" & TTL & IPv4_protocol;
    iWord5     := x"0000" & IPv4_Source_IP(7 downto 0) & IPv4_Source_IP(15 downto 8);
    iWord6     := x"0000" & IPv4_Source_IP(23 downto 16) & IPv4_Source_IP(31 downto 24);
    iWord8     := x"0000" & IPv4_Destination_IP(7 downto 0) & IPv4_Destination_IP(15 downto 8);
    iWord9     := x"0000" & IPv4_Destination_IP(23 downto 16) & IPv4_Destination_IP(31 downto 24);
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
    iChecksum4 := iChecksum3(15 downto 0) + iChecksum3(31 downto 16);

    -- Perform one's complement
    --ipv4_header_checksum <= not(std_logic_vector(iChecksum4));
    return (not(std_logic_vector(iChecksum4)));
    
  end function eth_calculate_IPv4_chksm;

  -- purpose: place this bad boy in a single state in a FSM to build Eth_headers for you.
  procedure eth_build_frame_header
  generic (
    GATE_DELAY_G : time := 2 ns
    );
    (
    signal clk                   : in  std_logic;
    signal begin_frame_build     : in  std_logic;
    signal Destination_Mac_addr  : in  std_logic_vector(47 downto 0);
    signal Source_Mac_addr       : in  std_logic_vector(47 downto 0);
    signal packet_length_inBytes : in  std_logic_vector(15 downto 0);
    signal packet_identification : in  std_logic_vector(15 downto 0);
    signal IPv4_chksm            : in  std_logic_vector(15 downto 0);
    signal IPv4_Source_IP        : in  std_logic_vector(31 downto 0);
    signal IPv4_Destination_IP   : in  std_logic_vector(31 downto 0);
    signal UDP_Destination_port  : in  std_logic_vector(15 downto 0);
    signal UDP_Source_port       : in  std_logic_vector(15 downto 0);
    signal data_stream_out       : out std_logic_vector(31 downto 0);
    signal end_frame_build       : out std_logic) is

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
    
  begin  -- procedure eth_build_frame_header

    -- purpose: process defines the sequential states of the eth_builder_FSM
    -- type   : sequential
    eth_header_FSM : process (clk) is
      variable v : Hit_Event;
    begin  -- process eth_header_FSM
    v              := r;
    -- Resets for pulsed outputs
    v.evtDataValid := '0';
    v.evtDataLast  := '0';

    case r.state is

      when idle =>

        v := HIT_INIT_C;
        v.dataReady = '1';

        if begin_frame_build = '1' then
          v.state := ETH_HEADER_S;
        end if;

      when ETH_HEADER_S =>

        case r.header_Count is

          when "000" =>
            v.eth_Data     := x"0000" & eth_DestMac(15 downto 0);
            v.evtDataKeep  := "0011";
            v.header_Count := "001";

          when "001" =>
            v.evtData      := eth_DestMac(47 downto 16);
            v.evtDataKeep  := x"f";
            v.header_Count := "010";
            
          when "010" =>
            v.evtData      := eth_SrcMac(31 downto 0);
            v.evtDataKeep  := x"f";
            v.header_Count := "011";

          when "011" =>
            v.evtData      := eth_TYPE_2 & eth_TYPE_1 & eth_srcMac(47 downto 32);
            v.evtDataKeep  := x"f";
            v.state        := IPV4_HEADER_S;
            v.header_count := "000";

          when others =>
            v.state := idle;
            v       := HIT_INIT_C;
            

      when IPV4_HEADER_S =>

        v.evtDataValid := '1';
        v.dataReady    := '0';

        case r.header_Count is
            
          when "000" =>
            v.evtData      := packet_length_inBytes & ECN_DSCP & IHL_VERSION;
            v.evtDataKeep  := x"f";
            v.header_Count := "001";

          when "001" =>
            v.evtData      := fragment_offset & flags_offset & packet_identification;
            v.evtDataKeep  := x"f";
            v.header_Count := "010";
            
          when "010" =>
            v.evtData      := IPv4_chksm & IPv4_protocol & TTL;
            v.evtDataKeep  := x"f";
            v.header_Count := "011";

          when "011" =>
            v.evtData      := IPv4_Source_IP;
            v.evtDataKeep  := x"f";
            v.header_Count := "100";

          when "100" =>
            v.evtData     := IPv4_Destination_IP;
            v.evtDataKeep := x"F";
            v.state       := UDP_HEADER_S;
            
          when others =>
            v.state := idle;
            v       := HIT_INIT_C;

            
      when UDP_HEADER_S =>

        v.evtDataValid := '1';
        v.dataReady    := '0';

        case r.header_count is

          when "000" =>
            v.evtData      := UDP_Destination_port & UDP_Source_port;
            v.evtDataKeep  := x"F";
            v.header_count := "001";

          when "001" =>
            -- right now the packet_length in bytes is in error, must be 20
            -- bytes shorter right now..
            v.evtData      := udp_Checksum & packet_length_inBytes;
            v.evtDataKeep  := x"F";
            v.header_count := "000";
            v.end_frame_build = '1';
            v.state        := idle;
            
          when others =>
            v.state := CHILLIN;
            v       := HIT_INIT_C;
        end case;
      when others => null;
    end case;

    end process eth_header_FSM;


    seq : process (clk) is
    begin
      if (rising_edge(clk)) then
        r <= rin after GATE_DELAY_G;
      end if;
    end process seq;

    
  end procedure eth_build_frame_header;

end package body ex_pkg;
