--------------------------------------------------------------------------------
--    This file is owned and controlled by Xilinx and must be used solely     --
--    for design, simulation, implementation and creation of design files     --
--    limited to Xilinx devices or technologies. Use with non-Xilinx          --
--    devices or technologies is expressly prohibited and immediately         --
--    terminates your license.                                                --
--                                                                            --
--    XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY    --
--    FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY    --
--    PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE             --
--    IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS      --
--    MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY      --
--    CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY       --
--    RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY       --
--    DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE   --
--    IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR          --
--    REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF         --
--    INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A   --
--    PARTICULAR PURPOSE.                                                     --
--                                                                            --
--    Xilinx products are not intended for use in life support appliances,    --
--    devices, or systems.  Use in such applications are expressly            --
--    prohibited.                                                             --
--                                                                            --
--    (c) Copyright 1995-2018 Xilinx, Inc.                                    --
--    All rights reserved.                                                    --
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--    Generated from core with identifier:                                    --
--    xilinx.com:ip:axis_interconnect:1.1                                     --
--                                                                            --
--    The AXI4-Stream Interconnect IP provides the infrastructure to          --
--    connect multiple AXI4-Stream masters and slaves.  The configurable      --
--    interconnect features a 16x16 switch, data FIFOs, register slices,      --
--    data width converters and clock rate converters.                        --
--------------------------------------------------------------------------------

-- Interfaces:
--    S00_AXIS
--    S01_AXIS
--    S02_AXIS
--    S03_AXIS
--    S04_AXIS
--    S05_AXIS
--    S06_AXIS
--    S07_AXIS
--    S08_AXIS
--    S09_AXIS
--    S10_AXIS
--    S11_AXIS
--    S12_AXIS
--    S13_AXIS
--    S14_AXIS
--    S15_AXIS
--    M00_AXIS
--    M01_AXIS
--    M02_AXIS
--    M03_AXIS
--    M04_AXIS
--    M05_AXIS
--    M06_AXIS
--    M07_AXIS
--    M08_AXIS
--    M09_AXIS
--    M10_AXIS
--    M11_AXIS
--    M12_AXIS
--    M13_AXIS
--    M14_AXIS
--    M15_AXIS
--    RSTIF
--    CLKIF
--    CLKENIF
--    S00_RSTIF
--    S00_CLKIF
--    S00_CLKENIF
--    M00_RSTIF
--    M00_CLKIF
--    M00_CLKENIF
--    S01_RSTIF
--    S01_CLKIF
--    S01_CLKENIF
--    M01_RSTIF
--    M01_CLKIF
--    M01_CLKENIF
--    S02_RSTIF
--    S02_CLKIF
--    S02_CLKENIF
--    M02_RSTIF
--    M02_CLKIF
--    M02_CLKENIF
--    S03_RSTIF
--    S03_CLKIF
--    S03_CLKENIF
--    M03_RSTIF
--    M03_CLKIF
--    M03_CLKENIF
--    S04_RSTIF
--    S04_CLKIF
--    S04_CLKENIF
--    M04_RSTIF
--    M04_CLKIF
--    M04_CLKENIF
--    S05_RSTIF
--    S05_CLKIF
--    S05_CLKENIF
--    M05_RSTIF
--    M05_CLKIF
--    M05_CLKENIF
--    S06_RSTIF
--    S06_CLKIF
--    S06_CLKENIF
--    M06_RSTIF
--    M06_CLKIF
--    M06_CLKENIF
--    S07_RSTIF
--    S07_CLKIF
--    S07_CLKENIF
--    M07_RSTIF
--    M07_CLKIF
--    M07_CLKENIF
--    S08_RSTIF
--    S08_CLKIF
--    S08_CLKENIF
--    M08_RSTIF
--    M08_CLKIF
--    M08_CLKENIF
--    S09_RSTIF
--    S09_CLKIF
--    S09_CLKENIF
--    M09_RSTIF
--    M09_CLKIF
--    M09_CLKENIF
--    S10_RSTIF
--    S10_CLKIF
--    S10_CLKENIF
--    M10_RSTIF
--    M10_CLKIF
--    M10_CLKENIF
--    S11_RSTIF
--    S11_CLKIF
--    S11_CLKENIF
--    M11_RSTIF
--    M11_CLKIF
--    M11_CLKENIF
--    S12_RSTIF
--    S12_CLKIF
--    S12_CLKENIF
--    M12_RSTIF
--    M12_CLKIF
--    M12_CLKENIF
--    S13_RSTIF
--    S13_CLKIF
--    S13_CLKENIF
--    M13_RSTIF
--    M13_CLKIF
--    M13_CLKENIF
--    S14_RSTIF
--    S14_CLKIF
--    S14_CLKENIF
--    M14_RSTIF
--    M14_CLKIF
--    M14_CLKENIF
--    S15_RSTIF
--    S15_CLKIF
--    S15_CLKENIF
--    M15_RSTIF
--    M15_CLKIF
--    M15_CLKENIF

-- The following code must appear in the VHDL architecture header:

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT AXIS_fifo_0
  PORT (
    ACLK : IN STD_LOGIC;
    ARESETN : IN STD_LOGIC;
    S00_AXIS_ACLK : IN STD_LOGIC;
    S00_AXIS_ARESETN : IN STD_LOGIC;
    S00_AXIS_TVALID : IN STD_LOGIC;
    S00_AXIS_TREADY : OUT STD_LOGIC;
    S00_AXIS_TDATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    S00_AXIS_TLAST : IN STD_LOGIC;
    M00_AXIS_ACLK : IN STD_LOGIC;
    M00_AXIS_ARESETN : IN STD_LOGIC;
    M00_AXIS_TVALID : OUT STD_LOGIC;
    M00_AXIS_TREADY : IN STD_LOGIC;
    M00_AXIS_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    M00_AXIS_TLAST : OUT STD_LOGIC;
    S00_FIFO_DATA_COUNT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    M00_FIFO_DATA_COUNT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : AXIS_fifo_0
  PORT MAP (
    ACLK => ACLK,
    ARESETN => ARESETN,
    S00_AXIS_ACLK => S00_AXIS_ACLK,
    S00_AXIS_ARESETN => S00_AXIS_ARESETN,
    S00_AXIS_TVALID => S00_AXIS_TVALID,
    S00_AXIS_TREADY => S00_AXIS_TREADY,
    S00_AXIS_TDATA => S00_AXIS_TDATA,
    S00_AXIS_TLAST => S00_AXIS_TLAST,
    M00_AXIS_ACLK => M00_AXIS_ACLK,
    M00_AXIS_ARESETN => M00_AXIS_ARESETN,
    M00_AXIS_TVALID => M00_AXIS_TVALID,
    M00_AXIS_TREADY => M00_AXIS_TREADY,
    M00_AXIS_TDATA => M00_AXIS_TDATA,
    M00_AXIS_TLAST => M00_AXIS_TLAST,
    S00_FIFO_DATA_COUNT => S00_FIFO_DATA_COUNT,
    M00_FIFO_DATA_COUNT => M00_FIFO_DATA_COUNT
  );
-- INST_TAG_END ------ End INSTANTIATION Template ------------

-- You must compile the wrapper file AXIS_fifo_0.vhd when simulating
-- the core, AXIS_fifo_0. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

