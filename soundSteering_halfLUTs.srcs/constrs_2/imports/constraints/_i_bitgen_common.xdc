





create_clock -period 25.000 -name clk_serial_40meg [get_nets msys_i/clk_wiz_0/inst/clk_out2_msys_clk_wiz_0_0]
create_generated_clock -name {msys_i/serial_adc_pwm_top_0/U0/fsm/CURRENT_STATE[0]} -source [get_pins msys_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0] -divide_by 1 [get_pins {msys_i/serial_adc_pwm_top_0/U0/fsm/FSM_sequential_CURRENT_STATE_reg[0]/Q}]
create_generated_clock -name {msys_i/serial_adc_pwm_top_0/U0/fsm/CURRENT_STATE[1]} -source [get_pins msys_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0] -divide_by 1 [get_pins {msys_i/serial_adc_pwm_top_0/U0/fsm/FSM_sequential_CURRENT_STATE_reg[1]/Q}]
create_generated_clock -name {msys_i/serial_adc_pwm_top_0/U0/fsm/CURRENT_STATE[2]} -source [get_pins msys_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0] -divide_by 1 [get_pins {msys_i/serial_adc_pwm_top_0/U0/fsm/FSM_sequential_CURRENT_STATE_reg[2]/Q}]
create_generated_clock -name {msys_i/serial_adc_pwm_top_0/U0/fsm/CURRENT_STATE[3]} -source [get_pins msys_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0] -divide_by 1 [get_pins {msys_i/serial_adc_pwm_top_0/U0/fsm/FSM_sequential_CURRENT_STATE_reg[3]/Q}]
create_clock -period 10.000 -name clk_main_100meg [get_nets msys_i/clk_wiz_0/inst/clk_out1_msys_clk_wiz_0_0]
