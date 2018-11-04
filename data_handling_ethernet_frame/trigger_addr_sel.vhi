
-- VHDL Instantiation Created from source file trigger_addr_sel.vhd -- 18:13:34 10/19/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT trigger_addr_sel
	PORT(
		clk100 : IN std_logic;
		rst : IN std_logic;
		trigger_input : IN std_logic_vector(63 downto 0);
		addr_in : IN std_logic_vector(7 downto 0);          
		addr_out : OUT std_logic_vector(7 downto 0);
		new_hit : OUT std_logic
		);
	END COMPONENT;

	Inst_trigger_addr_sel: trigger_addr_sel PORT MAP(
		clk100 => ,
		rst => ,
		trigger_input => ,
		addr_in => ,
		addr_out => ,
		new_hit => 
	);


