transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/lib_pkg_v1_0_3
vlib riviera/lib_cdc_v1_0_2
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/interrupt_control_v3_1_5
vlib riviera/axi_iic_v2_1_5
vlib riviera/xil_defaultlib
vlib riviera/dist_mem_gen_v8_0_14
vlib riviera/lib_srl_fifo_v1_0_3
vlib riviera/fifo_generator_v13_2_9
vlib riviera/lib_fifo_v1_0_18
vlib riviera/axi_quad_spi_v3_2_28
vlib riviera/axi_timer_v2_0_31
vlib riviera/axi_uartlite_v2_0_33
vlib riviera/mdm_v3_2_25
vlib riviera/microblaze_v11_0_12
vlib riviera/axi_intc_v4_1_18
vlib riviera/generic_baseblocks_v2_1_1
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_register_slice_v2_1_29
vlib riviera/axi_data_fifo_v2_1_28
vlib riviera/axi_crossbar_v2_1_30
vlib riviera/lmb_bram_if_cntlr_v4_0_23
vlib riviera/lmb_v10_v3_0_13
vlib riviera/blk_mem_gen_v8_4_7
vlib riviera/xlconcat_v2_1_5
vlib riviera/proc_sys_reset_v5_0_14
vlib riviera/i2s_receiver_v1_0_7

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap lib_pkg_v1_0_3 riviera/lib_pkg_v1_0_3
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_5 riviera/interrupt_control_v3_1_5
vmap axi_iic_v2_1_5 riviera/axi_iic_v2_1_5
vmap xil_defaultlib riviera/xil_defaultlib
vmap dist_mem_gen_v8_0_14 riviera/dist_mem_gen_v8_0_14
vmap lib_srl_fifo_v1_0_3 riviera/lib_srl_fifo_v1_0_3
vmap fifo_generator_v13_2_9 riviera/fifo_generator_v13_2_9
vmap lib_fifo_v1_0_18 riviera/lib_fifo_v1_0_18
vmap axi_quad_spi_v3_2_28 riviera/axi_quad_spi_v3_2_28
vmap axi_timer_v2_0_31 riviera/axi_timer_v2_0_31
vmap axi_uartlite_v2_0_33 riviera/axi_uartlite_v2_0_33
vmap mdm_v3_2_25 riviera/mdm_v3_2_25
vmap microblaze_v11_0_12 riviera/microblaze_v11_0_12
vmap axi_intc_v4_1_18 riviera/axi_intc_v4_1_18
vmap generic_baseblocks_v2_1_1 riviera/generic_baseblocks_v2_1_1
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_29 riviera/axi_register_slice_v2_1_29
vmap axi_data_fifo_v2_1_28 riviera/axi_data_fifo_v2_1_28
vmap axi_crossbar_v2_1_30 riviera/axi_crossbar_v2_1_30
vmap lmb_bram_if_cntlr_v4_0_23 riviera/lmb_bram_if_cntlr_v4_0_23
vmap lmb_v10_v3_0_13 riviera/lmb_v10_v3_0_13
vmap blk_mem_gen_v8_4_7 riviera/blk_mem_gen_v8_4_7
vmap xlconcat_v2_1_5 riviera/xlconcat_v2_1_5
vmap proc_sys_reset_v5_0_14 riviera/proc_sys_reset_v5_0_14
vmap i2s_receiver_v1_0_7 riviera/i2s_receiver_v1_0_7

