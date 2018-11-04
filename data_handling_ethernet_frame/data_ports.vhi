
-- VHDL Instantiation Created from source file data_ports.vhd -- 19:00:32 10/18/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT data_ports
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		DATA_INPUT : IN std_logic_vector(63 downto 0);
		data_address : IN std_logic_vector(7 downto 0);
		phase_sel : IN std_logic_vector(1 downto 0);          
		data_addr_out : OUT std_logic_vector(7 downto 0);
		TRIGGER_OUTPUT : OUT std_logic_vector(63 downto 0);
		DATA_OUTPUT : OUT std_logic_vector(63 downto 0)
		);
	END COMPONENT;

	Inst_data_ports: data_ports PORT MAP(
		CLK => ,
		RST => ,
		DATA_INPUT => ,
		data_address => ,
		phase_sel => ,
		data_addr_out => ,
		TRIGGER_OUTPUT => ,
		DATA_OUTPUT => 
	);


