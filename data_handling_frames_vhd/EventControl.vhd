----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2016 08:54:53 AM
-- Design Name: 
-- Module Name: EventControl - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use work.UtilityPkg.all;
use work.CrcPkg.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity EventControl is
   generic (
      GATE_DELAY_G : time := 1 ns
   );
   port (
      -- Clock and reset inputs
      sysClk          : in  sl;
      sysRst          : in  sl;
      -- Trigger input
      evtTrigger      : in  sl;
      trigArm         : in  sl;
      -- ADC data in
      adcClk          : in  sl;
   	adcADataWords   : in  Word14Array(7 downto 0); 
      adcADataValid   : in  slv(7 downto 0);
      adcBDataWords   : in  Word14Array(7 downto 0);
      adcBDataValid   : in  slv(7 downto 0);
      adcCDataWords   : in  Word14Array(1 downto 0);
      adcCDataValid   : in  slv(1 downto 0);      
      -- Event data out
      evtData         : out slv(31 downto 0);
      evtDataValid    : out sl;
      evtDataLast     : out sl;
      evtDataReady    : in  sl;
      -- Configuration inputs from register control
      drsDivideRatio  : in  slv(7 downto 0);
      drsConfigReg    : in  slv(7 downto 0);
      drsConfigRegReq : in  sl;
      drsConfigRegAck : out sl;
      drsWriteReg     : in  slv(7 downto 0);
      drsWriteRegReq  : in  sl;
      drsWriteRegAck  : out sl;
      drsWrConReg     : in  slv(7 downto 0);
      drsWrConRegReq  : in  sl;
      drsWrConRegAck  : out sl;
      drsNSamples     : in  slv(9 downto 0);
      testPattern     : in  sl;
      pipeDelay       : in  slv(4 downto 0);
      readData        : in  sl;
      dataBurstSize   : in  slv(31 downto 0);
      roiMode         : in  sl;
      eventCountToSet : in  slv(31 downto 0);
      setEventCount   : in  sl;
      eventLock       : in  sl;
      autoArm         : in  sl;
      -- Coordination with multi-board trigger
      commonTrigAllow : out sl;
      commonTrigBusy  : out sl;
      -- Status outputs 
      drsLocked       : out slv(1 downto 0);
      dataReady       : out sl;
      eventCount      : out slv(31 downto 0);
      -- Signals out to DRS4s
      doDrsSync       : in  sl;
      drsRefClk       : out slv(1 downto 0);
      drsResetN       : out sl;
      drsDEnable      : out sl;
      drsDWrite       : out sl;
      drsSrClk        : out sl;
      drsSrIn         : out sl;
      drsAddr         : out slv(3 downto 0);
      drsRsrLoad      : out sl;
      -- Signals in from DRS4s
      drsPllLck       : in  slv(1 downto 0);
      drsSrOut        : in  slv(1 downto 0)
   );