vlog -work xilinx_vip  -incr "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l lib_pkg_v1_0_3 -l lib_cdc_v1_0_2 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_iic_v2_1_5 -l xil_defaultlib -l dist_mem_gen_v8_0_14 -l lib_srl_fifo_v1_0_3 -l fifo_generator_v13_2_9 -l lib_fifo_v1_0_18 -l axi_quad_spi_v3_2_28 -l axi_timer_v2_0_31 -l axi_uartlite_v2_0_33 -l mdm_v3_2_25 -l microblaze_v11_0_12 -l axi_intc_v4_1_18 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 -l lmb_bram_if_cntlr_v4_0_23 -l lmb_v10_v3_0_13 -l blk_mem_gen_v8_4_7 -l xlconcat_v2_1_5 -l proc_sys_reset_v5_0_14 -l i2s_receiver_v1_0_7 \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/c2c6" "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l lib_pkg_v1_0_3 -l lib_cdc_v1_0_2 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_iic_v2_1_5 -l xil_defaultlib -l dist_mem_gen_v8_0_14 -l lib_srl_fifo_v1_0_3 -l fifo_generator_v13_2_9 -l lib_fifo_v1_0_18 -l axi_quad_spi_v3_2_28 -l axi_timer_v2_0_31 -l axi_uartlite_v2_0_33 -l mdm_v3_2_25 -l microblaze_v11_0_12 -l axi_intc_v4_1_18 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 -l lmb_bram_if_cntlr_v4_0_23 -l lmb_v10_v3_0_13 -l blk_mem_gen_v8_4_7 -l xlconcat_v2_1_5 -l proc_sys_reset_v5_0_14 -l i2s_receiver_v1_0_7 \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work lib_pkg_v1_0_3 -93  -incr \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/56d9/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93  -incr \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93  -incr \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_5 -93  -incr \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_iic_v2_1_5 -93  -incr \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/0f29/hdl/axi_iic_v2_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/msys/ip/msys_axi_iic_0_0_4/sim/msys_axi_iic_0_0.vhd" \

vlog -work dist_mem_gen_v8_0_14  -incr -v2k5 "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/c2c6" "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l lib_pkg_v1_0_3 -l lib_cdc_v1_0_2 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_iic_v2_1_5 -l xil_defaultlib -l dist_mem_gen_v8_0_14 -l lib_srl_fifo_v1_0_3 -l fifo_generator_v13_2_9 -l lib_fifo_v1_0_18 -l axi_quad_spi_v3_2_28 -l axi_timer_v2_0_31 -l axi_uartlite_v2_0_33 -l mdm_v3_2_25 -l microblaze_v11_0_12 -l axi_intc_v4_1_18 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 -l lmb_bram_if_cntlr_v4_0_23 -l lmb_v10_v3_0_13 -l blk_mem_gen_v8_4_7 -l xlconcat_v2_1_5 -l proc_sys_reset_v5_0_14 -l i2s_receiver_v1_0_7 \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/2ec6/simulation/dist_mem_gen_v8_0.v" \

vcom -work lib_srl_fifo_v1_0_3 -93  -incr \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/02c4/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_9  -incr -v2k5 "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/c2c6" "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l lib_pkg_v1_0_3 -l lib_cdc_v1_0_2 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_iic_v2_1_5 -l xil_defaultlib -l dist_mem_gen_v8_0_14 -l lib_srl_fifo_v1_0_3 -l fifo_generator_v13_2_9 -l lib_fifo_v1_0_18 -l axi_quad_spi_v3_2_28 -l axi_timer_v2_0_31 -l axi_uartlite_v2_0_33 -l mdm_v3_2_25 -l microblaze_v11_0_12 -l axi_intc_v4_1_18 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 -l lmb_bram_if_cntlr_v4_0_23 -l lmb_v10_v3_0_13 -l blk_mem_gen_v8_4_7 -l xlconcat_v2_1_5 -l proc_sys_reset_v5_0_14 -l i2s_receiver_v1_0_7 \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ac72/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_9 -93  -incr \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ac72/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_9  -incr -v2k5 "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/c2c6" "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l lib_pkg_v1_0_3 -l lib_cdc_v1_0_2 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_iic_v2_1_5 -l xil_defaultlib -l dist_mem_gen_v8_0_14 -l lib_srl_fifo_v1_0_3 -l fifo_generator_v13_2_9 -l lib_fifo_v1_0_18 -l axi_quad_spi_v3_2_28 -l axi_timer_v2_0_31 -l axi_uartlite_v2_0_33 -l mdm_v3_2_25 -l microblaze_v11_0_12 -l axi_intc_v4_1_18 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 -l lmb_bram_if_cntlr_v4_0_23 -l lmb_v10_v3_0_13 -l blk_mem_gen_v8_4_7 -l xlconcat_v2_1_5 -l proc_sys_reset_v5_0_14 -l i2s_receiver_v1_0_7 \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ac72/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_18 -93  -incr \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/1531/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work axi_quad_spi_v3_2_28 -93  -incr \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/98d8/hdl/axi_quad_spi_v3_2_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/msys/ip/msys_axi_quad_spi_0_0_4/sim/msys_axi_quad_spi_0_0.vhd" \

