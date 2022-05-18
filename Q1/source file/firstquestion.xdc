## Clock signal
set_property -dict { PACKAGE_PIN E3     IOSTANDARD LVCMOS33 } [get_ports { clk_in }];

##Switches
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { count_out[0] }]; #LSB input - RIGHT MOST SWITCH, 15
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { count_out[0] }]; #MSB input

set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { F }]; #F input 
