set_property PACKAGE_PIN A4 [get_ports heartbeat_led]
set_property PACKAGE_PIN D5 [get_ports ext_rst_esp]
set_property PACKAGE_PIN T4 [get_ports pwm_fan]
set_property PACKAGE_PIN P5 [get_ports pwm_buff_en]
set_property IOSTANDARD LVCMOS33 [get_ports pwm_fan]
set_property IOSTANDARD LVCMOS33 [get_ports pwm_buff_en]
set_property IOSTANDARD LVCMOS33 [get_ports ext_rst_esp]
set_property IOSTANDARD LVCMOS33 [get_ports heartbeat_led]

set_property PACKAGE_PIN B3 [get_ports esp32_miso]

set_property PACKAGE_PIN U1 [get_ports {extra_io[0]}]
set_property PACKAGE_PIN U2 [get_ports {extra_io[1]}]
set_property PACKAGE_PIN U3 [get_ports {extra_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {extra_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {extra_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {extra_io[0]}]