vcom -work axi_timer_v2_0_31 -93  -incr \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/7ebb/hdl/axi_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/msys/ip/msys_axi_timer_0_0_4/sim/msys_axi_timer_0_0.vhd" \

vcom -work axi_uartlite_v2_0_33 -93  -incr \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/df48/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/msys/ip/msys_axi_uartlite_0_0_4/sim/msys_axi_uartlite_0_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/c2c6" "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l lib_pkg_v1_0_3 -l lib_cdc_v1_0_2 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_iic_v2_1_5 -l xil_defaultlib -l dist_mem_gen_v8_0_14 -l lib_srl_fifo_v1_0_3 -l fifo_generator_v13_2_9 -l lib_fifo_v1_0_18 -l axi_quad_spi_v3_2_28 -l axi_timer_v2_0_31 -l axi_uartlite_v2_0_33 -l mdm_v3_2_25 -l microblaze_v11_0_12 -l axi_intc_v4_1_18 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 -l lmb_bram_if_cntlr_v4_0_23 -l lmb_v10_v3_0_13 -l blk_mem_gen_v8_4_7 -l xlconcat_v2_1_5 -l proc_sys_reset_v5_0_14 -l i2s_receiver_v1_0_7 \
"../../../bd/msys/ip/msys_clk_wiz_0_0_4/msys_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/msys/ip/msys_clk_wiz_0_0_4/msys_clk_wiz_0_0.v" \

vcom -work mdm_v3_2_25 -93  -incr \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/347d/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/msys/ip/msys_mdm_1_0_4/sim/msys_mdm_1_0.vhd" \

vcom -work microblaze_v11_0_12 -93  -incr \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/f557/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/msys/ip/msys_microblaze_0_0_4/sim/msys_microblaze_0_0.vhd" \

vcom -work axi_intc_v4_1_18 -93  -incr \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/d764/hdl/axi_intc_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/msys/ip/msys_microblaze_0_axi_intc_0_4/sim/msys_microblaze_0_axi_intc_0.vhd" \

