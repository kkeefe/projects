
-- VHDL Instantiation Created from source file microblaze_0_top.vhd -- 05:49:08 10/25/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT microblaze_0_top
	PORT(
		RESET : IN std_logic;
		CLK : IN std_logic;
		microblaze_0_S0_AXIS_TLAST_pin : IN std_logic;
		microblaze_0_S0_AXIS_TDATA_pin : IN std_logic_vector(31 downto 0);
		microblaze_0_S0_AXIS_TVALID_pin : IN std_logic;
		microblaze_0_M0_AXIS_TREADY_pin : IN std_logic;
		iomodule_0_IO_Read_Data_pin : IN std_logic_vector(31 downto 0);
		iomodule_0_IO_Ready_pin : IN std_logic;          
		microblaze_0_S0_AXIS_TREADY_pin : OUT std_logic;
		microblaze_0_M0_AXIS_TLAST_pin : OUT std_logic;
		microblaze_0_M0_AXIS_TDATA_pin : OUT std_logic_vector(31 downto 0);
		microblaze_0_M0_AXIS_TVALID_pin : OUT std_logic;
		clock_generator_0_CLKOUT0_pin : OUT std_logic;
		iomodule_0_IO_Addr_Strobe_pin : OUT std_logic;
		iomodule_0_IO_Read_Strobe_pin : OUT std_logic;
		iomodule_0_IO_Write_Strobe_pin : OUT std_logic;
		iomodule_0_IO_Address_pin : OUT std_logic_vector(31 downto 0);
		iomodule_0_IO_Byte_Enable_pin : OUT std_logic_vector(3 downto 0);
		iomodule_0_IO_Write_Data_pin : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_microblaze_0_top: microblaze_0_top PORT MAP(
		RESET => ,
		CLK => ,
		microblaze_0_S0_AXIS_TLAST_pin => ,
		microblaze_0_S0_AXIS_TDATA_pin => ,
		microblaze_0_S0_AXIS_TVALID_pin => ,
		microblaze_0_S0_AXIS_TREADY_pin => ,
		microblaze_0_M0_AXIS_TLAST_pin => ,
		microblaze_0_M0_AXIS_TDATA_pin => ,
		microblaze_0_M0_AXIS_TVALID_pin => ,
		microblaze_0_M0_AXIS_TREADY_pin => ,
		clock_generator_0_CLKOUT0_pin => ,
		iomodule_0_IO_Addr_Strobe_pin => ,
		iomodule_0_IO_Read_Strobe_pin => ,
		iomodule_0_IO_Write_Strobe_pin => ,
		iomodule_0_IO_Address_pin => ,
		iomodule_0_IO_Byte_Enable_pin => ,
		iomodule_0_IO_Write_Data_pin => ,
		iomodule_0_IO_Read_Data_pin => ,
		iomodule_0_IO_Ready_pin => 
	);


