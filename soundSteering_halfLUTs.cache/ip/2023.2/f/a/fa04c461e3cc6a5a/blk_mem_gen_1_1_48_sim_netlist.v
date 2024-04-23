// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed Apr 17 11:36:08 2024
// Host        : kharp running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_1_1_48_sim_netlist.v
// Design      : blk_mem_gen_1_1_48
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_1_1_48,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    rsta,
    addra,
    douta,
    rsta_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [11:0]douta;
  output rsta_busy;

  wire [10:0]addra;
  wire clka;
  wire [11:0]douta;
  wire rsta;
  wire rsta_busy;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [11:0]NLW_U0_doutb_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.35235 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_1_1_48.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_1_1_48.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "12" *) 
  (* C_READ_WIDTH_B = "12" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "12" *) 
  (* C_WRITE_WIDTH_B = "12" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[11:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[11:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29520)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
