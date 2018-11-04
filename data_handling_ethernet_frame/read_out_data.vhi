
-- VHDL Instantiation Created from source file read_out_data.vhd -- 18:05:30 10/19/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT read_out_data
	PORT(
		clk100 : IN std_logic;
		rst : IN std_logic;
		new_trigger : IN std_logic;
		data_read_in : IN std_logic_vector(63 downto 0);
		data_addr_write : IN std_logic_vector(7 downto 0);
		evtFifoReady : IN std_logic;          
		data_phase_out : OUT std_logic_vector(1 downto 0);
		data_read_out : OUT std_logic_vector(7 downto 0);
		eventCount : OUT std_logic_vector(31 downto 0);
		evtDataValid : OUT std_logic;
		evtData : OUT std_logic_vector(31 downto 0);
		evtDataLast : OUT std_logic;
		dataReady : OUT std_logic
		);
	END COMPONENT;

	Inst_read_out_data: read_out_data PORT MAP(
		clk100 => ,
		rst => ,
		new_trigger => ,
		data_read_in => ,
		data_addr_write => ,
		data_phase_out => ,
		data_read_out => ,
		eventCount => ,
		evtDataValid => ,
		evtData => ,
		evtDataLast => ,
		evtFifoReady => ,
		dataReady => 
	);


