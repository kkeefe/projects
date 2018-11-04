
-- VHDL Instantiation Created from source file RegControl.vhd -- 05:57:40 10/25/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT RegControl
	PORT(
		clk : IN std_logic;
		sRst : IN std_logic;
		regAddr : IN std_logic_vector(31 downto 0);
		regAddrStrb : IN std_logic;
		regWrStrb : IN std_logic;
		regRdStrb : IN std_logic;
		regWrData : IN std_logic_vector(31 downto 0);
		regDataByteEn : IN std_logic_vector(3 downto 0);          
		regReady : OUT std_logic;
		regRdData : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_RegControl: RegControl PORT MAP(
		clk => ,
		sRst => ,
		regAddr => ,
		regAddrStrb => ,
		regWrStrb => ,
		regRdStrb => ,
		regReady => ,
		regWrData => ,
		regRdData => ,
		regDataByteEn => 
	);