vlog -work generic_baseblocks_v2_1_1  -incr -v2k5 "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/c2c6" "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l lib_pkg_v1_0_3 -l lib_cdc_v1_0_2 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_iic_v2_1_5 -l xil_defaultlib -l dist_mem_gen_v8_0_14 -l lib_srl_fifo_v1_0_3 -l fifo_generator_v13_2_9 -l lib_fifo_v1_0_18 -l axi_quad_spi_v3_2_28 -l axi_timer_v2_0_31 -l axi_uartlite_v2_0_33 -l mdm_v3_2_25 -l microblaze_v11_0_12 -l axi_intc_v4_1_18 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 -l lmb_bram_if_cntlr_v4_0_23 -l lmb_v10_v3_0_13 -l blk_mem_gen_v8_4_7 -l xlconcat_v2_1_5 -l proc_sys_reset_v5_0_14 -l i2s_receiver_v1_0_7 \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/10ab/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -incr -v2k5 "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/c2c6" "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l lib_pkg_v1_0_3 -l lib_cdc_v1_0_2 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_iic_v2_1_5 -l xil_defaultlib -l dist_mem_gen_v8_0_14 -l lib_srl_fifo_v1_0_3 -l fifo_generator_v13_2_9 -l lib_fifo_v1_0_18 -l axi_quad_spi_v3_2_28 -l axi_timer_v2_0_31 -l axi_uartlite_v2_0_33 -l mdm_v3_2_25 -l microblaze_v11_0_12 -l axi_intc_v4_1_18 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 -l lmb_bram_if_cntlr_v4_0_23 -l lmb_v10_v3_0_13 -l blk_mem_gen_v8_4_7 -l xlconcat_v2_1_5 -l proc_sys_reset_v5_0_14 -l i2s_receiver_v1_0_7 \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_29  -incr -v2k5 "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/c2c6" "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l lib_pkg_v1_0_3 -l lib_cdc_v1_0_2 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_iic_v2_1_5 -l xil_defaultlib -l dist_mem_gen_v8_0_14 -l lib_srl_fifo_v1_0_3 -l fifo_generator_v13_2_9 -l lib_fifo_v1_0_18 -l axi_quad_spi_v3_2_28 -l axi_timer_v2_0_31 -l axi_uartlite_v2_0_33 -l mdm_v3_2_25 -l microblaze_v11_0_12 -l axi_intc_v4_1_18 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 -l lmb_bram_if_cntlr_v4_0_23 -l lmb_v10_v3_0_13 -l blk_mem_gen_v8_4_7 -l xlconcat_v2_1_5 -l proc_sys_reset_v5_0_14 -l i2s_receiver_v1_0_7 \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ff9f/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_28  -incr -v2k5 "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/c2c6" "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l lib_pkg_v1_0_3 -l lib_cdc_v1_0_2 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_iic_v2_1_5 -l xil_defaultlib -l dist_mem_gen_v8_0_14 -l lib_srl_fifo_v1_0_3 -l fifo_generator_v13_2_9 -l lib_fifo_v1_0_18 -l axi_quad_spi_v3_2_28 -l axi_timer_v2_0_31 -l axi_uartlite_v2_0_33 -l mdm_v3_2_25 -l microblaze_v11_0_12 -l axi_intc_v4_1_18 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 -l lmb_bram_if_cntlr_v4_0_23 -l lmb_v10_v3_0_13 -l blk_mem_gen_v8_4_7 -l xlconcat_v2_1_5 -l proc_sys_reset_v5_0_14 -l i2s_receiver_v1_0_7 \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/279e/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_30  -incr -v2k5 "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/c2c6" "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l lib_pkg_v1_0_3 -l lib_cdc_v1_0_2 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_iic_v2_1_5 -l xil_defaultlib -l dist_mem_gen_v8_0_14 -l lib_srl_fifo_v1_0_3 -l fifo_generator_v13_2_9 -l lib_fifo_v1_0_18 -l axi_quad_spi_v3_2_28 -l axi_timer_v2_0_31 -l axi_uartlite_v2_0_33 -l mdm_v3_2_25 -l microblaze_v11_0_12 -l axi_intc_v4_1_18 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 -l lmb_bram_if_cntlr_v4_0_23 -l lmb_v10_v3_0_13 -l blk_mem_gen_v8_4_7 -l xlconcat_v2_1_5 -l proc_sys_reset_v5_0_14 -l i2s_receiver_v1_0_7 \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/fb47/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/c2c6" "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l lib_pkg_v1_0_3 -l lib_cdc_v1_0_2 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_iic_v2_1_5 -l xil_defaultlib -l dist_mem_gen_v8_0_14 -l lib_srl_fifo_v1_0_3 -l fifo_generator_v13_2_9 -l lib_fifo_v1_0_18 -l axi_quad_spi_v3_2_28 -l axi_timer_v2_0_31 -l axi_uartlite_v2_0_33 -l mdm_v3_2_25 -l microblaze_v11_0_12 -l axi_intc_v4_1_18 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 -l lmb_bram_if_cntlr_v4_0_23 -l lmb_v10_v3_0_13 -l blk_mem_gen_v8_4_7 -l xlconcat_v2_1_5 -l proc_sys_reset_v5_0_14 -l i2s_receiver_v1_0_7 \
"../../../bd/msys/ip/msys_xbar_0_4/sim/msys_xbar_0.v" \

