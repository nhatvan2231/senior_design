set_property SRC_FILE_INFO {cfile:/home/nate/Desktop/senior_design/src/fpga_practice/custom_uart_tx/custom_uart_tx.srcs/constrs_1/imports/fpga_practice/Nexys4DDR_master.xdc rfile:../../../custom_uart_tx.srcs/constrs_1/imports/fpga_practice/Nexys4DDR_master.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }]; #IO_L12P_T1_MRCC_35 Sch=clk100mhz
set_property src_info {type:XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { rstn }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property src_info {type:XDC file:1 line:220 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D4    IOSTANDARD LVCMOS33 } [get_ports { tx_sig }]; #IO_L11N_T1_SRCC_35 Sch=uart_rxd_out
