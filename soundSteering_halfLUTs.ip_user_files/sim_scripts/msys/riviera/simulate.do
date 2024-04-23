transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+msys  -L xilinx_vip -L xpm -L lib_pkg_v1_0_3 -L lib_cdc_v1_0_2 -L axi_lite_ipif_v3_0_4 -L interrupt_control_v3_1_5 -L axi_iic_v2_1_5 -L xil_defaultlib -L dist_mem_gen_v8_0_14 -L lib_srl_fifo_v1_0_3 -L fifo_generator_v13_2_9 -L lib_fifo_v1_0_18 -L axi_quad_spi_v3_2_28 -L axi_timer_v2_0_31 -L axi_uartlite_v2_0_33 -L mdm_v3_2_25 -L microblaze_v11_0_12 -L axi_intc_v4_1_18 -L generic_baseblocks_v2_1_1 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_29 -L axi_data_fifo_v2_1_28 -L axi_crossbar_v2_1_30 -L lmb_bram_if_cntlr_v4_0_23 -L lmb_v10_v3_0_13 -L blk_mem_gen_v8_4_7 -L xlconcat_v2_1_5 -L proc_sys_reset_v5_0_14 -L i2s_receiver_v1_0_7 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.msys xil_defaultlib.glbl

do {msys.udo}

run 1000ns

endsim

quit -force