vcom -work lmb_bram_if_cntlr_v4_0_23 -93  -incr \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/1ca4/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/msys/ip/msys_dlmb_bram_if_cntlr_0_4/sim/msys_dlmb_bram_if_cntlr_0.vhd" \

vcom -work lmb_v10_v3_0_13 -93  -incr \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ae24/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/msys/ip/msys_dlmb_v10_0_4/sim/msys_dlmb_v10_0.vhd" \
"../../../bd/msys/ip/msys_ilmb_bram_if_cntlr_0_4/sim/msys_ilmb_bram_if_cntlr_0.vhd" \
"../../../bd/msys/ip/msys_ilmb_v10_0_4/sim/msys_ilmb_v10_0.vhd" \

vlog -work blk_mem_gen_v8_4_7  -incr -v2k5 "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/c2c6" "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l lib_pkg_v1_0_3 -l lib_cdc_v1_0_2 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_iic_v2_1_5 -l xil_defaultlib -l dist_mem_gen_v8_0_14 -l lib_srl_fifo_v1_0_3 -l fifo_generator_v13_2_9 -l lib_fifo_v1_0_18 -l axi_quad_spi_v3_2_28 -l axi_timer_v2_0_31 -l axi_uartlite_v2_0_33 -l mdm_v3_2_25 -l microblaze_v11_0_12 -l axi_intc_v4_1_18 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 -l lmb_bram_if_cntlr_v4_0_23 -l lmb_v10_v3_0_13 -l blk_mem_gen_v8_4_7 -l xlconcat_v2_1_5 -l proc_sys_reset_v5_0_14 -l i2s_receiver_v1_0_7 \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/3c0c/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/c2c6" "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l lib_pkg_v1_0_3 -l lib_cdc_v1_0_2 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_iic_v2_1_5 -l xil_defaultlib -l dist_mem_gen_v8_0_14 -l lib_srl_fifo_v1_0_3 -l fifo_generator_v13_2_9 -l lib_fifo_v1_0_18 -l axi_quad_spi_v3_2_28 -l axi_timer_v2_0_31 -l axi_uartlite_v2_0_33 -l mdm_v3_2_25 -l microblaze_v11_0_12 -l axi_intc_v4_1_18 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 -l lmb_bram_if_cntlr_v4_0_23 -l lmb_v10_v3_0_13 -l blk_mem_gen_v8_4_7 -l xlconcat_v2_1_5 -l proc_sys_reset_v5_0_14 -l i2s_receiver_v1_0_7 \
"../../../bd/msys/ip/msys_lmb_bram_0_4/sim/msys_lmb_bram_0.v" \

