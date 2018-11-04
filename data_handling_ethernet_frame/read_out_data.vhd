----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:16:49 10/17/2018 
-- Design Name: 
-- Module Name:    read_out_data - Behavioral 
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
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity read_out_data is
   generic (
      GATE_DELAY_G : time := 2 ns		
   );
	 Port ( 
			  clk100			   : in  STD_LOGIC;
           rst 			   : in  STD_LOGIC;
			  new_trigger     : in  STD_LOGIC;
           data_read_in    : in  STD_LOGIC_VECTOR(63 downto 0);
			  data_addr_hit   : in  STD_LOGIC_VECTOR(7 downto 0);
			  --data inputs to determine how many address to read before and after the trigger
			  data_addr_bef   : in  STD_LOGIC_VECTOR(3 downto 0);
			  data_addr_aft   : in  STD_LOGIC_VECTOR(3 downto 0);
			  --address and phase data to select what memory to read
           data_phase_out  : out STD_LOGIC_VECTOR(1 downto 0);
           data_read_out   : out STD_LOGIC_VECTOR(7 downto 0);		
			  --outputs to send to the FIFO
			  evtDataValid    : out std_logic;
			  evtData         : out std_logic_vector(31 downto 0);
			  evtDataLast     : out std_logic;
			  evtFifoReady    : in  std_logic;	
			  --evtData
			  dataReady       : out std_logic
			  );
end read_out_data;


architecture Behavioral of read_out_data is


type StateType     is (chillin, ETH_HEADER_S, IPV4_HEADER_S, HEADER, Phase_0, Phase_1, Phase_2, Phase_3, FOOTER, DONE);
   type Hit_Event is record
      state           : StateType;  
		evtNumber       : std_logic_vector(31 downto 0);
      evtData         : std_logic_vector(31 downto 0);
      evtAddrOut	    : std_logic_vector(7 downto 0);
		evtAddrStop     : std_logic_vector(7 downto 0);
		evtPhaseSel     : std_logic_vector(1 downto 0);		
		phase_change    : std_logic;
		half_phase      : std_logic;
		num_addr_bef    : std_logic_vector(3 downto 0);
		num_addr_aft    : std_logic_vector(3 downto 0);
		evtDataValid    : std_logic;
      evtDataLast     : std_logic;
      dataReady       : std_logic;
   end record Hit_Event;

   constant HIT_INIT_C : Hit_Event := (
      state          => chillin,
      evtNumber      => (others => '0'),
      evtData        => (others => '0'),
      evtAddrOut     => (others => '0'),
		evtAddrStop    => (others => '0'), 
		evtPhaseSel    => "00",
		phase_change   => '0',
		half_phase     => '0',
		num_addr_bef   => "0001", --signals are written to the state vector outsite of the case statement and can be updated whenever..
		num_addr_aft   => "0001", --default is to read one before and one after..
		evtDataValid   => '0',
      evtDataLast    => '0',
      dataReady      => '0'
   );    

   signal r   : Hit_Event := HIT_INIT_C;
   signal rin : Hit_Event;
   
	signal evtFifoReadys     : std_logic;
	
	signal evtCounts         : std_logic_vector(31 downto 0) := (others => '0');

	signal data_read_ins     : std_logic_vector(63 downto 0);
	signal data_phase_outs   : std_logic_vector(1 downto 0);
	signal data_read_outs    : std_logic_vector(7 downto 0);
	signal data_addr_hits    : std_logic_vector(7 downto 0);
	
	signal num_addr_befs     : std_logic_vector(3 downto 0);
	signal num_addr_afts     : std_logic_Vector(3 downto 0);

   attribute dont_touch : string;
   attribute dont_touch of evtFifoReady : signal is "true";
 
begin

--assign the top level ports to inputs:
--inputs
	data_read_ins   <= data_read_in;
--outputs
	data_read_outs  <= r.evtAddrOut;
	data_phase_outs <= r.evtPhaseSel; 
--assign the signals to ports
	data_read_out   <= data_read_outs;
	data_phase_out  <= data_phase_outs;
	data_addr_hits  <= data_addr_hit;
