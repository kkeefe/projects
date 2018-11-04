
-- VHDL Instantiation Created from source file data_handling_module.vhd -- 03:38:06 10/16/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT data_handling_module
	PORT(
		clock100 : IN std_logic;
		clock400 : IN std_logic;
		reset : IN std_logic;
		data_in : IN std_logic;
		data_addr : IN std_logic_vector(7 downto 0);          
		new_hit : OUT std_logic;
		data_out : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_data_handling_module: data_handling_module PORT MAP(
		clock100 => ,
		clock400 => ,
		reset => ,
		data_in => ,
		data_addr => ,
		new_hit => ,
		data_out => 
	);