vlog -work xlconcat_v2_1_5  -incr -v2k5 "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/c2c6" "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l lib_pkg_v1_0_3 -l lib_cdc_v1_0_2 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_iic_v2_1_5 -l xil_defaultlib -l dist_mem_gen_v8_0_14 -l lib_srl_fifo_v1_0_3 -l fifo_generator_v13_2_9 -l lib_fifo_v1_0_18 -l axi_quad_spi_v3_2_28 -l axi_timer_v2_0_31 -l axi_uartlite_v2_0_33 -l mdm_v3_2_25 -l microblaze_v11_0_12 -l axi_intc_v4_1_18 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 -l lmb_bram_if_cntlr_v4_0_23 -l lmb_v10_v3_0_13 -l blk_mem_gen_v8_4_7 -l xlconcat_v2_1_5 -l proc_sys_reset_v5_0_14 -l i2s_receiver_v1_0_7 \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/147b/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/c2c6" "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l lib_pkg_v1_0_3 -l lib_cdc_v1_0_2 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_iic_v2_1_5 -l xil_defaultlib -l dist_mem_gen_v8_0_14 -l lib_srl_fifo_v1_0_3 -l fifo_generator_v13_2_9 -l lib_fifo_v1_0_18 -l axi_quad_spi_v3_2_28 -l axi_timer_v2_0_31 -l axi_uartlite_v2_0_33 -l mdm_v3_2_25 -l microblaze_v11_0_12 -l axi_intc_v4_1_18 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 -l lmb_bram_if_cntlr_v4_0_23 -l lmb_v10_v3_0_13 -l blk_mem_gen_v8_4_7 -l xlconcat_v2_1_5 -l proc_sys_reset_v5_0_14 -l i2s_receiver_v1_0_7 \
"../../../bd/msys/ip/msys_microblaze_0_xlconcat_0_4/sim/msys_microblaze_0_xlconcat_0.v" \

vcom -work proc_sys_reset_v5_0_14 -93  -incr \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/408c/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/msys/ip/msys_rst_clk_wiz_0_100M_0_4/sim/msys_rst_clk_wiz_0_100M_0.vhd" \
"../../../bd/msys/ip/msys_axi_quad_spi_1_0_4/sim/msys_axi_quad_spi_1_0.vhd" \

vlog -work i2s_receiver_v1_0_7  -incr "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/c2c6" "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l lib_pkg_v1_0_3 -l lib_cdc_v1_0_2 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_iic_v2_1_5 -l xil_defaultlib -l dist_mem_gen_v8_0_14 -l lib_srl_fifo_v1_0_3 -l fifo_generator_v13_2_9 -l lib_fifo_v1_0_18 -l axi_quad_spi_v3_2_28 -l axi_timer_v2_0_31 -l axi_uartlite_v2_0_33 -l mdm_v3_2_25 -l microblaze_v11_0_12 -l axi_intc_v4_1_18 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 -l lmb_bram_if_cntlr_v4_0_23 -l lmb_v10_v3_0_13 -l blk_mem_gen_v8_4_7 -l xlconcat_v2_1_5 -l proc_sys_reset_v5_0_14 -l i2s_receiver_v1_0_7 \
"../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/8a8e/hdl/i2s_receiver_v1_0_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/c2c6" "+incdir+../../../../soundSteering_halfLUTs.gen/sources_1/bd/msys/ipshared/ec67/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l lib_pkg_v1_0_3 -l lib_cdc_v1_0_2 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_iic_v2_1_5 -l xil_defaultlib -l dist_mem_gen_v8_0_14 -l lib_srl_fifo_v1_0_3 -l fifo_generator_v13_2_9 -l lib_fifo_v1_0_18 -l axi_quad_spi_v3_2_28 -l axi_timer_v2_0_31 -l axi_uartlite_v2_0_33 -l mdm_v3_2_25 -l microblaze_v11_0_12 -l axi_intc_v4_1_18 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 -l lmb_bram_if_cntlr_v4_0_23 -l lmb_v10_v3_0_13 -l blk_mem_gen_v8_4_7 -l xlconcat_v2_1_5 -l proc_sys_reset_v5_0_14 -l i2s_receiver_v1_0_7 \
"../../../bd/msys/ip/msys_i2s_receiver_0_0_4/sim/msys_i2s_receiver_0_0.sv" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/msys/ip/msys_serial_adc_pwm_top_0_1/sim/msys_serial_adc_pwm_top_0_1.vhd" \
"../../../bd/msys/sim/msys.vhd" \

vlog -work xil_defaultlib \
"glbl.v"
