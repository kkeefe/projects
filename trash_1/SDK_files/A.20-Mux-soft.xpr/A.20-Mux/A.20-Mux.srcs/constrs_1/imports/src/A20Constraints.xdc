# Pin placements
#set_property PACKAGE_PIN A8 [get_ports gtRxN]
#set_property PACKAGE_PIN B8 [get_ports gtRxP]
#set_property PACKAGE_PIN A4 [get_ports gtTxN]
#set_property PACKAGE_PIN B4 [get_ports gtTxP]
#Clock pins for SFP
#set_property PACKAGE_PIN F6 [get_ports gtClkP]
#set_property PACKAGE_PIN E6 [get_ports gtClkN]
# create_clock -period 6.400 -name gtrefclk -add [get_ports gtClkP]

# AC701 is a 125Mhz clock.  1/125Mhz = 8ns
create_clock -period 8.000 -name gtrefclk -add [get_ports gtClkP]

# Pin placements for the AC701
# IP Block works on the REFCLK1?
#set_property IOSTANDARD LVDS_25 [get_ports gtClkN]
set_property PACKAGE_PIN AA13 [get_ports gtClkP]
set_property PACKAGE_PIN AB13 [get_ports gtClkN]
#set_property IOSTANDARD LVDS_25 [get_ports glClkP]

set_property PACKAGE_PIN AD12 [get_ports gtRxN]
set_property PACKAGE_PIN AC12 [get_ports gtRxP]
set_property PACKAGE_PIN AD10 [get_ports gtTxN]
set_property PACKAGE_PIN AC10 [get_ports gtTxP]

#set_property IOSTANDARD LVDS_25 [get_ports gtRx*]
#set_property IOSTANDARD LVDS_25 [get_ports gtTx*]

# Consistent with AC701 spec Tbl 1-10, Note 2
set_property PACKAGE_PIN B26 [get_ports SFP_MGT_CLK_SEL0]
set_property PACKAGE_PIN C24 [get_ports SFP_MGT_CLK_SEL1]
set_property IOSTANDARD LVCMOS25 [get_ports SFP_MGT_CLK_SEL*]

# Wire in the UART for the +uBlaze design
set_property PACKAGE_PIN U19 [get_ports rs232_uart_txd]
set_property PACKAGE_PIN T19 [get_ports rs232_uart_rxd]
set_property IOSTANDARD LVCMOS18 [get_ports rs232_uart_*]