end EventControl;

 architecture Behavioral of EventControl is

   type StateType     is (IDLE_S,ARM_S,SYNC_S,WAIT_READOUT_S,HEADER_S,DATA_A_S,DATA_B_S,DATA_C_S,CRC_CALC_S,CRC_S,FOOTER_S,WAIT_TRANSFER_S,DONE_S);
   type RegType is record
      state        : StateType;
      evtNumber    : slv(31 downto 0);
      evtData      : slv(31 downto 0);
      evtDataValid : sl;
      evtDataLast  : sl;
      readoutReq   : sl;
      highLow      : sl;
      dataCount    : slv(9 downto 0);
      sampCount    : slv(9 downto 0);
      adcARdEn     : slv(7 downto 0);
      adcBRdEn     : slv(7 downto 0);
      adcCRdEn     : slv(1 downto 0);
      dataReady    : sl;
      crcReset     : sl;
   end record RegType;

   constant REG_INIT_C : RegType := (
      state        => IDLE_S,
      evtNumber    => (others => '0'),
      evtData      => (others => '0'),
      evtDataValid => '0',
      evtDataLast  => '0',
      readoutReq   => '0',
      highLow      => '0',
      dataCount    => (others => '0'),
      sampCount    => (others => '0'),
      adcARdEn     => (others => '0'),
      adcBRdEn     => (others => '0'),
      adcCRdEn     => (others => '0'),
      dataReady    => '0',
      crcReset     => '0'
   );    

   signal r   : RegType := REG_INIT_C;
   signal rin : RegType;

   signal iDrsRefClk   : sl              := '0';
   signal drsHalfT     : slv(7 downto 0) := (others => '0');
   signal iDrsLocked   : slv(1 downto 0) := (others => '0');
   
   signal readoutAck   : sl;
   signal stopSampleA  : slv(9 downto 0);
   signal stopSampleB  : slv(9 downto 0);
   signal sampleValid  : sl;
   
   signal adcSync      : sl := '0';

   signal adcARdData   : Word14Array(7 downto 0);
   signal adcBRdData   : Word14Array(7 downto 0);
   signal adcCRdData   : Word14Array(1 downto 0);
   signal adcAEmpty    : slv(7 downto 0);
   signal adcBEmpty    : slv(7 downto 0);
   signal adcCEmpty    : slv(1 downto 0);
   signal adcABCEmpty  : sl;
   signal adcAFull     : slv(7 downto 0);
   signal adcBFull     : slv(7 downto 0);
   signal adcCFull     : slv(1 downto 0);
   signal adcABCFull   : sl;
   signal adcAValid    : slv(7 downto 0);
   signal adcBValid    : slv(7 downto 0);
   signal adcCValid    : slv(1 downto 0);

   signal evtFifoReady : sl; 

   signal sampleValidPipeA : slv(31 downto 0);
   signal sampleValidPipeB : slv(31 downto 0);
   signal sampleValidPipeC : slv(31 downto 0);
   signal sampleValidA     : sl := '0';
   signal sampleValidB     : sl := '0';
   signal sampleValidC     : sl := '0';
   
   signal crcValue         : slv(31 downto 0) := (others => '0');

   -- Component declaration for IP cores
   COMPONENT adc_channel_fifo
      PORT (
         clk   : IN STD_LOGIC;
         srst  : IN STD_LOGIC;
         din   : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
         wr_en : IN STD_LOGIC;
         rd_en : IN STD_LOGIC;
         dout  : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
         full  : OUT STD_LOGIC;
         empty : OUT STD_LOGIC;
         valid : OUT STD_LOGIC
      );
   END COMPONENT;

   COMPONENT fifo_generator_event_data
     PORT (
       s_aclk        : IN STD_LOGIC;
       s_aresetn     : IN STD_LOGIC;
       s_axis_tvalid : IN STD_LOGIC;
       s_axis_tready : OUT STD_LOGIC;
       s_axis_tdata  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
       s_axis_tlast  : IN STD_LOGIC;
       m_axis_tvalid : OUT STD_LOGIC;
       m_axis_tready : IN STD_LOGIC;
       m_axis_tdata  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
       m_axis_tlast  : OUT STD_LOGIC
     );
   END COMPONENT;

   attribute dont_touch : string;
   attribute dont_touch of evtFifoReady : signal is "true";
   attribute dont_touch of sampleValid  : signal is "true";
   attribute dont_touch of adcAEmpty    : signal is "true";
   attribute dont_touch of adcBEmpty    : signal is "true";
   attribute dont_touch of adcCEmpty    : signal is "true";

