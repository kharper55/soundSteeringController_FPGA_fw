// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sun Apr 21 22:20:34 2024
// Host        : kharp running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.gen/sources_1/bd/msys/ip/msys_serial_adc_pwm_top_0_1/msys_serial_adc_pwm_top_0_1_stub.v
// Design      : msys_serial_adc_pwm_top_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "serial_adc_pwm_top,Vivado 2023.2" *)
module msys_serial_adc_pwm_top_0_1(s_axi_aclk, clk_serial, s_axi_aresetn, sdoa, 
  sdob, cs, scl, sdi, pwm_fan, pwm_buff_en, pwm_out, heartbeat_led, tx_active_led, extra_io, 
  s_axi_awaddr, s_axi_awprot, s_axi_awvalid, s_axi_awready, s_axi_wdata, s_axi_wstrb, 
  s_axi_wvalid, s_axi_wready, s_axi_bresp, s_axi_bvalid, s_axi_bready, s_axi_araddr, 
  s_axi_arprot, s_axi_arvalid, s_axi_arready, s_axi_rdata, s_axi_rresp, s_axi_rvalid, 
  s_axi_rready)
/* synthesis syn_black_box black_box_pad_pin="s_axi_aresetn,sdoa,sdob,cs,scl,sdi,pwm_fan,pwm_buff_en,pwm_out[1:64],heartbeat_led,tx_active_led,extra_io[2:0],s_axi_awaddr[8:0],s_axi_awprot[2:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_wready,s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,s_axi_araddr[8:0],s_axi_arprot[2:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rvalid,s_axi_rready" */
/* synthesis syn_force_seq_prim="s_axi_aclk" */
/* synthesis syn_force_seq_prim="clk_serial" */;
  input s_axi_aclk /* synthesis syn_isclock = 1 */;
  input clk_serial /* synthesis syn_isclock = 1 */;
  input s_axi_aresetn;
  input sdoa;
  input sdob;
  output cs;
  output scl;
  output sdi;
  output pwm_fan;
  output pwm_buff_en;
  output [1:64]pwm_out;
  output heartbeat_led;
  output tx_active_led;
  output [2:0]extra_io;
  input [8:0]s_axi_awaddr;
  input [2:0]s_axi_awprot;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [8:0]s_axi_araddr;
  input [2:0]s_axi_arprot;
  input s_axi_arvalid;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input s_axi_rready;
endmodule