--input ports which determine the before and after address selection from the trigger event.
	num_addr_befs   <= data_addr_bef; 
	num_addr_afts   <= data_addr_aft;
 
--------------------component to connect data_read_out to Eth core--------------------------------------------------------

--parse through the data_phase_out chains 4 clock cycle minimum to read each of the values..
   comb : process( r, rst, new_trigger, data_read_ins, data_addr_hits, num_addr_befs, num_addr_afts, evtFifoReady, evtCounts
                   ) is
      variable v : Hit_Event;	
   begin
      v := r;
      -- Resets for pulsed outputs
      v.evtDataValid := '0';
      v.evtDataLast  := '0';         

		-- State machine 
      case(r.state) is 
         when chillin =>			
				v 				   := HIT_INIT_C;
				--v.evtNumber    := r.evtNumber;   --read these values every time to prevent them from being reset to zero or constant.
				v.num_addr_bef := num_addr_befs; 
				v.num_addr_aft := num_addr_afts;
				v.dataReady    := '1';
				
				--reset values which control process of state machine here..			
					if(new_trigger = '1')then --this is the output of the trigger condition! If triggered, go into header state
						v.state        := HEADER;
						v.evtAddrStop  := std_logic_vector((unsigned(data_addr_hits)+unsigned("0000"&r.num_addr_aft)));	--stopping address
						v.evtAddrOut   := std_logic_vector((unsigned(data_addr_hits)-unsigned("0000"&r.num_addr_bef)));	--address of the original hit
						v.phase_change := '0'; --make sure the state starts in the initial phase..	
					end if;

         when ETH_HEADER_S =>
					--begin ethernet sequence
					
					--preamble
					
					--SFD
					
					--MacDest
					
					--MacSouce
					
					--EthType
					
					
					
			when IPV4_HEADER_S =>
					
					--notes:
						--IHL (internet header length) -IHL is always 5 for us since we don't use any options
						--ECN explicit congestion notification
						--total length is the number of bytes in the entire packet.. (22) eth header, (20) ipv4 header, (12) base from data + 8*num of addresses read
					--begin ipv4 header sequence
					--total sequence is 5 32 bit clock cycles
					--1
					--version(4), IHL(4), DSCP(6), ECN(2) / Total Length(16)
					
							--s_version      := "0100";
							--s_IHL 			  := "0101";
							--s_DSCP 		  := "101110"; --(expedited forwarding)
							--s_ECN 			  := "00";
							--s_total_length := BCD(22+20+12+8*data_address_length);
									
					--2
					--identification(16) / flags(3), fragment offset(13)
					
						   --s_identification  := "(others => '0')" --used to identify fragment offsets..
						   --s_flags 			  := "000" --set no fragmentation. bit 0 must be 0, bit 1 is Don't fragment, bit 2 is more fragment.
							--s_fragment_offset := "0000000000000" --not useful for none fragmented packets? use an offset of zero for original fragments..
							
					--3
					--time to Live(8), protocol(8) / header checksum(16)
					
							--s_TTL      		  := "00000000"; --specifies lifetime of packet in seconds, values less than 1 are rounded to 1 second..
							--s_Protocol        := "0x61";     --Ethernet-within-IP Encapsulation
							--s_header_checksum := "0x????"			  --16 bit piece of information from the router..
					
					--4
					--source IP address (refer to reg control)
					
							--s_IP_addr_source := "0x???? ????"
					
					--5
					--destination IP address (refer to reg control)
				
							--s_IP_addr_dest := "0x???? ????"
			
			when HEADER =>			
				
				if(r.phase_change = '0') then				
					v.evtData        := x"DAA80085";
					v.evtDataValid   := '1';
					v.dataReady      := '0';
					v.phase_change   := '1';
					v.evtNumber      := evtCounts;						
					--check to see if the fifo is ready
				elsif(r.phase_change = '1' and evtFifoREady = '1') then
					v.evtData      := v.evtNumber;
					v.evtDataValid := '1';
					v.dataReady    := '0';
					v.phase_change := '0';
					v.state 			:= phase_0;
				end if;
		
			when Phase_0 =>

			--select the address for the beginning phase only since all of the phases have the same address
				v.evtPhaseSel    := "00";
			   v.evtDataValid   := '1';
			--phase cycle	
				if (r.half_phase = '0') then
					v.evtAddrOut     := std_logic_vector((unsigned(r.evtAddrOut) + to_unsigned(1,8)));  --proceed to the next addr
					v.evtData    := data_read_ins(63 downto 32);
					v.half_phase := '1';
				else
					v.evtData      := data_read_ins(31 downto 0);
					v.half_phase   := '0';
					v.phase_change := '1';
				end if;

				if(r.phase_change = '1') then
					v.state 		   := Phase_1;
					v.phase_change := '0';
				else
					v.phase_Change := '1';
				end if;

         when Phase_1 =>			
				v.evtPhaseSel    := "01";
			   v.evtDataValid   := '1';
			--phase cycle
				if (r.half_phase = '0') then
					v.evtData    := data_read_ins(63 downto 32);
					v.half_phase := '1';
				else
					v.evtData := data_read_ins(31 downto 0);
					v.half_phase   := '0';
					v.phase_change := '1';
				end if;
				
				if(r.phase_change = '1') then
					v.state	      := Phase_2;
					v.phase_change := '0';
				else
					v.phase_Change := '1';			
				end if;

         when Phase_2 =>			
				v.evtPhaseSel 	  := "10";
			   v.evtDataValid   := '1';
			--phase cycle
				if (r.half_phase = '0') then
					v.evtData    := data_read_ins(63 downto 32);
					v.half_phase := '1';
				else
					v.evtData      := data_read_ins(31 downto 0);
					v.half_phase   := '0';
					v.phase_change := '1';
				end if;

				if(r.phase_change = '1') then
					v.state        := Phase_3;
					v.phase_change := '0';
				else
					v.phase_Change := '1';
				end if;

         when Phase_3 =>
				v.evtPhaseSel    := "11";
			   v.evtDataValid   := '1';				
			--phase cycle
				if (r.half_phase = '0') then
					v.evtData    := data_read_ins(63 downto 32);
					v.half_phase := '1';
				else
					v.evtData    := data_read_ins(31 downto 0);
					v.half_phase := '0';
				end if;
			  
				if(r.phase_change = '1') then
					if (r.evtAddrOut = r.evtAddrStop) then
						v.state 		     := FOOTER;	    				   												--have read from all of the assigned addresses.. go to footer!
					else
						v.state 			  := phase_0;   					                                       --go back and begin reading from the new address
						--v.evtAddrOut     := std_logic_vector((unsigned(r.evtAddrOut) + to_unsigned(1,8)));  --proceed to the next addr
						v.half_phase     := '0';
						v.phase_change   := '0';
					end if;
				else
					v.phase_change := '1';
				end if;

         when FOOTER =>	
				v.evtData        := x"EDEDEDED";
			   v.evtDataValid   := '1';
            v.evtDataLast    := '1';
				v.phase_change   := '0';
				v.half_phase     := '0';
            v.state          := DONE;

         when DONE =>		
				v           	  := HIT_INIT_C;
				v.state     	  := chillin;
				v.DataReady 	  := '1';
	
         when others =>
            v.state := chillin;
      end case;

      -- Reset logic
      if (rst = '1') then
         v := HIT_INIT_C;
      end if;

      -- Outputs to ports
      dataReady    <= r.dataReady;
		evtDataValid <= r.evtDataValid;
		evtData      <= r.evtData;
		evtDataLast  <= r.evtDataLast;
		
      -- Assignment of combinatorial variable to signal
      rin <= v;

   end process;

   seq : process (clk100) is
   begin
      if (rising_edge(clk100)) then
         r <= rin after GATE_DELAY_G;
      end if;
   end process seq;


	evtCountToSet : process(clk100) is	
	begin
		if (rising_edge(clk100)) then
			if (new_trigger = '1') then
				evtCounts <= std_logic_vector(unsigned(evtCounts)+1);
			end if;
		end if;
	end process evtCountToSet;


end Behavioral;