begin

   commonTrigAllow <= '1' when eventLock = '0' else '0';
   commonTrigBusy  <= '1' when eventLock = '0' and r.state = ARM_S else '0';

   -- 
   comb : process( r, sysRst, evtTrigger, readoutAck, adcSync, 
                   adcAEmpty, adcBEmpty, adcCEmpty, 
                   adcAValid, adcBValid, adcCValid, 
                   drsNSamples, 
                   stopSampleA, stopSampleB, 
                   adcARdData, adcBRdData, adcCRdData,
                   trigArm, evtFifoReady, testPattern, readData,
                   dataBurstSize, eventCountToSet, setEventCount,
                   adcABCFull, adcABCEmpty) is
      variable v : RegType;
   begin
      v := r;

      -- Resets for pulsed outputs
      v.evtDataValid := '0';
      v.evtDataLast  := '0';
      v.crcReset     := '0';
      v.adcARdEn     := (others => '0');
      v.adcBRdEn     := (others => '0');
      v.adcCRdEn     := (others => '0');
      
      if (setEventCount = '1') then
         v.evtNumber := eventCountToSet;
      end if;
      
      -- State machine 
      case(r.state) is 
         when IDLE_S =>
            v.crcReset  := '1';
            v.dataReady := '0';
            v.dataCount := (others => '0');
            v.sampCount := (others => '0');
            v.highLow   := '0';
            if eventLock = '0' then
               if trigArm = '1' or dataBurstSize > 0 or autoArm = '1' then
                  v.state     := ARM_S;
               end if;
            end if;
         when ARM_S =>
            if evtTrigger = '1' then
               v.evtNumber := r.evtNumber + 1;
               v.state     := SYNC_S;
            end if;            
         when SYNC_S =>
            if adcSync = '1' then
               v.readoutReq := '1';
               v.state      := WAIT_READOUT_S;
            end if;
         when WAIT_READOUT_S =>
            if readoutAck = '1' then
               v.readoutReq := '0';
               v.state      := HEADER_S; 
            end if;
         when HEADER_S =>
            if evtFifoReady = '1' then
               v.dataCount := r.dataCount + 1;
            end if;
            case(conv_integer(r.dataCount)) is
             --when 1 => v.evtData := x"00000" & "00" & drsNSamples; v.evtDataValid := '1';
               when 0 => v.evtData := r.evtNumber; v.evtDataValid := '1'; 
               when 1 => v.evtData := std_logic_vector(conv_unsigned(conv_integer(unsigned(drsNSamples))+1,32)); v.evtDataValid := '1';
               when 2 => v.evtData := x"00000" & "00" & stopSampleA; v.evtDataValid := '1'; 
               when 3 => v.evtData := x"00000" & "00" & stopSampleB; v.evtDataValid := '1'; v.state := DATA_A_S; v.dataCount := (others => '0'); 
               when others => v.evtData := x"BEEFCAFE";
            end case;
         when DATA_A_S =>
            if r.highLow = '0' then
               if testPattern = '1' then
                  v.evtData(15 downto  0) := "0" & r.dataCount(2 downto 0) & "00" & r.sampCount(9 downto 0);
               else
                  v.evtData(15 downto  0) := adcARdData(conv_integer(r.dataCount)) & "00";
               end if;
            else
               if testPattern = '1' then
                  v.evtData(31 downto 16) := "0" & r.dataCount(2 downto 0) & "00" & r.sampCount(9 downto 0);
               else
                  v.evtData(31 downto 16) := adcARdData(conv_integer(r.dataCount)) & "00";
               end if; 
               v.evtDataValid := '1';
            end if;
            v.adcARdEn(conv_integer(r.dataCount)) := '1';
            v.highLow   := not(r.highLow); 
            v.sampCount := r.sampCount + 1;
            if r.sampCount = conv_integer(drsNSamples) then
               v.sampCount := (others => '0');
               v.highLow   := '0';
               if (r.dataCount < 7) then
                  v.dataCount := r.dataCount + 1;
               else
                  v.dataCount := (others => '0');
                  v.state     := DATA_B_S;
               end if;
            end if;
         when DATA_B_S =>
            if r.highLow = '0' then
               if testPattern = '1' then
                  v.evtData(15 downto  0) := "1" & r.dataCount(2 downto 0) & "00" & r.sampCount(9 downto 0);
               else
                  v.evtData(15 downto  0) := adcBRdData(conv_integer(r.dataCount)) & "00";
               end if;
            else
               if testPattern = '1' then
                  v.evtData(31 downto 16) := "1" & r.dataCount(2 downto 0) & "00" & r.sampCount(9 downto 0);
               else
                  v.evtData(31 downto 16) := adcBRdData(conv_integer(r.dataCount)) & "00";
               end if; 
               v.evtDataValid := '1';
            end if;
            v.adcBRdEn(conv_integer(r.dataCount)) := '1';
            v.highLow   := not(r.highLow); 
            v.sampCount := r.sampCount + 1;
            if r.sampCount = conv_integer(drsNSamples) then
               v.sampCount := (others => '0');
               v.highLow   := '0';
               if (r.dataCount < 7) then
                  v.dataCount := r.dataCount + 1;
               else
                  v.dataCount := (others => '0');
                  v.state     := DATA_C_S;
               end if;
            end if;
         when DATA_C_S =>
            if r.highLow = '0' then
               if testPattern = '1' then
                  v.evtData(15 downto  0) := "0" & r.dataCount(2 downto 0) & "00" & r.sampCount(9 downto 0);
               else
                  v.evtData(15 downto  0) := adcCRdData(conv_integer(r.dataCount)) & "00";
               end if;
            else
               if testPattern = '1' then
                  v.evtData(31 downto 16) := "0" & r.dataCount(2 downto 0) & "00" & r.sampCount(9 downto 0);
               else
                  v.evtData(31 downto 16) := adcCRdData(conv_integer(r.dataCount)) & "00";
               end if; 
               v.evtDataValid := '1';
            end if;
            v.adcCRdEn(conv_integer(r.dataCount)) := '1';
            v.highLow   := not(r.highLow); 
            v.sampCount := r.sampCount + 1;
            if r.sampCount = conv_integer(drsNSamples) then
               v.sampCount := (others => '0');
               v.highLow   := '0';
               if (r.dataCount < 1) then
                  v.dataCount := r.dataCount + 1;
               else
                  v.dataCount := (others => '0');
                  --v.state     := FOOTER_S;
                  v.state     := CRC_CALC_S;
               end if;
            end if;
         when CRC_CALC_S =>
            if (r.dataCount < 1) then
               v.dataCount := r.dataCount + 1;
            else
               v.dataCount := (others => '0');
               v.state := CRC_S;
            end if;
         when CRC_S =>
            v.evtData := crcValue;
            v.evtDataValid := '1';
            v.state := FOOTER_S;
         when FOOTER_S =>
            v.evtData      := x"0ADC0ADC";
            v.evtDataValid := '1';
            v.evtDataLast  := '1';
            v.state        := DONE_S;
         when DONE_S =>
            v.readoutReq := '0';
            if readoutAck = '0' then
               v.state := WAIT_TRANSFER_S;
            end if;
         when WAIT_TRANSFER_S =>
            v.dataReady    := '1';
            if readData = '1' or dataBurstSize > 0 then
               v.state := IDLE_S;
            end if;
         when others =>
            v.state := IDLE_S;
      end case;

      -- Reset logic
      if (sysRst = '1') then
         v := REG_INIT_C;
      end if;

      -- Outputs to ports
      dataReady <= r.dataReady;
      eventCount <= r.evtNumber;

      -- Assignment of combinatorial variable to signal
      rin <= v;

   end process;

   seq : process (sysClk) is
   begin
      if (rising_edge(sysClk)) then
         r <= rin after GATE_DELAY_G;
      end if;
   end process seq;

   --------------------------------------
   -- FIFOs for ADC Data
   --------------------------------------
   G_DataFifosAB : for i in 7 downto 0 generate
      DataFifoA : adc_channel_fifo
      PORT MAP (
         clk   => sysClk,
         srst  => sysRst,
         din   => adcADataWords(i),
         wr_en => adcADataValid(i) and sampleValidA,
         rd_en => r.adcARdEn(i),
         dout  => adcARdData(i),
         full  => adcAFull(i),
         empty => adcAEmpty(i),
         valid => adcAValid(i)
      );
      DataFifoB : adc_channel_fifo
      PORT MAP (
         clk   => sysClk,
         srst  => sysRst,
         din   => adcBDataWords(i),
         wr_en => adcBDataValid(i) and sampleValidB,
         rd_en => r.adcBRdEn(i),
         dout  => adcBRdData(i),
         full  => adcBFull(i),
         empty => adcBEmpty(i),
         valid => adcBValid(i)
      );
   end generate;  
   G_DataFifosC : for i in 1 downto 0 generate
      DataFifoC : adc_channel_fifo
      PORT MAP (
         clk   => sysClk,
         srst  => sysRst,
         din   => adcCDataWords(i),
         wr_en => adcCDataValid(i) and sampleValidC,
         rd_en => r.adcCRdEn(i),
         dout  => adcCRdData(i),
         full  => adcCFull(i),
         empty => adcCEmpty(i),
         valid => adcCValid(i)
      );
   end generate;  
   -- Are any of these fifos full?
   adcABCFull <= '1' when (adcAFull /= x"00" or adcBFull /= x"00" or adcCFull /= "00") else '0';
   -- Are all of them empty?
   adcABCEmpty <= '1' when (adcAEmpty = x"FF" and adcBEmpty = x"FF" and adcCEmpty = "11") else '0';
   
   --------------------------------------
   -- FIFO for event data
   --------------------------------------
   U_EvtDataFifo : fifo_generator_event_data
      PORT MAP (
         s_aclk        => sysClk,
         s_aresetn     => not(sysRst),
         s_axis_tvalid => r.evtDataValid,
         s_axis_tready => evtFifoReady,
         s_axis_tdata  => r.evtData,
         s_axis_tlast  => r.evtDataLast,
         m_axis_tvalid => evtDataValid,
         m_axis_tready => evtDataReady,
         m_axis_tdata  => evtData,
         m_axis_tlast  => evtDataLast
      );


   --------------------------------------
   -- Synchronization signal for ADC
   --------------------------------------
   process (sysClk)
      variable adcClkPipe : slv(1 downto 0) := (others => '0'); 
   begin
      if rising_edge(sysClk) then
         adcClkPipe := adcClkPipe(0) & adcClk;
      end if;
      if adcClkPipe = "10" then
         adcSync <= '1';
      else
         adcSync <= '0';
      end if;
   end process;

   --------------------------------------
   -- DRS4 startup
   --------------------------------------
   process (sysClk) 
      variable rstCounter   : slv(26 downto 0) := (others => '0');
      variable startCounter : slv(26 downto 0) := (others => '0');
   begin
      if rising_edge(sysClk) then
         drsResetN  <= rstCounter(26);
         drsDEnable <= startCounter(26);
         if sysRst = '1' then
            rstCounter   := (others => '0');
            startCounter := (others => '0'); 
         else
            if rstCounter(26) /= '1' then
               rstCounter   := rstCounter + 1;
               startCounter := (others => '0');
            elsif startCounter(26) /= '1' then
               startCounter := startCounter + 1;
            end if;
         end if;
      end if;
   end process;

   --------------------------------------
   -- Set up the clock out to the DRS4
   --------------------------------------
   drsHalfT  <= '0' & drsDivideRatio(7 downto 1);
   drsRefClk <= (others => iDrsRefClk);
   process (sysClk) 
      variable counter : slv(7 downto 0) := (others => '0');
   begin
      if rising_edge(sysClk) then
         if sysRst = '1' or doDrsSync = '1' then
            iDrsRefClk <= '0';
            counter    := (others => '0');
         else
            if counter < drsHalfT-1 then
               counter := counter + 1;
            else
               iDrsRefClk <= not(iDrsRefClk);
               counter    := (others => '0');
            end if;
         end if;
      end if;
   end process;

   --------------------------------------
   -- Monitor PLL lock states
   --------------------------------------
   drsLocked <= iDrsLocked;
   process (sysClk)
      variable lockA : slv(26 downto 0) := (others => '0');
      variable lockB : slv(26 downto 0) := (others => '0');
   begin
      if rising_edge(sysClk) then
         if sysRst = '1' then
            lockA      := (others => '0');
            lockB      := (others => '0');
            iDrsLocked <= (others => '0');
         else
            iDrsLocked(0) <= lockA(26);
            if drsPllLck(0) = '0' then
               lockA := (others => '0');
            elsif lockA(26) /= '1' then
               lockA := lockA + 1;               
            end if;

            iDrsLocked(1) <= lockB(26);
            if drsPllLck(1) = '0' then
               lockB := (others => '0');
            elsif lockB(26) /= '1' then
               lockB := lockB + 1;               
            end if;
         end if;
      end if;
   end process;

   --------------------------------------
   -- DRS4 address/serial interface 
   --------------------------------------
   U_DrsControl : entity work.DrsControl
   generic map (
      SR_CLOCK_HALF_PERIOD_G => 2
   )
   port map ( 
      -- System clock and reset
      sysClk        => sysClk,
      sysRst        => sysRst,
      -- User requests
      configReg     => drsConfigReg,
      loadConfigReq => drsConfigRegReq,
      loadConfigAck => drsConfigRegAck,
      writeReg      => drsWriteReg,
      loadWriteReq  => drsWriteRegReq,
      loadWriteAck  => drsWriteRegAck,
      wrConReg      => drsWrConReg,
      loadWrConReq  => drsWrConRegReq,
      loadWrConAck  => drsWrConRegAck,
      -- Perform the normal readout sequence
      readoutReq    => r.readoutReq,
      readoutAck    => readoutAck,
      nSamples      => drsNSamples,
      roiMode       => roiMode,
      stopSampleA   => stopSampleA,
      stopSampleB   => stopSampleB,
      sampleValid   => sampleValid,
      -- DRS4 address & serial interfacing
      drsAddr       => drsAddr,
      drsSrClk      => drsSrClk,
      drsSrIn       => drsSrIn,
      drsRsrLoad    => drsRsrLoad,
      drsSrOut      => drsSrOut,
      drsDWrite     => drsDWrite
   );

   -- We use ADCs with 16 samples of pipeline latency, so we delay the valid 
   -- signal from the DRS4 block here and use it 16 ADC-valid cycles later.
   process(sysClk) begin
      if rising_edge(sysClk) then
         if sysRst = '1' then
            sampleValidPipeA <= (others => '0');
            sampleValidPipeB <= (others => '0');
            sampleValidPipeC <= (others => '0');
         else
            if adcADataValid(0) = '1' then
               sampleValidPipeA <= sampleValidPipeA(30 downto 0) & sampleValid;
            end if;
            if adcBDataValid(0) = '1' then
               sampleValidPipeB <= sampleValidPipeB(30 downto 0) & sampleValid;
            end if;
            if adcCDataValid(0) = '1' then
               sampleValidPipeC <= sampleValidPipeC(30 downto 0) & sampleValid;
            end if;
         end if;
      end if;
   end process;
   
   sampleValidA <= sampleValidPipeA(conv_integer(pipeDelay));
   sampleValidB <= sampleValidPipeB(conv_integer(pipeDelay));
   sampleValidC <= sampleValidPipeC(conv_integer(pipeDelay));

   -- CRC calculation for the event data
   U_Crc32 : entity work.Crc32
      generic map (
         BYTE_WIDTH_G  => 4,
         CRC_INIT_G    => x"FFFFFFFF",
         GATE_DELAY_G  => GATE_DELAY_G
      ) port map (
         crcOut        => crcValue,
         crcClk        => sysClk,
         crcDataValid  => r.evtDataValid,
         crcDataWidth  => "011",
         -- Bytes are swapped here due to the implementation of CRC in the SL codebase
         -- No input reflection, no output reflection, no final XOR,
         crcIn         => r.evtData(7 downto 0) & r.evtData(15 downto 8) & r.evtData(23 downto 16) & r.evtData(31 downto 24),
         crcReset      => r.crcReset
      );                               

end Behavioral;