set_property MARK_DEBUG true [get_nets {U_RegControl/curReg_reg[regReq]__0}]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_5]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_0]
set_property MARK_DEBUG true [get_nets {U_RegControl/nxtReg[regReq]}]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_23]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_31]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_36]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_37]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_22]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_17]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_18]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_19]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_30]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_34]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_20]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_21]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_35]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_29]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_24]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_25]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_32]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_33]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_26]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_27]
set_property MARK_DEBUG true [get_nets U_RegControl/U_RegMap_n_28]
connect_debug_port u_ila_0/probe9 [get_nets [list {U_RegControl/curReg_reg[regReq]__0}]]
connect_debug_port u_ila_0/probe10 [get_nets [list {U_RegControl/nxtReg[regReq]}]]
connect_debug_port u_ila_0/probe11 [get_nets [list U_RegControl/U_RegMap_n_0]]
connect_debug_port u_ila_0/probe12 [get_nets [list U_RegControl/U_RegMap_n_5]]
connect_debug_port u_ila_0/probe13 [get_nets [list U_RegControl/U_RegMap_n_17]]
connect_debug_port u_ila_0/probe14 [get_nets [list U_RegControl/U_RegMap_n_18]]
connect_debug_port u_ila_0/probe15 [get_nets [list U_RegControl/U_RegMap_n_19]]
connect_debug_port u_ila_0/probe16 [get_nets [list U_RegControl/U_RegMap_n_20]]
connect_debug_port u_ila_0/probe17 [get_nets [list U_RegControl/U_RegMap_n_21]]
connect_debug_port u_ila_0/probe18 [get_nets [list U_RegControl/U_RegMap_n_22]]
connect_debug_port u_ila_0/probe19 [get_nets [list U_RegControl/U_RegMap_n_23]]
connect_debug_port u_ila_0/probe20 [get_nets [list U_RegControl/U_RegMap_n_24]]
connect_debug_port u_ila_0/probe21 [get_nets [list U_RegControl/U_RegMap_n_25]]
connect_debug_port u_ila_0/probe22 [get_nets [list U_RegControl/U_RegMap_n_26]]
connect_debug_port u_ila_0/probe23 [get_nets [list U_RegControl/U_RegMap_n_27]]
connect_debug_port u_ila_0/probe24 [get_nets [list U_RegControl/U_RegMap_n_28]]
connect_debug_port u_ila_0/probe25 [get_nets [list U_RegControl/U_RegMap_n_29]]
connect_debug_port u_ila_0/probe26 [get_nets [list U_RegControl/U_RegMap_n_30]]
connect_debug_port u_ila_0/probe27 [get_nets [list U_RegControl/U_RegMap_n_31]]
connect_debug_port u_ila_0/probe28 [get_nets [list U_RegControl/U_RegMap_n_32]]
connect_debug_port u_ila_0/probe29 [get_nets [list U_RegControl/U_RegMap_n_33]]
connect_debug_port u_ila_0/probe30 [get_nets [list U_RegControl/U_RegMap_n_34]]
connect_debug_port u_ila_0/probe31 [get_nets [list U_RegControl/U_RegMap_n_35]]
connect_debug_port u_ila_0/probe32 [get_nets [list U_RegControl/U_RegMap_n_36]]
connect_debug_port u_ila_0/probe33 [get_nets [list U_RegControl/U_RegMap_n_37]]

set_property MARK_DEBUG false [get_nets {U_RegControl/curReg_reg[regAddr_n_0_][0]}]
set_property MARK_DEBUG false [get_nets {U_RegControl/curReg_reg[regAddr_n_0_][1]}]
set_property MARK_DEBUG false [get_nets {U_RegControl/curReg_reg[regAddr_n_0_][2]}]
set_property MARK_DEBUG false [get_nets {U_RegControl/curReg_reg[regAddr_n_0_][3]}]
set_property MARK_DEBUG false [get_nets {U_RegControl/curReg_reg[regAddr_n_0_][4]}]
set_property MARK_DEBUG false [get_nets {U_RegControl/curReg_reg[regAddr_n_0_][5]}]
set_property MARK_DEBUG false [get_nets {U_RegControl/curReg_reg[regAddr_n_0_][6]}]
set_property MARK_DEBUG false [get_nets {U_RegControl/curReg_reg[regAddr_n_0_][7]}]
set_property MARK_DEBUG false [get_nets {U_RegControl/nxtReg[regRdData]0_in[2]}]
set_property MARK_DEBUG false [get_nets {U_RegControl/nxtReg[regRdData]0_in[3]}]
set_property MARK_DEBUG false [get_nets {U_RegControl/nxtReg[regRdData]0_in[6]}]
set_property MARK_DEBUG false [get_nets {U_RegControl/nxtReg[regRdData]0_in[8]}]
set_property MARK_DEBUG false [get_nets {U_RegControl/nxtReg[regRdData]0_in[11]}]
set_property MARK_DEBUG false [get_nets {U_RegControl/nxtReg[regRdData]0_in[14]}]
set_property MARK_DEBUG false [get_nets {U_RegControl/nxtReg[regRdData]0_in[22]}]
set_property MARK_DEBUG false [get_nets {U_RegControl/nxtReg[regRdData]0_in[16]}]
set_property MARK_DEBUG false [get_nets {U_RegControl/nxtReg[regRdData]0_in[25]}]
set_property MARK_DEBUG false [get_nets {U_RegControl/nxtReg[regRdData]0_in[26]}]
set_property MARK_DEBUG false [get_nets {U_RegControl/nxtReg[regRdData]0_in[30]}]
set_property MARK_DEBUG false [get_nets U_RegControl/nxtReg]
set_property MARK_DEBUG false [get_nets U_RegControl/curReg_reg]