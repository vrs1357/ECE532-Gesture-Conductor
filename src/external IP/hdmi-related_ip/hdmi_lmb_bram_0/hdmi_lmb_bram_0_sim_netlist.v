// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Wed Jul 10 13:51:40 2024
// Host        : bocos-ro running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Nexys-Video-HW/proj/Nexys-Video-HW.gen/sources_1/bd/hdmi/ip/hdmi_lmb_bram_0/hdmi_lmb_bram_0_sim_netlist.v
// Design      : hdmi_lmb_bram_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "hdmi_lmb_bram_0,blk_mem_gen_v8_4_8,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_8,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module hdmi_lmb_bram_0
   (clka,
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [31:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [3:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [31:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [31:0]addra;
  wire [31:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire rsta;
  wire rstb;
  wire [3:0]wea;
  wire [3:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
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
  wire [31:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "32" *) 
  (* C_ADDRB_WIDTH = "32" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "1" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.7492 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "1" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "hdmi_lmb_bram_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "1" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  hdmi_lmb_bram_0_blk_mem_gen_v8_4_8 U0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra[12:2],1'b0,1'b0}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addrb[12:2],1'b0,1'b0}),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[31:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(rsta),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(rstb),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[31:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RSqbsRZSIb+QlYJMfFv1T7uHQ7PiCEXQkl687MHGm2LgPB15GIYcPmqKUSXgtkLsIFes91PTAyyB
9H9cyY4ZUxedcRg/9ZOB5pm3zPqAbcvGPmg1ivMhr/MlS19t5lYKM2tQo+0Yd+arJXlVZu2BMnvn
+I3G9t9tJuWUIWKjI+I=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VRSQ05ZaB6bIhFIQ823mTvlJaG9+5iW5C3+KxGjq0sq9ziCshKOLpOGPDMmOWDqA4uBaxC5IKISr
w8+A8mqbYjXo5m1g8sGjNaETS0HKJsK+l5Y++tN4IEUs+DwxgrPR/+LWtChuOzVkfC7BG3LVUEMj
zM3GAyGcXGJ3sdBItZAfsevyiy7kr4Fw+nk2hWytGteu1NZk3VzPE7KQHLkOlHBPXf6P0j8LpKcr
2oNDgQ/WaEmg6OOvFeJuaWDaee8Sn6wKP/caMyoGdSeczsPtRrJeoSRlbNHlxhCv7zg+Cn2AgwrR
PTqGsMrkhv9U0sq+waS0CmwChsk4WB7RspGYUg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
tNziOjCznlvIl4dadmB9r23Duf+HQHWOuHmupEU3PJxrazHVtZdNKspG9sRXhF9mjbpnSiKYCdFK
Jr9W/dxUid36faFIPKQazVTuOiE0hkzVQAGpYxXjT/ITB/9EFBvgvP5L3EAhHv32x6MA1vkFSI7x
HrZ09YNFEF6T7DPTZE4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QCYfxgkUHlX1cre1q9aS3sVDIOX36YBK4ZwJXAVUwA6f1OQ77XibjpWJHt5FK9F0PcYp/j21pqzO
BRdkDcFLVAjxER4J5t5iMVhoeMk+3fpiKfYrm4WFl1ygsJsfFJP0jqO1OkjC8iFBtm3n6b7CTl1o
cjBbcBp8UgW6E8rf5inXA0dRqybnyxKJSnMFYLinvpVU6QEc4OKO7mi/i/s9p/efiP+CdQf0yDRU
Fw7o7x0D7tjBv943g5L+4wGZ2JYU+ISqn4Ajxy/bWTTJDe6T/15evhngS61MC8Xjamzc4YLZBP8o
ShfSLoeZeO+Hk5n3xzJRghM0DQ6Sj7NqXFY68w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Uy8FDDy3dZQGAnMQV0HBesEs+/oZdaq35Kj1PGhy9J/+EBZm0nhhQgYtku8tWABW2jKAC1GtNTvo
uReQyr1hteMxTbD5OIuqv86eb1hXZVENlZ7ichG8auUjkeHAkaSYNbHOuDLIhSqHEL67XbcZ9zPG
1JOY3+VONSww0KYPcQbGSo/2DaC5C0Y+mZODRfJ4+b0WXjce6UaJetilBc3VtqqmodIM2d3HDawF
R0xVJfHj86rXmUkY+SNUw60zsV6raCY6G3k/rXpei1d6zn8tCThkKG5fwiWY8zA7kRdTFIlVKP9h
fb6kfzRBRT/BgVQ8d4RgEcEVV8m3u/Mf4KIlTw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Pk1GeRlkUK9lt6DVXYVdtOABlzDEWQDcBsP/p+Wo5HaglDLG5b8gk08xTP3IcJ1RKcfuARPMGO2s
/VqFbnVADV90T1rhjIuWMcBnzYQK/ALUvwv11Uju9Gn0fvPIz52l3QBnpjHI1nlsFB7WeqkzVfHZ
tg9gO9bPHjHLjVd9BzH6McrEWY5RkZ0UBy0Fmh/SownJX1b0YGE7LdwKydEMEpyvb28bwTOwfEv/
4RtsfYtEvTjo6e1ZBm66D9IQmKUu32wzTfn5bFZHdyjZg6+HcTzvHMtQX2+AggXfP6FsO2/83qkb
0bfj226fnLhr32dJxtsaJS5OR63GYtzDJ05ITA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LCfWqKmUoUSVOTKNAl5p8n1hfz7SMU2kDOUMBjsDncgSFqiu2zUy1I6GSDrVnF/2umJG5/mWcpvi
rQaFJOlrJ8DNctSuavdlopRAwTMsVi6dAlNGrAawSiDIxtI3tN3MDVdMiH5H+pJMqMt59yXneyCf
2RRSRz2sUQK/aj0lXlqKjVJzVbk8HaBQ8akBJF4iWSMK4foIzJ6iO1EupYovuW6uEiO7jQRWezlW
pbbDenOHHWbfinuX5cbkjpTKHGsEKct65q+ZXJp60m3sconSK3Y2eLQxusuJ1FHDJ4GGKO8mEzCv
3cfGdXX3pVL81OfGO/JD1aMs9H98CO5ssbHqlw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
A4S1e3DHcTeWzaDVuWDRb3Yf1BjiEsR1RtAeL0BJ7J/oPWMNj96MeGsUiHtZoiYqteTZxqax2cyZ
PV0cMLoBK4Ya8CyM+BTnkFA2ablsGt5Es4TgG/nFS9VEhmeKxu8boAsqW5697aiqOATJf/LucQh5
GOnPXHAuPrDj0A/fu8N2QduqGyysWUSc1KsoJ0/0noJYvLJ2yOhFi4uIUYQfG5LOuOrca5P43pqA
iwUKW/RrFXal2acJdFeXIKffZpKanSV97urdzKyBvf9EPV/M8g9uPFJJ1z6aS+FbknhVPs0pt6eD
+J/qib4gVp/HGnRo4YlxauUMv6Yv9wxiaObY6ttDfYf5p3uzWZMlf3i7YOzZwcd4aS/6+vkD28LG
L9piBIpLx2dvQy74RdvCVdvaP1LC6RMju9RfuXJhuX4ZAmDxRi0zQyRda838ikzwYeOCSKLIvRPb
nuJ8Zx2ot8EFqSeGaaRFaEMU6Zf5SptCUuVMHvSkinBewcwrLB5uiJTJ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gj+uMxV+tK4Di7pgSOE82FOBeWmUB1A7OKFOSMUW3qrmQ4/YhryfHMlWPxfAq8avQL7tnBTnRFEg
czbErdIcNzYjrM7Qq00QC/mTqmeQX4/apbqGvN+rwK4RR5oj22wfTib/UQNEQX6fbpi6PtmAeUR9
eShsfq+YWcf7z2Zw4Q+o4+E6m4/3CzU68vglNpzNsJ8S9/8XpdIrvAA/WRAX6OEOC4wlNIKDZsq/
+zMbFgSzN1rP844I/CDmxYM0NIzBWWhYBkPfJyQyigmUoXb84lDip0/Dmnq4EHvu7D/tZNnDl5st
JpftRfEpT6S8e/5MBeKUuhbfg6etHo/oFZvPKQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
aWTy3xv6SqKsldtLS2gY4KrTS8U+KtFNRHS314f6EYZy1MHE9t7oICJ8eNB8up8A+odoE23N3fJb
1alhaadeRWU2GjlIiK1LjZ5PQw+jb1u1GWtRiY+TcTlD75XUlqwykVBrCDfm565DmgZjZle9T3/t
WEfLo+m/8GfBe8trVnoftsk/XI00BMFXRzw8doPGDhNECS1NUrLebryb9iO5Hf4A/40dtslTARsR
nicN0KoIIyiQ+QzliqyXU/8VjS45inON8R0Kv9Qx46EXUp7bds5uQ7QycRhpLG0IPnMIweudU67w
eQmpHJzvZKBCZks/R0OafZx44H6Jib2+QazBCw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UGdPiChIPj1lSozqzCQx17Bi+8FWSuMUMzXUkDLH5zcP1t8tZLzh4CU4WAR8lmJxn8gH763fLp5c
RYU6zA0yxHzl2ksc5YRU1XEfQQT9ha8fQnz+18wVKcsa5UIOfMbGDwnS9yfX59ntG8CB0uF8bJKE
y1CS6U/1Stfs1w2mF94iDxI2n2GJlb1UPtWpmxMBI88hY0GktTPXP2Y7JKl8zRl/Lq0wIF8pHwXk
B4nOgKm6hfzPj0xZ6E/TuER/JE3fy8RSm24IlL/CUgpReEslEOYjQ4EKKZRG9/fxg26utQWW9p+G
fWVU53qrFGzBhKQ96Paj1ROkv6hDHyUb6n7uSw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 52192)
`pragma protect data_block
c1CcjkHcgVhEFhC1OmlDpRk5+adIXdZzJKyVvM8aFdCDeCfpL7gvdXaQSRHkDVv/prNoE+8MEfX5
r95anG41W49Xbd3MF5ZaQEpBZzUyXgflvjW+pD5JO9E+kliYLPUxEiUfj3fhszCC2R/qiFy7GU9F
e/0eywyW2Va1UNgTGn23LmJF0jr9/cvCkE9dvpc3kTHs1SpXkmDLFlj7aA9Duy1bUD5fse9eiZig
hhnXEkLGHBY+OzBFr389qdXZnP8G/f1UJDCsBHuPhQ9kUUKQIM/8PFhQnNaHftoOUwQv6HEa5vDG
ZI8BiwCKEmU0BhW6rpSpwULAXvOx+gacMB+601rVhyLzz4m2144duEwoJoUGlxCneYdOl41/vl5L
YWmXWXyitWC+g7LT/D+U2dwxwSsZcAMQO3zKtjAMPkkbxI0qdkr9TyZaxJfIUcpydwXnsVT0f0KO
ipXKGlNvEmLxmDfws0OqbZYP6DTYVKEE2BG//B3cn7c8DCjj/NeBpxtI/HUWY2x1M6t+O9sNWf1Q
p08Pr5uqWenjsNb/d57kJfaWcsv77nmI6Swsu28mRqf9SC456ME2hI/tWUPmD03wJi0QU5QWVQsh
0Sdjqr6MmMep2C1dzY2Gd/g+zeGPEmkhG0FQSaxFt8/llimfZ68gExHLD7xlCPcpT/4YbyD5gkrt
Dcxg8wK65l83zZ1vq5+bcBs/NMfObRHP1JuXGPdQ9plcbwlIWk0Y/5RvI94TxkdHmGCeYX6GUDH8
bnbTUkMP059hY5rl/AL6xQwQfqaXpDrjBKqpA6x1AJ4KWeTfS/MmtZKHxnIlvZOTVvWCnw2sPmGd
eYz8ES4+gvuGVObW/5NzCSJQ0Y40VzGDliYAoI+VNxgP1Ah7LcUCxNtWq9wC4h0M3JrD43T8Su+w
em9OLNKELYIXMkvBlRsWpdwPJ8witsAvKqouHQCJX/gPbVB2iUzgh8Gnt75s5m5hKYEicoLc6GO/
sWV7NSkH2lWRV9+QwFVAZepCimweudQ9oU9dqI5aL8vx3sfU/pFJetLqDNY5G1ADvwC2QosncDM8
7YeWzNNMDiHP+wFCEJt9L4ik+67BMGGscouqPfK1jk0n8HXATn1fAVj4CredGPMW++OhuQxH42pF
kglrJggl3n7jBm6Y7UHevsgxWzcu+oszk9fHJtPMHMLTzyyjkQFWV2s3Jm2ycFUP9TeNH1yfJL71
TIw+ezaVkXeIEvnWe2cbtLzOyzsvefdf2GTm1BmBX2IoiPj8rBPWZ14WV+AgUtqP/dYflYtH7fzT
Nq0+kpqYIfMMlnjrK0WGqZvaxaggiRJth+L0jVRPO9zFiX3D29WjF8CvoIkpah01rzfaEG5GV6oO
byUOI1ENCEBaCqEFC0tS1ndvOjFmk8TDA/5XtBWxNfPEvx2UDHZO7QtWk/XjMUagTmbOtpCRL3yd
+PztrEgEc4mSkVrHZGdg71n6aCfBsuSjdybclF9MoABLTUqR7Sj2diH/LT10VWx81ebGlusOT0uu
N1wB2M3bsCL2uyB8sHKDz1KSh/BybLdMTrj++PEuwWSGn1O3u9rHZ7zK8d08xYZjk/cyPvRnCl2W
NswOpGUX/rscvn4RZPXLtwr5pZsGE1pCY+QiC6/2VFaFUh44SbTYl6HkYJWMTN83ckLO65VHbOJo
OEhBjaHp1VGjq2YV/t7GSDh6aw3odb3NWLFce6xEi95++uLyABxLDx7LS59zAdhjSL3VtOoU/3qu
Dgf+Sa5aPTyZ5jENgX6gfa5Gc6ODqTjZbI3m/V1/iQTdFuA3NW+up4YWZvGRJCcHfuuf4bjdmZRH
ijiaI0BLr9JvoV2Kr9H9mRtXJ1NlQRm4o50xzaZJwjBNp0VLG0SjGXK+plcmIklV4RW/O7+DlbTb
y45EmmZ5gKNvWumhV44wCOjkMNuKufP3nNwSjWHXFrVkSEJzOtGWTvSX9SfkRcfGwL1J1vYANUhl
tbAao84G9y+ajcCfUqJ09xy4+ILYJG3Gk6saeqV0IDXDR3Pq4KkwFH6lO9jPXnEt7Wea5/qLp7VI
JZHv0TWQbXT3+g9GbuHdORuUFoMSPi/n4OxjIfxZu6L+4g/6NVF97iw3N5OtdneCj7sLo3anOeR7
ws8ScLvsfAst+kWpeO4M8bBCjArOUdFbp5rnwDQmR30uu07hItV/Zk0WjVsPO4xe6tgdTCxmtXBt
B1VdGjqMw7jFqfN+Zo6Hlbbg6XWbnTFBj4XqMbzaMUezM2quyfXMYW8ToSqpGDhGqegzBi3uGUrH
X/LTwN9AS4YJ5ubU9RpJSVBgMw8xji2GDonAem4Yq167M8ceKqTv3L9M3f/cX0wmgawa3VW0rPIq
EB017/0mG7HPmsHGplwopvlWJuIlCubXAFU4FLXh/CSYGXbFUSw3OKlf/4RSY/lPTH52pCyIy0QA
UTZkkEgGXtpMx5p1I4hdERrbpvc5Q+LwpGqhnBg1YhBqg/CI8DenEhz3Ahb3JwoPMZ1wvHPwSLxV
BWLEg4KCTVOc+OCOossy/4K15RNO5xdpNHQ/7rfos43ybSpR6qvJDf7g8PbS4Fd47K5wqumnElCs
AjRlS4q/5mieScI01D0pOf4EdquixofiQ9+CFk3VTDZR/SxJF1CFdBcnm7JCt65bYurVQB+K4Ylq
M4k5RoknVu1fKh+yYnErkCbc6de7KR6eV0Fz6RD9MW62TQi9PlhkTwFlQ1Q3gF50HttOPvOpBrU4
UrY5PbLws8OB2eDmv5I9Q7UvM4hkFzHvIAYkb4QeG87d80rM/l8RlOpE5AzNcCqAEhSRA6qQUKq/
Xm2ZegvTlycbAMN1w4Qti6ELgZ2jdIBmG6L3trKim7VHB9RoeoiHAIvzOOMmhERrptgpLopr1wXp
ixMthBRQxB5wj259NNj7v3DdL2tqOsttuVviHsm1+2UVHMZQB8lA1THk1WoW/DTWYhHJt0zfHY+L
zRQ+vP8R52MGNpDiW7d/U8kdm+ZQCi7thbKQbiLIYeV8aB/xel396mldZ+oy+NFt1b/6r7M1Bo8H
HPZywoYT+o7QXxQ71iq6IYk8bFAmuA0ZzreHqrbcKNwUBY6pxrSTRcuqpLfia7mt67mxyCSjwIri
rA3wk9sHsUxomYFHCF15PBHEDVgf0IRGeLTNskWN3hugTytL+YEFc27uEFo0fBEzl6612ZVxodOq
8pi/3wKJAiFwpmFQxmXXle94gDIgbsGO9vhgMwlqIWo9MKwkjlLqjJ7YwHPAmvLuTsza3/AgK6zp
NxrfoAeiEOTIQOJ/MyGM8BdfjZW8UrLIdlSuzNrEiGLJHGLUjaqHHJCoGOaxEKQu3PAhEVkrfoU0
/v58a+N/qB49Y4PTuB2z9xDPcWa6WJNhbOPlnRGggHXfXy3Lf76z2yFLhy21aosrbgdmxvqZNynt
hblWte9eNf0PhiW6JFmL/t4fvd5C2hUBWL3H4r+WYyUFEypGdbSRIiZ9GEOmzopRk5hfe9G0/kCj
Mo9JPwzl1iOAtrpArju2L6YHpTqBeGBEIcX9At4OTvceUxmWdUgZQNGzh+EID4alHqEGIE243HiI
TfvMVGmnNd26LJTHvmwAKJWD9HsTlEaZ4Bv9LlWzlKO9qHYJcZX88BKdVXxYHKQgbFbtxMonxfxT
x85FT0K+lJXslkS+vk0s1HcOBYD7BKlvfHB48WK1vbT9Q1ooT4Op9ftE8iumBsnqH63NWxk2qEcX
K1GPQHkG6JucIuL2kFNiVMY6i3QuXbYj18M7Xg3ut6YyRIeKiXLqYAaffLQxDHkm1Q+jXFYrACzw
gK91+mPxRYPLMQ0m2DcQE7inXV9FuRriLUdJyxP63smCkAPJbMe8H/VHu/sp1JWLihsRnnOSwqQt
ZcjJuEZm8Koo1TGP3EPEDXlYkpj7ybzHaXTlkkKPvN18c9I5fe4gbGjDF8Y7ZsFSfMdCORipq0iF
f9QW6odp+S2QiEY8Dty//uuuPTbNy9TpCxhCc5Xy3SHR+l/1aJ3svmQzMdeUiA22YTT9n8nHw6Fl
PWVnx1K1GkOz+FLbR/B8Y/6DHVnxBvPgZJ/urKfpk6V4TbHT2hEiCr1rcBePpj3COyHro5imIwJj
gae6wwPElNTJbosUEAViVRRvmuVuROP3BlpE53o+VaWwXWtYxBwXFr0aBCw0D2bRYqqzeTDKUyby
dt7u6f/IgED1hSBtn6ehqD4PSZmI//ehlvyw2dA5evvC0yNtrV2oyrSN/G61aA7QbLZi/ZuoXk5Z
yPTGoTB85Lg1nny3g5xG5PNQwdmk3kaDe3Q9j2wUTVSTP7oZ76+/o9Ctk8PME7ssFO+YTB6pVP8U
BkvNe3QWnG6UTSFrjAc5T0e5HtLI6jFLNWH8FSiyfsH4i/TqpATPadZ9SmL4pUvmwr9/byz+poe3
HLJBsxVfErUraWZQE211LPW4cUXQmB7IH229yB8Xl5/Rxcf4eOsvLv/I8RQ2DWanofUSrOGGxGPl
LnpoMRBo8kUzvv2qsArX1CXb0orFIhpLpzRuC/dAqAgcxdm/gjUOGk30zthXACzoOglQLXe9CJAt
UYXPRy7tOoOYoaOHR3ScburJGBs3HmctwySWi+V4UB2RpLc826VWjhUSFYEubjqOysZSJDYooU6k
hWgLQSyxeaoMhTh9V6TY02PzDRN6j/+YUL9J3DXuanzsu1aMIoGUxcnKu3+xJsQ5HpFkrCLckEwu
TANuJLCiVMUnyZiT6kblTh3qnHL6ebFPOvFKqy94QUEReV3tsNKud2tRyAT/xdNN16GFA+NG02Bf
jaAdS6WsFW3Lxxmq6KZXhD0FdUsMHC0xMdK27kpCI1d+x2fL4Kp7+BqJiAkGTTCx8IxFH8G+L5DA
rj42o7hPCqU44M17PEMn7Kvz7eBbpBrPOgJt5XV3k4DGsdkTeF+pGGmuQFYnvqy7EfDFuYifFNlC
BkZ8p1NTCxOJR8pvz9U0WAu+pIc9gZHwEphm7HHtTPiP89MdpAizK6kgLLuzgNIbFrvE4H3j2nGd
AnCI9WzU2jWQHo5FZOZNu4+qqrHaHrKBn67BTX2Pcem6BxeP01c8ZL0CIxl08OWgb0vw0q4VlAee
GvB66R7r8KL9Y/j6p5JU9sX5xhCYQXT4OQ1vRaqJePbaJZ6IHfFD658TDk8yYwH+oCwqgzgN+vYk
PnNaVPjDv1NAikW9fR64dTrTl5D/fcFO9jQ9+g2l74GaYcAjDfYKnKzburKGeGFyezhyKEeCwMlA
G1VlbBSryg7QYY/sPXiqkykyyJFtE6VMMCkJNPwfI037r9432zzEwCrKegvPaPP4t/auC3syHBco
RAx1bL3yVFGjlkv6Q8g+vmN3f2bPup8MPzxUCNlLg47W6YOSFSk+X1G7Hwke9lTIfr+TIueJHG+B
uxrVx0cOM7J69G/zK+vWh+WH3OFpJMC0ATXyRqIJtWBGnQ+U0i6jDEbyBdAXA/vpeo2VrVgmB7lP
QjApDPNeXXBvEiKOw7p6bunBBD/8cQZv69cIrseRF4wLYNxhYjY812qYE96lvHZpDJJUdpIprmnI
BWjgfLZQKtr+rb+aXxHjsd/zoOxyfbi0m7zclqmxznp/7V5cukLNYAPFJDYCH4hxo9i3kOLk/bbQ
tojWCfBLkMIUxt0VjXS085+091H+JLNnUWAl1NK0WOoK+YEZPyBvPswKMovODXANJDYEAPRNiOMo
RnT7RSOlCnlKSxwG6LIdnZLkLubRSAsNCfes12nCckwMnzfc/M43kgeprqWc0og7vuGT+HROT2Hd
gY0rlIrzle++O1+YDmHjPmI93NdBkcfOsyWVQiQk8K+QF3FT+wLI0Fo/VmisjwRLJnwV+nuYfzgp
L84IzwdzluYfcrGys0ODM9TFGBN2tZ/tGnwLFLEUq3QNr32i7Of2tkyppB0LTaC5Or3aOpCkirNn
MP7GNyYQK0BhBHqKfe5SDb0rn1VCQE5epKxe6OR1mdf6UN79wYbmOaDxfZbOCrcxR62ptmmbr1+e
tr9oUuxQqrl3qunfWEDSokOCVgKnahhPpfYFAFEUB8JAU7Fx3BXB1aV3O/3RZRO334c+u37Ij96o
bNYY8jKHvEtH24KAM1e+imo01/na0bWXqY+Bv+EYJPM0Je193HBOu/+Zy/BwhLxK/rS2JOW1GelW
//27JaBdy6OF0Fml8qEpxAZwOZjQ7DefYly5IIJ8v1gfMJtIikqu9CoS5MYwjo5yqjxgX5iuG8T+
w2y+EWtCSZKrc/QW9XvNCDNOdzrRYZa5JT2Fuy1DAFfFjWGBUpX2w73qs8eO7gxq3NbIhk7m+KyD
CGSgKVdjOnHJ+/1DF43AXf9Xzh8iey7xbMU2P5hQn8pMcWKlfP0Yqh/T0VZ7a22cLLmI3oa4l7v1
g041dZDFaiLmFSLCaVzIk0PdgO8zist29j5nPm61O/rsL22zHDGfg7kxuf5f2rwbmTonid+vEcBp
v5srD7bqUOG3s9MnBNNQ17EqN7g2XV2e0Ot7lOr7W6KcRiT1QPAhvA+u6bttBf2SUBcNHYr8Kf/s
Cd+Ba1xcdPa6Cx7gie4IlB7cUOuOnAi7diLRzHyeWb0Q5sI0tvj/2/r5rumSPb2Fkt1OXCs3Wz3i
DZRt6aVP45XxzqAtyOiwuBAUGXPd56XvFr3Tf5Pyc5AmjqeLidmA5topjfKUftHSG2wJFSl5TtF4
IaWEyet4kzhPMeH9fJFlJPPbHAgrvd+a5q2QkwdVltDUsgLXq5hoOz0Lc4f2pdzFNPKSXUOZ7b0l
t1NiOYDaO+zRhGFyKGRZ/pHVZwR19zzP3OTPmICzOvJGtgeIDNk/e0a1gDoAk15/ONGJgsdIv+fJ
dbRnrA4gqxyUf41TAN36VogVHNc5YHhBa+i6vUNUHnM1P4jEfbLaOoyU0J2Z7fXT9HeJCc0OEzhm
s/Eomymw35x3tNjWde+XhtE/O5SNT405AOxef0ggfJb2k6ekHgkVmDFfqf81Rfzs7Uo10WoMPEQj
SFpTelzwyJi1ygJWFytSa0DNfXEr+u4P7OOjicc42yr0ujEHOSpJ5T1fZ9JZ2d3uCn6Z+D0ddmuB
k6Lc495By/DfB/ghf8atC/p/Rbn+rHjo4v+1G0yX9F9BSQPbOIXL+ZbYdcO0qhC1SgRcbwNQhY4Q
122wQBLz9REPxY0xCA2cjVTFdhjOgRxOnhG5pN20fdKiP9Ka2Sltsdipsf/5VE1GvxRCGfJtDTrl
SNUE08ZqtiKo4iWfb6xaiM1zKFQ6nqFHsPuynySPBFeLT6azGPy3mHw0Z8KkSV4JE8Ihw6EHr1s7
oVdmld1gn5Dr7IzJiJq/LtjYuW0a5McsoEWmSf0ET2Uc2JDUr2mfngiFD9z2I/bRdpzmEySWCn98
d/6/1FEUAVFfY0VdDiBncqxuknW/yMmTAH+Xep/RkLIwChgXApSiav5n2/64IWFvXHA3lQ5WOXNK
qTFATyq9Z3goRr9clfm+gvzuCvW/tGlu4DZa40ckzn+HVDsD0hbgFeRMhqRVqOl4uFxFW/UDscYr
b5GjrcBcvSuK7NzUIgfvLUsvBeLa8KORT4Xb6jlsefFhpXDbGgB+jmpUK12HwvP6opuynCrOg2vV
34orzjGC6icC0g97YUAtkPF2cqfZ1OqYgLn449Gez3eKyt2o8Ighf8Bbb9QutgVHebOQWleSZKkP
FjvxOsEFbZYTNSdEe1CjU9myGzCJag4NpoLQXG/zcz3HzfL0f3RK3nb66hhgSTKWZuA4f+CJJD6D
KA4EW6ksXcQHWDBxYQ2KDxn+7cR3DjBUsbeqaoSnoyTY2KdndIZlgFab1zWvnK7BO4Jtd6q1S4ne
Jmhy9tj8zWJ5CFaqRI/hdW8jLqT4mXlrJ9p8tp+Qmy+8Nu1bVaEhZkNEc7qse83kS9D1J7QTMvHe
g8m0agiXwaFbmKNtY/hvLAg3xwmKCkNoADwRRA21EX6j8pcRkZU1RvjMwtexoWf+bJ0Pnug9GAUL
6sUkKSBwiNoWyNNEEKJmReTHO95iqYGqeHv+OB3ondJLLQJbLFCs6pN54e4Ip94qeeHQLusRAPMu
B3xDtMqBfzo9//4S1tB5uW3T0FHwJtDD8QqvJjMPKcU+SbI2mu0D0Wo7zOutGZufP1EelgPuI0UJ
kasfVSflr+Y1qPbMKjLO08Cm1UhsorEVTtP2+YSLg54dV6DrUfEl57osCxVNrwmDPsrliSx67r2u
0Bf1HG8Hyf4G8XzvF6ZUTN+vayT5UjaO8rWl/yJDwXk3eODBViEoi8H+1CZd8D499nMtvY2kfkS4
j9P28DQXfer2zgxxbmrfXlHkBYjciKBEKF6prW6Y1QoIQpdMv2FFwO+N2SYRCzf8h0PWkV50On1S
TQe6p0KtnMyM9OkUxHJVC7TIZ5h1uHHXZ81Qq3RuJk3IXhnaG6KYZ8in+7taWKj83mQNT+4NRFkz
gBxnFo2rPu1DeFt9qU9pFnLRPtBQwtwmkOv+JROIqEhyW2lkPt/+rjp9/Q96e2IiSsdrvw7z+I9D
s3kMI0Vpvt9Vygm4XnUfsNW7TBnUi80CmvPzZzSV007iBYWrZ0TGpUJcFZ/lAJmjcCkJYqySU/d/
njtUrc2v4Sy64qHdFnxacnVvOyB9qeDRU6XgPlI9ewTIshD/NGBP+MND4eEWd1lDeG4UlhS89vXt
zBM11wfcJa7gnw1Spfaz7Usv3+USfvJ5STd/rhiEUQ8+a4VKGRVz7068ZsoVoKBi3g3IN8bmLMKT
CJB7sjBzvU+6awwkyH95NjvFXxunU3xM9S/c2I99GhPgAmK6Rcn2smFh1/1yzuRQad/Cn+NgAsDO
BR3sO78qlUa1pXhRmXLDO9YLyQVVDHqgYChVZv7XldoSRFVqg2QpSufHJM6UVV7WDJ4QIEy26TSt
5pcJUTJZgTtRl4gTZ7n45uv9UEoaninaOY5ie/foVZNiw4M3rqiHYAvLRdcukvIJ7GQKQNspNCz4
e83jbOhFr/YNUN4C1+7FPUmOOC5oRA1+VruXjwzIdRDCCHRMvGl/+M1QJ5Cpe6pnPS4J7m19XEWj
8TG790dlbPOFXrMU44EL0wUjmhIzK7DBfd/6Y4GvfLElJF/cDDXpQ1V+qPs7XwpzyfeN7Cu41AO+
Mtc40oP9+xPKE/klrTx+xM955yNNetFg6fR7AXxVCIlvn1MeVmOZHAUN2zUTJSacDB5BnE38vs0M
ygBo6o4idNW9vAbASxhsfC90hW/Qmxf0NLX6ZROt7eQTazg7yadcOkJ9GOjdyyfP8/5q/p79suRG
RktuDB0T1V4R7H/DZYoGix31GfBtV7XG714IjnQHmgotEqLb9unQlUEmv05WYzRvgqCNrWZIwr6w
a538RahF3XqIRsHk6xPy9v1ykq7/MFd1S3h6uyFhQRQUcrX/05ULafgt12sCEndtWNtNx8fm7HqG
S/aogRza7t4UeNPs7PGvD+dbY3yQV37hgRv4eMs6b8Cuo3C0L+mqtUQo/Kkijk7weIus9pdTHkT9
5phCZ9b/9KXeAXSqq5PtynEYVGTu+N86WENVXJjK0IUNCAr/H+jDtfx78fww3atR9LqIR+m+DRCp
7uymsaZUSEsL56TF/Xcg8gvszZFo+d9AqhHC+58WK+UxpjUEN745VU3rCGXEj+VaQYmr2SV9SZz6
tkY6DIunXiQXqCbvxzF3qBAWU5d+7uXeFR7ZlrxADMavrLHnaQLcVrGVERcFNvaHPmqdpFmUIdgb
UAR62pgIIUCImuWy4KC8mP5zKNXvt0E15LjgFmfFIQ5lzf9kaKzh9YpTcQj3wzyoElmZfB/C58vH
8EsDHCRwNbH3/iQaAc17ZLJ8rFCTFiodu/9nUQ6MIvRtgtOOJzmS8MIiO9GJKxFLpK2UQxPJU13y
LR5pXmopueqqJpsXxPZ4Vt7SeOG/aF53FvmpZqCOUEQW8rW29jXYDfPIm5oLmHodlvKS4yjDog6E
XhNB6oBfdelud+ghGHFeD96RXksQV4jLHE6mGRp4n5HNSQ6YKgzSX4B7kSaaHl7pDxdIX/cGeh6G
Y0bItRdVKxEcavUyiaTCKkKmQOavHeRNYMqu3gERn5OaenBBWwuiA+41fwGCh8HUAYec2oC3hKOi
xiqOahB1JHdy3TZ+UZiZXMFhV56iFVgqpfptEeCLj1AWBNtMevLdFc1sXRM8+njzTMAbHkPaWP/I
9uaEuD8VKcsPQep07TZe0pLelEZ0TnNkQfobrsk35Jx/pNx8EWbW7qDL46td9Doid3HGce7PKgim
DmXMxP95zaH5e32JtTryciLOCISQ+msrz2QgyRjdgeDlt34HpO8/AdyAV6MMz/hslVOTUs83BoR/
Gged3qqZWq2lCRLZ6d6HiDv7GHTp/DudmnD1nSMCeqK6U4Fw5u1/8Mayd2Ycl7bpX3X1qgXwgGmV
WepaFJ4rJbvXGJxEd/0ZJ9yXoTXViEVfEWL912KjBccQkTghnznIzAv3HLe3njsTYbymZ5QLUYCj
ntyYScKgOhlvhM7AQlgSo/xzYHqIdLX8em/yZZxNWjwfq6wFoVYpjPVHK2cAQjHBgU6Db0HbhA+A
MMHHCXJc7Hh/pFm4WifOSfRwsWkTtwBDPTWgW/fPdCjXLzz0JDqAp6vfV+wN+GXe58KWJW5QBvCL
iQGIroRtUkDRgsq36qZzwWsFcIIqv0e+5v6GcYin+X8KaCTkvw1Ff5J5RzVMj9ex73qi1zUItiqn
ZcOSxANKmfRCK0c+pl77Gll9eB5oO0v7oRSdUYFpFEfZMxQOZ0amUCa5IqeBePnDhqfy51uzG3Zd
LMc+ovqXQIcT+kJwRs116ZkL3l96i4azDwRebkBsUer6YcdwlwHTZLMIBRGmMpDZwPWv0ns17T+4
8NxjnbJo3Et27tjqtfE4U9B8BPxEuBmmjyLUUfjLYfEXEO7eiIA3hgYlmaSW6I8n3oYuVB/BextP
lvHjdIlaS2uUBRCuHn4PkawKXiXxMEmLP9bt3xTe0Zz9uAzaWj4ytpGewnegwrHKXJ6arSm0IGHA
+QLBM8iO73vqysKmigDN/A6u580LUIuT7m1dur1i4Acx72wgV4v7O83CxWb3pWeDpXTDna3nTkF3
sZn88i0mutwTCx2t4zb2uD1gm6rjWEtro/Q+0oyn+6WIL6TgGJNSl7sBCUU9yl9YzI5wHJ2/Uea/
GC+m2ylInqJ7cQFNzAZCVBA5QjHuJUG+Pj8i1pojWn1eQqOA3zt+TOLrjVkGjr+CtgSnVkoJMZZ2
aY8/48GmLy3IWreKKrF1JJKSxKLCPDFHnbat3CsCMMT5dxOCN6hikwJysiYT7T/csfl/YYo4B238
skTIW0HfpBEZsA10wGnN5uiQo1i/Sgtj3VL1dlY9u6l/jMH7/vZxFPhmZTX33pa0kUBc8pX8vPqc
x4v188GChXj2Leerc2etCosUQsi1mR3DxA+oGHfn6xQpQTn/ivsBGFZbtLyRu06gV48SEegfoStn
WrBIv0Pg09BFgBuNbswkTYHyiLqg7efVXVdx+7ryRTOpl6bOQ742o1/lKt68gepzWFjvH0YGUJMN
wI/1aaB0WFkoQBsrLzF5Dv41FmyrprJ859/BoyPHUNrIsK+KnzeAPOyYBPidzhlXOmNo+AKIS513
CsAilOrTQhFKLOlKFcjqFXzi/Dy7lW7zAKfV35zr+ACzKpRT3uMkHcCxhbeMGt7Oum1lxFHwsWpA
4qTiSSENKgoaZ2JecZbSBEmsQEVy1yz7SdjIjpSHU66vBlyhJQNxMZ5bsuLXS+8/Xopr6TBgjy9P
DlGld+NWxc4P7o42bY4IA1ymtHlJQY9xwCRzSZWFTZK9bIXFdeG8ioUB6Z1xLOvFUAwHoMGjT7ZH
ZU/S9oWugQZ+xsREGWblQST9yxm+uURAAfCykUn//ZXRohuIRCJLhw5SpsZQcx2tx+jMQe2lTZnL
ZwL0iCQPe1aEvVi5Sq/tF00qBvOOSFP2ej1iPUu0gHeHULFDde1w+si4hZxLtDqLrYQtVgkT45sm
0MtjH6fkuqt0aqtw8PdeQtrXbtQPPgjr0CR7TgZpmtS3UwTr+c9iop+S8YFneBrxuEDS41ru9/bG
A62+z0x2UAOIgiuSYy70F3pZfGalu6ksTcLHzBUJli1jE+z2PU1wmmn8T9D9ut3Qxnq5qUkhoe17
R+b9GrDAaOXkU0PCjFdpZHe0+7+EemjS1vGrIpxXKPr1kZSnPqcblzac/jSJ+kvfKEIkncG+oQ1L
MYYNNEiBZlCKzLay/JLhErp/iYDGSM6W2CO+HaQE2kjkuGE+dqQHaO8C0w/aMH7LD49xLJpBPXub
Tndxk0IEUfGhNIbywBn2i8qQTNTuKCQvA91yB+cTVGuHZfkomHRK+TLX1DI6ZniCCWuGgBF8rOJp
4T8OIy6vVNb3aAmUORKeieg3HFxKcEMAQzjDIx5qM067AEqU7wf8zgoPOSoByTpBVlmHN9SngCJP
eVIOCcZXInkPOKXwUYt/7nb4S9fo5iBAxlgF0v4s6jOhaBWMUmEqZfxRgjLrh1BWCDhPoShH3t03
p9QUIwvca62QBFI5dqvz02HN3nb1jD/+yj+n38Slk7y9W4g25Pfq2TUdlVsRQzA8Lq2jxVt2LXn9
J5xEVRiBo4mnH55z/l2hXuXn86u2ZAbAaomyJUiBTFws6jfvkfHNdj6UD+c436VF3DYIbB4jxaYW
EmANAKeX1D9UTS9EwUrb585WhTNonfL/awZf51IEJuGfSKv9OvX37OZO4llH9uA6SZZh3GqI1yaq
ugQOv9le3INogqot4Zd/MAeV/cBO4e9NCMV5d+lWRRQC/1/24QpJ+hI+9O3j5MHmIoryuT0VvK1K
3+n+ihVrVwVj3+KVRHugvYvI7Go1i149syUnjIG6Ddbr0ZM1F+5ls+ZHgTAwBBTamxbHQcRhM+wa
giFsIqrd9q3S0fpFuxL/+h7r4KQwQDmDt2i3W7QCCN/r9S3v9NkImzNg32NnleAYvIZxRi9AjGow
q/9eYYa5USgi0Dosd2SMQZ0DuQBJPOnYrWXeXymgldrmwe+ANLoGyicbKgXc/ImtZL47xGpnfMCK
tD33TeJ5o84Rxkg+64lrxcNaAHU1OD4oigWTsnhFv1IiKUqqmeIowqbwSD7uez76M6TWfDtaXNhx
4IOiga4TaXwZ7NXR53sYbyvrl2/kguLnndEPwejeNa6A/qa6HIzTM6CKVYmt4095q2CYtw0yxTLd
HfC5hkGwiqJnaxKjk7UT6WMf8VYkOpN+RUDlTJF+yAnweNwveBwGdl5VP3uR+G1mnYtPz567lft0
OkpThveapnXS9y5JYPOTIvYLV8sKtX8qieeAQH8JsXrrqZLdK+ariQ32tunmGazwaufDrbj6bFhS
hys32QFr1uobeBZAtOkqmXdDewMxmezt1F0pCVrvvZ00k3yqgKcVi5npzYaFkjadwNCoZqzx0UfE
+zcP6EEZaMpzEdCTJugYuqSYfE0gxCjo/cWp2lkqQWMkjNOtfWRs8Y3+yKO8P2iAJbilaNiEn3vl
eC4CB1l9zzB7GlkLEffw+aaQueZ/7biXObPkfTmvzIJ8b60+hRC9I3lvXZmThBvDieD+Doz+rdCz
qqGU8caDQ00XnRCOFhE13sR8r+f7IxkZmkkLY0bS9GjJcyXswpLtO9I0srR30rxD/C8xzpDJ4b7U
CRlPVJz2b5Dm/23K0HdpX+IVwRB6GxzwYPpMRsRUPf5eN0X+uUhl8dVCWf8DW/5/xDB10G/JE4Pr
EaL2zTZKSDx721bi9Dv3FrkIeDG0iKc1DIy/rVANUKMNWEzPmFRxLnpuTFKSxmOj+S0SX1OJsTxZ
UX40iV5h+Lf8RZ91vYvjwrA8226S/jZqOLpPW7ahv9gcjiQIRpBxcN+8qHiWopMr8OPa+Ei6iek1
UWBeTfA+zxM4Kfo0MrS77MFA4P+Q7K5XR14dTWRpxg1t0/sQxCcKCojeOQrJ7TJSje0BMwh1ivYt
POtjvZaSLZJ1RV8eeNxBef9GlF4uywI0rZ6VmmyWTA3U8/Lrb11URREV5NnKHLunU1AVybcLDgmQ
tXOSm+Dz/M7MeqO2L5WUW8Fb4JypHCKN/FKwsmVrXBh5GQOaL+WKuZLqueP0Di/A+sAkdWGzBZTn
enEs/Gz7cILc57RrOcjS6KrWxwdM2P7uTHU006Jk5X82d6RWkzfn+9tkcL3ZvCCeISVYyYuTcBx6
H2PQKErwLn/Z+p3mmG7uRv48iVlGuwjQnSIH+HF+NMfbQUrhJH882qgPfZBCHXfkKmK9Wv3s/3gz
Wl3FH4pb2BQyxo/yC4a2O7WrT6d7TyRZVhewacJhhXnSfrVTnQoURqi/W1dXl/GL3FaRK32M658E
8G1tfxtAALAe4jKiBkdiO1YgDJVT6Ry+22l5FRhYdFv9TrQbL5wD+yiShvGPi+33pzm8C3Br2K0P
wgpPakPG5k7rEZFsAvRqPYWvfhFQr+yeYKkWWINmo0b77ihVQMLO7TS6msuxdYExEdSsyd1fY/YJ
Uz7g+NhJzgb2hc1exNvYBxF3ml+wk4ASvGXnpWisFmFQliMcV5q4YIEGEGYAw+8bJfojPxxlZnXg
3nDWe0B6AFPPv5wbg9Zd/vYnlr6ERbkz/0LoRkb2v9FG0qz7+6y9OU3c8tz5n5KinpN/gTG3dU8Y
xFDBKwesRV5NwqXm5ekqZJOeeoj4RYVYIZ2laLnSSoPgm+uw2tRZzIwqXQr0j45gXvM8jKihL973
r39ZXeTjPteleaDMFnogpslWboGEt+HTDjjC5PJIJNIKicyQlpdpQY2VS3dmhBJBye2imlNxReS6
rn5oUTR2kdNB4hzrKF92rOWDnRes59w97NNao19ZGhULfnZtwXW8UOSDnQQ8bBdf/hYqFYZ4kAdA
7Yo18IAZuTm1B+RjFXWfg6gfaHgx9u/iVW24mEwYkAne8xfy5Hww5nxiIZtfjlgglqMIRQA2vwFM
JBPx2w5KhyWSa8Uej9ssJPDVn0HrI2YC+dYFDUcNwlOWzPIQMubKNP4ltk5lHJ+h9SniK1IftKvK
QgFHXWMWDVB3ahIdfQoh5nPCfhi0iNtaztapN6S9LbXXf2JB+1Xw3zrz8SHFJX7cxws8DBoZil+/
XrhvcGvYQei4HlmmKXeuix9jwoWNfL8tpzTmJirFAz2rnyWOAuUgoZ88FXElOtfOfDoBerXSpil7
g+RFGsHN0TREq5GblnNrT5GaeM873UTimif4sRKQWmv0ehRctHnJY5QHvauiV+7vzyNQOuaDlOoO
KIV7w7hRZCgyvIVye1P11BE4H/JMxD3+IXjUrHWkJBXXejfyrWIR0gCYKnlaMZg9ivAmiPunaApo
vgPGxZurTaNYNC/BQYjYbpwku8Fk/49ljq/q/h5sMc9FsNA/cxluGJkSlp35BfEzLKW/2FfUBa+L
L8rESSvo2ajW/yMiYcHfc2uaP8IuOajpWGa20Y1boTXTeti9CmAY+e4tbj5EgpmZP5HygNnh81jp
yUqsbNwPcc4WP8N/lUZVR1rUd59Lg5Fm+Vx12Wpib488PdXvNGmf4P+zdTToIoqQo3mETxjaYyS5
kZ8J96e30H6gC6gK61/OY5+LUBGibec4jBYNkj7x+AsICWgxR69JiwmmQ7R1NVtV4AsMHbC62pdU
x9AKz6uYvCpgu6tH71vJkp53i3LCaxH0I6avcCjxBFBuTKKGY0CEP5KWvaJQSjZ2pTndW/x6wQy3
6ui5gqCeBkTQY7gvNtnDs3xjEC5fBEee7Id7ez0jO5MERE/+iBycW3ENeYXqIi3ifG/icUf2Qxv+
yDqy47u2DefLd8qaJk1EIePxybwDZlsfqHn3L8Yv5OJ2YB94A+zqwwWJo+852mNiVoKbTMdXInn5
eEJZdCGgyrLr9ONkBgRHwb5m0YYRxGfLds/R9YUvSVnCaLcuYSdpoiJpkAlK+v3+o+aI6pxpIE8b
4z22j5XSrfLXCzMJ5WlZnsRki6bJBqJZMvvWVEETWx+WSeDVa84oFM1IbS+wf8YABdNsQCAijA6Y
zWcLMOCk02MFFHOSESe0/MtgK6ZuPAgRDX5X9WjdITebsSAoIz+cRqVlzTIuJOaicbxyWgfSKxs5
VfCc/DrCeobRDmparbCoU71vc5OQjxuybxriL3COcADBQUm1o+9/J/dJAmpowsuS5VLZJ4e/4wiz
EV7rdUwPtduBai3p/zuuIVPAqSsUBU1HwB1YE75MxCFU0jir2FXd4MDAW5sQa1MDpz+2IcH1k0Xf
G/+ur4qtj1DvaRGMzvIJdX5LiXBUsIlUMYb0D/1xt2WK/92uhgOXi7FwIpv4ieDYMaA0ZCJVY51S
J1q0Ch2/IjSuQ77reAFk2mA0T/lWx2IAtRgeNchE+dDHzgS3ay4/id5hC3RkgFCSSQKh21usq69p
ZNbH8ulvucjRrmGfVjsLNovQ4ze7RrWsZwDrdQltV7zlrklwZXw402iwy6aFeWadNaqJkKF7tTlk
8TsPBOBbvStQ7s5sINGBjrKxmlKv8HN97IHAoN2YwNe9VTQXYgnxMr0vKu/3hHJXMLwtRkTcodb2
QRAhAO2V5JL3TrjRJd+Nvt0XL+K0QhUfQhr12FBPFCGXuVIogQjrMtWHfNAJsceU6gZZ6qlJUlJi
fNQB85XjfLxeCrbgEwlkiS/ASONavNykHieWd6eLC7BMYkA66xGuTp08V8RYOdz121r7luDZ8HdQ
jbVcZMxHVPi0OYITAAH+xmyRfmgTo2+fFzIhoyePRJYhwNWB2TwSxBOuf/Il8/QOc1Bub+4x9D8X
taMZYcblhl4r+s2PT1kHiEvYMVLl/dlVZspjajz5Q6JWHCR49Ta70/CyEsEApJdi+nZHsPSTOzYB
s+EKLe+E8GCkeA0g0jKrcyWVlPlrmM/1BNBh7DJ5Kwf0wPh34c1WbgFK9VrM1yUwclcerHzcm+OR
L+ul7f9C8GRDdNeeDHqG1FtAO+r7bJwbhrfYOpQE8A4Sru5L3Z3+R/OYIU6yLG9COzLEdGm2Xx/U
9vozAKyhhySa/E3llB5YLYYdfXvYCtVoTB+KoqOi2wzKcEeYO0HeI4AB7+YZ12D2Qbtm1fRwUH9P
eNE7qpxCMvwkQkp3X3dObHXYOQqo0kgTYBPYkXZLVIdtfayQAIRfgIcSD8mFpAUZap9Cz5blrLQo
zjcxkUiIwMd7wIDnWKwldZeANqFrjSFLDp7ljUQMEsUkLcSMi1k4duqdJtnmGpBlHQJrbR/aWon1
dYbS75OqpVAo+KpOKviZzlUpMnApY/T1t9v6mRPcaTUZU4/0CVM72uXrIUvwhjHua8I6u5moL3SH
gte21S1wj1oeMFp+bdb1VxoDpKeGj7x7bdyUJh/jjCyghWiJCzN/Sn59Ojmprx8cbmcK05OWzoQ6
OQMAYftZPk0hX67Tk7hLqZE2mbx7K5I0dh4Nj/+x9e7L/dggiG1QLWlP6vG8IllFJmVyGFUBjmpq
Mo+tYt4Smqd+LuJWPrz+o+sxjNIRR7dviz1lxP1CVGfviP4x808FMWmX/8nxzP4ZAvjmfYljucdw
zPop1yYRMfT0I8PAjv+yUeaPoawLYVpKSPzgy3CGPPE0sPMCoppr+WTNckm3BfFdefRpAC2t+SsP
dzebpS0ecekq37t5ztxxxrFS8RfzTH6zjCtW2LCYBHPZztICojFzXHUw1L54wDItq2MCjMQfzb2i
iA0ZWuZ34anwXWyYGL7ft9/p2ZK0ZOmh5K5uL0P4ZWqEvdOSLJbsJoBAodUDQ1pAs7WK72OG5nWd
+xfFPiHqV5HxeXnqKsa6x1KdxHBjIOoZVahCtNnX+TJOprnpiSIXEN5WrFpJo02nktGCdcJEZpj/
VH5xlrHcAR+a0GpIG+JOZ9sSfbrMUJvTqVhZT69I+uiwL1Z1y+XJUufzrZqXxIUlUuMc+QiYgDxW
y1H8U760Q9m+TOf6jARhKb3UoP/SkcLUJO1eAKpA+9ZmOy9MQ4oNoVtrxf6Q2fwTq/g78QikX8XL
gLcPFPfaok9ttlzFz+MOvY8mAGK6kg9e7kiKRqeubqFTk+yh+s66DuxcG93fab2nFv5LR8D6UY7D
KMWV0ekZhWr6ZpO9arYFCDrE1bi4hk3qSh1yeKQYZNKCnHw8iBN4ex0dEysESg/h4aY41OtIj/3b
DlECJV+AZM/mzz0TOMJfup0vARrZaHtBGMTBeSCm0gpyLt5NVhEx/zSqc0lHIZuLHMt2U2wUMpcp
npnws0LoYsESA451KzfjLO0PtD9baRcCgYH60R9qlYA/TbDcRliyIG5GoCvHgfdOFtGD1g6ej35y
cuYcsxq/xmI64OvPQuHmvjFCoN/qKyb2KxDEqI3S7QIOqbkd5INFOhAEDOhOaPvx526SIUBzwuvw
e+j2Oz+LvZjv9rEo+liKr4D1A7DAySQp8I27pjhg5VeajTfU5wMPo1lJY9csz5MPPnaewP/9+0fF
h8fm5Cg0uYfuSXTby5PBhz1LwHpVjQOxip3VQnkOv/M1/aQFkS92bB1zXV9cjGKrZ/lOtrNgBUEF
XJkZcOf4Mbk2SdbKrnmyyXk8EU6bAnPZaKoYvaudvEVQ1Grqep/mH1Pn7tWQptLvSqU/QcQV7bs+
Yd/+Xx0Xhy3mwep82zge3aZXkhyPUkQUN8aPQUl3uiqcFNV7pEwLSIB3ruSNtSTdTEgeUY84qhn5
uu/Bn7yV8GE6BHr6oNh/LDIaN4w2rBGEGl6HhEcmiTK+9A+yaZLDPuE06XJGsJA2+58QkLQub7Dz
T5zNOm99QdwMuuSPhF2PFFMHZ/WSoBK7Ec/cYHp6klbOfpQLmFpdypzCAfapFFzEiYDXHyGIUVsM
d/3OWu30HtNeHRSU0QM/3G+/ub/x6ReAn+Rfg3TcRJC9ehf7JbQcPvCCGUT2wbWwGaj8pLc4wQpk
/MQVTbKLxyNB3jkOS6ZQvq3eOdOeTFCqlNJ4C3vqDseo6jn+neTNU9KPHOfjq5+XzRA+2xxoHhpQ
sw8yzhEsw639jj7HZ/0YYjY97pqS5zomBu2iN8Z/MV2zfcl/WgwERu75C4rde2Hm5VzWjFPfWKfQ
iqR9b315id7nGQzrUNk+j9CDWRa5m1W8nAqCtNlzKn6ApK7Gr84Csq7hqJTGenlKm3vGJPjG2c4u
KESMKdlKCllusMeeupJp0JZBklpfSJSmGTwfEqdk+5yEKbNivGTN0Z3Ux9IqIWSTwjtGlCG6AK1N
FjqSX+EGwSSL3UmENYnOccmSjiU4xyU1qVmPhMYeJWszBevqYJtXsHitGpuhXEYi0lS6nVfrCXg/
VoHCCKNrEyH1PKKYUiwsTQ5txDVV1PwoxlbsktCkBsEbWL1H3nUt8T+nqmU/HkrJt1LB5yG6VghW
YPf5M2FF4dVVo+ito47n3bywzZbFJ9LWKaTgz+gsBxDYQA5+xl/zFWehD4NPTeYPH3musu8+nZ7E
1MX7ZpR64fhZ1q3R8b8we0q5MUY6OiB3VCkWuhNI070ST8T69apez9FtGeN5+dVFk2bdgYaW3KPT
KXmaMpe+9Ev6HtLmorklXuMBt0R5ObEY2qIE5Xt8W/P/x0lOiuiiVWgVWGCiAKRhobpB3eLpyW6n
cu10KyJ+T3g1WDOp13c7Ai9wCfnJ3Qadqc9xK46M9pIxDLB86ci3j1wtMgoxEp1XFe2v2UaQJzo3
qRtmarFBKKVjIcrK2APmAagaNLR1aeBaqwp6Ixvz4ygiE/f5sRhKfJYz1p2JCgI/9tIwlMo3xJ7G
mFQ6yB4semipn3Aw9lnsdTYLnL29dKlYafGhQqoK35JxE/bGjQ23UJpMIZOvHS/6d6ay5rKT3DBu
ouLy6fIgeUWouKMGqXi/B/ZCfLV+c5nfaUHA3sUFsv9Itu+MMsvMIkMW9B/DD6xkRop1nNqLlWV9
L1d29kaA0083EK1kHvNwHJ5bXlX+s5BMCgw3DqQD3IADQYPYlqXcv7fY6CBIHuO8Dlg1Tc2diYmV
btkIoDZa9aZ+u15l+JdRgmb7XwL9dzUOXxhGbL2eQzbtYLPKaSeFQItRXLMVJRDEtESeXgcg8JEc
TuGd+08QwiqoVKYKV88x4jjUS4XxKFL90KHIfRpBFklWi/N8OtPapbRKZ4AQiuRcFLIE49KIMEI2
4us2uefW5xttx9AzQSNp2bVYSRx4ocPbHRXdCvYHQEUQhxWdPol8wFcXdarHT3r5VygxVUtI0kbb
TaxXtb1XteB178NtfbiMjUErCVm2+zlHFQmCLk1HATEaPJfsf2AE+1TkZy969/VVEFOxYakfd2eN
HngXVhUtJIAyXkUHCdMIfe1zFWX4mcEhpKb1FXjVDdsyaTKBFIHlT4yW4u0fIRiyWkhOBEEBjLcy
hiKT2HG3YNKOv0hxlslx54OwDtB2Zj1QY7QMd8SJGZyOpCqdZvXM86rIKVr6aSo/PgIXQQMQC+D3
lxvWuYRqq3hOs/o86PnlgbM3yHDR8oYXLNNRSOYqKQjoefXZw5yCRgHLpBlvBulJZwP1OQV0F5Pt
uOZ8mptZKznDKXalm99a7vQnEcDchs9wtTf/3s+XX78OeSREtHSdnthuiE7H9hwW6c6EgNNL72Ir
Rstp2c2chnpz60gdvBp60AI2KPdKHU24ZqJOxChrN9ueslmXBVNekRKrUVzbGy3n6lW2i6ui4t4D
hMCRaCx4ehe+G1sHiHzBk0o+oulvw5phff4ZHTHYknWpkBW5fP6LldFIzfQsJBwdt5xwPBVT5aAl
UfoLPPjkV3vqpGwtNgrztsJURtpc9SSWnwbQMtPnjlS3v9nYfvoQxtdCJCPcM75NFkDozX679LRx
mUPqEa6GZyRgMT3+9xKmtjSKZXk0iqesYfucy5tXk2peFLIVIUVYtLafOjjSMv+pV9UNvykTiBG0
6LAv/Vo7pJmi2sh8H54bjK19rlSZjF5AtueV9ftZakSWRYk8pXNP/rsKfjK85OtefQW+133OwJ6b
8+ebxYFw5n/UxmdMXWjsQu8n9+wZ7PxEX28RyjVuiwqWYQQqwWsq7/hwoaCCbiCkIMYIwWnuMScX
7yJJHCU4xLl0I8jY5QRyEIx5b4Inh7dz42f720+A7ODqYiCNd8H6kIltpgYwoUjrJUldDQKR4P6V
0g6HKJI7+05Lw8dGRxUStXYqq/aCWgAZEZwR36kpzkZhIgnwKi8R+dD1g8ZqoMsA8nh89nW2EcO+
ethrdzl6FhVtBLPHg5BITG31gojwQPS9NqlXS84I1VN5eno5/7iDU5G7Q7TqppCBEOUyjMdqXHi1
SGDI7ERpk2iEOGjeYXC5a0ABoLYY6uijuB1EyKAevThZ1QfuMDNUaVj2wspmC+s/Sckut2MxlfkL
ae73NHItvRjqIfSX/fKVCZiss5zh7QkckIQr4QbYtAuTDWXPxQSAZoMNwDz0T3s3uS2nvXep0NnI
unocR9/6Zwyzk0iuMHXePCVK3vVZYusbztmvo3IUqrbYQ3bwLb0dw+K0da4VKj54KhKVNN5yJDnI
HzDjRZzYmGlG0kubqKCciYC08DvB0nAQvW7OwJt2x8r5GIMXj5Zb3Gf7+Yf/lbyfWVn0lvhoazg+
r7Kuy0o9Goe0BH9R05h3hXCQ1JeV7ESsHW9x2UalPnXg3DHZKK1MNlhOEdyPLPUjVD5GCThxp3C2
BbIziB6s67OJ/M5/1xPgHaLzPwjsShEUQevzlifHlctC3yjnEYBcz8oMxQE4QN8xdL9Nb9unQhZg
TwJZIyzbycRXwdk8a6luZtiXIv2CmbCXkucNhWtoRae+O8qC+IbjgeIyBnOXEguSGojyb2fwr/3y
PjfdiJ2QiB4ONQaITGsDKaeB17Sn4Xu/U+aH3PLyvO4pTUNMFv6FKMDzwp8vDboV9iXwgUc9jS9N
wDrHUbb/pefVLGw4bGTO048kAJldqrrifbYIO/cUfeJ0ttJIedyTyNA10keeYxzJILb22VkfChAp
V3b4F+fsWD2jY9xt7Peux0VqKN/1sYUHFdcdkSo7US85GVe8MH9YN4GymaX7EKRZpM57IP1hszsz
J4R9OtZ2/1IU4S7P9Ls2/le0VnSYo92JkL27D6p9z+hd+gQh01cc5E7eOwxOdLtS0GrKnrDihqiF
xDLfndMM+tKx+ZxOKoG1sf6dUkWbAq2xgrkAqPi3kSlgO7pI6e1l8/dNvoVEXASI2plW45GLs1Jn
TjUAbLi5MnxSMHOQFuHBd6mWuODdr0cKpi6IGouFl5ThFyB8oxiW8LxNB3eq78BBXEDKm1pUBmBO
X/kYOtQ0mMPB3bJ9Iu0CqXz7+ohIGBKnYVsk1iVV9oNqbTkNQ0yogeR8QvKm9fY9JHuXqd/3vR+M
+mEb3/je/+l0jGkqnO2dc8weGY2FyFRQQGyzdJMDN9SyKUtdMK/84CmSgnlkC2qgBISCwjsK8mBe
ov+gQG9/M2zGD8TCrXywd2Oh0WrOjcdcxMSwNCsycO2janolIp/tRQ5DO4vcBoi7WuVjY3zBL3Vy
Wuodl1INASenskb8MsWRuAYnbfWVsZuqAFY3a/v6v5I97bvNeYswj9jlbI4yTc5T2h4y1I4u+FWI
4tPztz00PdI8MaddjxyVvSA2t0HfwUoZ57ak6CRpXft4Q8CsIiP7D1rbNllPqgGDWB9UeJNchs7u
+PB1cOKB7aVGpw8OhetLJJ6yhAfwRzjtAd0WzLfjMlCeIyVY/SyZTvEVTSU+DL047dgFCLVn0STb
DB0xniONACsS5x42kipXRwFlxDFS14MmbMXV565zgyln/jaP9EZaFP+8Xj7KQcBvgM5YhLxiTxFS
PPtx/zIau54B1fZyIP0NYGnY1/Yv0ewDnsX6gNNrMteYp2SEpKGCgvZHeUHZW46de+rA/Fd0c3Nn
034c/7LXRTGS5aE3DhsKWMecVueDTm4oJVwKrfmI+yPT4WlqK1YvkVe5ljNFVdiAunSoutPK6gJE
HbltLBbDdwrWRgFJN3VDgYd1W/93OjvsAz1+12rxH0EAdTs4/RNpZwJOwPzp4KLDlXciVv/biZDT
tErAvNmdwTyVrPrN+fb8vWIac1cMMGKeRkmOJ9hCsq7C5KEi3UdEH1IxGgRUzbj0Z9+11Jo56hKS
kJYlUSRZYza6CsLI+3CsZCp0uYzmBXdmQE1vsZEpL6YSDeHBbpBJ5XTWfgQt3tutPivnfOgBtA4K
l3BElfP+j0FIENof76dx0yggRXXGjtUylx1veZynIYnCQvc35VP/Gz6i8FnXvJW1qFfczFLnzRuG
8zbAe3O3RRV/zFiqu9OlrfoFq/q0BK+HlTlx3Kii8aiszwi/7bT4zzSJAPtZmBgBWVkputcSYwUu
z4NzJJ7xQoTt5JYfmK/jjtBB4PxmmxX5+MplfCjJjCsexBIvgqbnvPQw9F08NSkKIox4yudgJTu5
thorqqbdCrsSQtAmXY6NUFDOVZXBwZK4KYwHEDoYvDFulH4zECfpLAS6RmJggLUM5D3nsAmUYl0m
bUNnXUjTaShW4bPBvpJoVOchGx8AsSHAuVEzNUEfd+IRILBbpd7FDNHXuChoxF59wzJw9UCU1jAI
oJSwLSL526nQEA8MKveDMTmv8OLLuH+1fKYBOUiQoNbUqhI3a2kFzM89iSRfRqdf4/u/0xfPw4rY
ur0XZ69FbdeLQyMbJuhSUfNK7fRFtbIO72ofPLWnoYo3YZ0haziRN3SUvLjuF7eLzzg4dQjDPwR7
o6qVnQ0rb1K6SjqOeq1gBTG/YGQH2scAJXTD4NNHDdxUwT9A05GHOAGiDYf8uEl3fkmcosNJ/Ujs
zn5gTJxGjnJN3dpXjR/g1t53UzeHhR+WGd6TiV4Aycs5dDpyOQTW6fDpt5HHQT0kfWgYQ4O+Gbzj
cA2bC5bNBmyrlJpLFPKCPUnboTODpNyn6nSW3DylSYU6J1lGoHNWcNXbCsOpNSgB7IXNsRaN1/1F
ZZZa/HFjMdsXJQDMcQSWv5IEgK2BdjND8UZpa/iy9OfN6iwgRSUMCF3/yK3Ztwl4Zy74tNKO0xdo
VYBTfKGNFKJfXT/2vTKhoRk/IQtOq63FI89d4kTEZ7XoFO3eiLQzcwOeVUi6LLZb+K98JUapimdr
GsqyV4fILJv2hCJUWeaL/ej6cd0lP02BqVSY7rh+U9z9gdSGPPZrLYDfs0nEe32cPPBbnD9XHzyN
Qb9+HZzy3GWkOftpD0EoPfkbSIj0ElOP0h3lybkNFylGwwsa5Vbv1Bm7U+BRJuYduAK2TwrJndIg
i7ZBfEr0Mhpfzt5EC8hHmYlkRHZ/MuMqAgE2TasWIQ6hl12eQS3H5D3S6X2wPm/6jp3gPy6rDIQj
j0GaGf3Pu/2l2g1vkkBafVcAFqz8rjk+mIzdjGb7wEKT8xyBuTUUpJYvt76oucOkU8CC0bQhtkwS
OQ1ri3Mzqi4dka+2dU8fkhwI2kpghidjTVmw2UAblozkuH38QLF+sibg3gwgOhusj7t2R6djEm4b
YHDy0+GhqiJiBYJYiUdWn7KPD83F7gQ/il+uxN+Tx2LSEmuVVG6gdcDWHwfRqkiyA5NNhw9FBPml
KZHGbMJ65Hpjpoh6f06ABTasID6jd3PgQdR+OXX5xJsWIsoe5UDLqrCdmaD3MBhsx5lfLdKY4cJQ
SCRgxP+Hfz38rcvdwFrt4niQXPlBEiF+EF51UYuHQQmjkRgYI79b0TSXlrYVHDYwEyqM2VwAGti8
MgmKsHIz9X6Gmpe1mnbbF6lcCJ9LHryRJgzxvVWR/zZ5oIr30YUEk6BCNQnepMRtsoDL+zr2Cs3+
0dEuUKff2+WEld+h8uh0ReS5nnF1K/O1HIe+GW92GPbnj/k1aHmeFQzqtt/SDfO+qxlNQc0MCxg+
AVG8XF33IAMCTpot4z9U3T5BrQZIxm9Ne5Aa0RQTL5rkmSS1QxkzyfWJI0BwAoA8kqz+YZEIErkV
CuknjYoLL9RQQxiaOh9o4PsZLmR40aGZpGBv9kj1jBh+0eak3ZpeArwfd06Pr/vrDiGsu/9fC8X5
60JxvFg5R2uXH/pN/AgdA6y3E+2CiQRqdCQbMb0Ez0FYW/lOuUw4+pnQrVtLKycCPdPMYHMC/WK0
ZCVP3hhuFmoki/vUpqWk1BbcI1dTtp1aqXcCeT3JcLmQleDADVmn9HOIF86wvAVqrVIJJo04Toz0
5zXBWJpM6sIE74taQHkm5jn0ycX7pDTTP4NswDCgAGgD5+v7QyzNZ4LCPvon9TR6i2AiIAFB3XVX
UmhGu0Za5QzfGqFcsA7lSkulx9Xi+O/xwYnfrhecJrNtb+uYo8kb4HSpMyL45r20hWCE/9uUCWEO
BHJC8x9l6XsHB+PYN2PrfHxeWTx1IB2PI5fIX6hJz1tUkytcHudhdUnLqPLG4aOGg8tiXkDD3SrS
LHAxktpE3gCCksOZ//Yai1uQ4wuBOs7W8bxeviqHsJKBgopbNchIujLJF11zQirqYz5CHFufD5NS
1AHjmdd9g4/s/63Vsjo0qFrRuxuApnh/CHtMYsJEhZevBt6QJbQOj6/IQeNhGDURVAJAVs97k5ai
AEA0H+jLwE69ORaQ+GS5Gca/k53ZphEth8Nmoohk4CMsbF3oLBjxadiuU+4i58H58ElHN4fQ0XRm
LfFap8xvy1OxoHs0pQMWH7M5Dipw2X0iqsKKYqL+BzXvyDoZsEoQbdwhXBpBfnLcRBjzo+0gwvgl
Nf1RjSUAsSiu1cCXEvBSpzHcYT0bwDFxM015CakB5f+GFOrDAyRjKOO4qS4tVOsInvX7MEq1oo7b
34Wx8M4LmmQl5/U2TMuWWPYXSiBad5nvEp9qU0+aDV2W4GgjS7bUlwosw9OrmoSkuaRxtRlG3QCE
ElgjPYwqqtrWxn6DutvtQE1yiLHMesvuPLFDXt6jqoOE7PmRaOOSXU/sFcNtqDXK27PMOcL/hjC7
o1I70nmBumae86Y77py1sLzvoy0wv6YXyxtl/q4cW85Cmcyum+pcxbKKsQW6ey17kfOvXq5+N1n1
3ggVSSOQcYsJCkkSkSRt+da9SeiwI5NO3tt2Q0FWthLhiZ8fIOKB4AfWTr0rAVNlrM+zMNyz+lqq
mJF/uQHjWiQUzVaiH/xovA5WonvDUProuA0XPXW4MmAA31vDOCDEMTcYMEL6Ph8DpS6Eb/obh6om
hGG5p6U7aTmOLfMowqKDeR6mhdaCcGtPw/f2NQRsF/iyNZRWxEhUCdVFgbOmurRq+lV8NKne1DbO
YeFZZ1pt+hAWDdAmInRv6o9bg+5z6csAkyp/lTj3/3dFCmXyqCd5/dUxdyXBDe2LjcAVxtFxBLln
i7aFjgUxXkFLqVvO3+VnsdxhD33AS4E4ICOJyVidR2tR4r/TlazcmDcn0omSHCkqtmf8uymHUIkU
Opza5fVGmTwFtVb3XcLz30jRMs4E7imYwOej6cWzbDPpiHi5RDYRb1cbSmEHzf2UhEamNR7s7YyQ
p7h+I9HiFZ6kYAU9e1/Ae+sf6NMAFq5OW13sM6B9ip1iorTbHcHHoHvGdUIHvTZkkKcqvI/EVaYS
SIwANK4OzzZOk22/MYz+BfeR0QS003dcDK91EBo0oGIzAkdkiC26Um7VKsv/e6C8dZVzePMG66Pf
iCp4iLu2fjFuJ9S+14nyaMlVifws7TMwwTMism91Uy5ObRhpOZ8XV8LKQXjTjeoABZ6a1wllyhiR
yn/F9U9EzDfoXpbRC8pQ/yR356yfFn4nO6gaORkoziNDUA9kFb5nRdaFUMXA1hAxQnkpVQDTqS5A
g3n9yCHmHmAtvT8SX/b/NXk3WiNkklvi5CV9+Mv/dcSmPTU/zapClQ7eZAxljAOPscXjqa9TME2w
VJfzZtG46PBTR8ss0qvwPe1dh/nnJQ6RIYV5vGm/ivVoaeBrPNHlhfPKicbuGtwNKsZdnH6rj7ss
c/Hsf4tlUblu08oTeY89rgUKQz51m3YUX1W/IFzHjqes0NjXPGZtTp6K/54zLm41TQADxRndZxLK
jAGptcx2mYoQIchsHkJ9/9aXr9GL5hXVTweUjaZ9os77OXRESNQfh6jXVUnH0/EJqkWjXgOoFF6/
jMPzpIK7s3Fy9jguuEASK6eJmRafUzsleo8VHcg+bS/Ai1rXA6Zzu02Ok3L5bxb1M1XEehc8bJH0
E0Ot21yrcl62+ol7p+4pOeCaIUMQnsXo1jQabUOPF4w+BWtBO8kqqcSQTYefdULAshQst+5ex7xg
aU1nTwt4cnmc+4yGxqVLNqE1cj7UkHRQPLnb4OTH5V+IQEMtHLOaa3ao3NRfQ0N8Kh/jYhPWY5Gs
IMhNxGFoQwrflNqKxlMaSAmNNlDOYVWf2birUjimgShS7p+qBrrszBSDKTz5ifRFGDlkxYf0YV4D
j1aHHTceCqOMniULy+/rM7RbpaB61dZorv5s5kGIz39OzTG0bIpkzwM5mUG85xYbIJ97ce3ecAzP
YHo6oYutvqXVM61EcgLBp/LaH4LVxVnZGAzt/huZbrd9Z27S5Bg7prZ/7UtWVjQDk+1ZwIgfOmNB
PG3+aA08UYv9kAmylHGoqhhL74MfN9scEPRh0iMsEzIexbvLObzHBvrwbmVF6UbYym25N2MfR1Yd
hlt8vhJdVYquLCB8dGtAQs6w3aS3j87uRViZjF/0zx90VHpK5n5ET+V2Wzk0Kv4GhRsuXIcRKK2a
1zVLY0caZWXUsoiO7m4/103zgPgEZif3eYlk1n8JqdAwEu/fm6iZDwktZFoMFBk1UiNZ5o0ycUMd
67DcKDPqirTjkeFaSR5hkaULzRNebxow/tmA1cJRONVV3/gkTgD1a9tmTzyfAeXP2LYSMbxStBet
ubx2Ja8Y5E/PlMdjJB1QSuv7a7cOaEWl6XzwBY1IQxJxv5entUWFakUsgh2h8Qzjg1R60d98UMWA
0Z2Uj6ISB3iSE793ytrdCenVC5gThTK/0fw+XjW3tIFQM+lGMPCNcGcGN2rJ5RfaN1exnSKC7Xxe
F6uxsDUxwa4dFb5/WL7yHfG+z2mFnkp/FQ96r5B/7NR7QMrYRrKwl5koidxY9CZKdIh0NSddlIcF
xqL5YDV3/2ahsfXq4OFvbzoFM83CnB2c4J2wrraT9d+MiqtFLDHHxHvlFt29Ajsb8tqFMu5EXT6h
Aq/9KglueMG7pXBqvs1fCVTR3eAn3Bfq7Vwo4BgRHKiEgFWcBWsPVKluHe171UAGUrS5Wpcrs6ed
Sss0HMuGfLbyOKnLvkSTLZdq2KAUsR28u79E0QH4Z0e/F8vRKVmD8PXKpAWxhBMBC2/4IyapMXrC
SBgmaYlwT8JZzAEunjXL2K0lXVKIaXrzUeMbPG12mTJi6Ez7PCMdGUumeb3XN71m23hGGemTTZ3b
lJFTY16BMoKWxFyOazzNqWnTWHwYmH/UGLb2p3HOSNm8xsC4s5gNGeKgPLyYBcjWahW36OOMkImA
oDe+b5t+fGjURwbwfhbYm3krsxT9cTKlDmNHBD4GGAP48m5PTnhL1YhX6q8PAOu2mhiAb61QGfA9
X9aOraBatnuCSGxlAEyRQK4Rb2cRf3gmKWKm5scItZQWKTA1l3OySWysUsfpACrz7/0SiUdBuHyv
pWBoRPNoDhO4Wh4mEmLpydo7UftGqAJDfYsUg7B0SPPqRzWa2pvrxipicG5MSRy/kr30mATX4Qrj
qxGB/LJwSLERA8Wuz2OzBQ9IQpUhJ88PIocFRj4kSBby8dDFcMJfr7bCxB6VIosqaPBa/hkD7v9J
Qo+qUL2h16wwkfW/DHFKT9vIw/t3S+ZVdhs1FM1Mrl+SknUqQR9ZuVqcnJKK7zDh1nBUXXvcdeRW
k3Yp2lAsUgEyTN0jKsiM6bPsGqUe/yCKpPam6zCd5NLxhZ2zuoLjlLS8NS7acre/FiwSAeksHHy5
pSTsCIFmMD8CQz2eBds1abr0fyfp7X2L04jKfPqWMCjhgNFNhHUtS7IYIFdzu123UEBvdIrOQUAg
QDt0Y7LC8AtiRVL4N50/8TFj97zWtVw2gieoymjCh8SZFPO3a28OneDKkVwyxgRe5XF0gcIcWISk
vD1wuS7AjDZOCMABcB66uEwrgR0FyywrycI3jUSQPDPCGlKLTG8WLQ3FzNHi40rRUzLdwe1SmAHM
qCPxZ7EBE0gtQezDCVIZ0EHc3j6rjkpT/okoHxbGJcRSe9gRBxZ2tnAJM0F5r1BeK6s4p1sPKNRO
euoKmNy3v1MPKFDyFT7yA6pGxGMVulO+y6G4/FN5qKPoHwUDGg898BEwWcttHBIpIDqtZNS7kAwR
2et/1GsumPJNSOw6J9uvKJJ2eXTZHhcyYIXZSAf+NdzGW8d8LiSWo8HXma9phW/z3LI7jWPjSpkd
MWQepNfRrNaJr/sDd2tCcuaCWRs8rp9HnrSWIYb+tneaHBnZioNrdg/KDd6sVgq2Lw/UVH443GSn
4gwt3i6cmhdsHmoV9anor0Oq3ZiX06L9KsN0gsOZ9KjoOh9vemk9Wvvl6VvKZSJVZBZUEsEUY17v
eeH0pnlhYpdTxOBTrfj69zvnAoXkiaeLgX1V9DiTtfVujT0q5f3dVLCfUQGmgPL8qO6Ynl1rjquB
u7mHm6yk4lBMRcw/cVclKl2FyPlpYQ+VxQYuJFQKhaCz5mXjXV4CB/xLBVq9Pj7HYgXntDgMXFpO
j5hdMIb3kLaK1R0ai6qED4uaJyvDPvgitFaR+40yyItXJs5ZRFmdJ05fFxBh5GBwwhWbqnkO53xq
6GJUjQ/zx73cEJbok8jh4eoF/x5fuxMKrxhrMUUiMMqAKCsj/KwYf6gMdjdI59OEppxXzF6Kesyy
PQU57bAMnpPsbJVw9nOcUXFo8N7J/SEtxwhEJvHSRqDN1eCi/QX0L7uy/HJeBrO1K13vAcVqIdNk
t+xQg80AQZn8QG4sP/x++GtK8S7KleP2hGAUEUPAWSzb2kQPtSCQ/4vpyI62CPW1jn2YGEQBUqjE
3Ky7lV+rqJVxbpNk6uggBKerlWO5ETJx3LW/zMi7/zy8lyFFOEEPGd9iNC1UOx4KUs4RpID92nyB
g2VMR2SCQfXBKehvPEZ/WSP09a6OgMrTLiu77EpeyNRRQRbpkOZC9YHT2C1xMnJIBwFsAWb2T8KR
kGcG976zx8pNymfRzM6VLasF+j3iodp66Heq16oXQJJWJOgpaH8DBMSS9+bYYVD/dxDifaXGLTtC
o/jeOcLls9Oe4rpjFbzfKvyZrh/eh+aUCwCUWDC9zG1R1hj+k/VAWBX/NsV0qDkB4bfOVi9/CoRn
G38JPc28ucfN/kj8pZtYl0pTbyG6nD7A0csuCDgTtwpv1OjiBv5lW3yHi5VKftyZ5yQ544qf/XEK
grqy0rzX7IFYhvhKdPmcYvGd3YE0SkRDL9J5dveZhA2pvpneop/ntAECC4NqPqykrdaRWcCUcdXq
SpYx/BXx4gPNBL2vqXHfcCJ9tjahEpFxCuw3ixSA3Xaqr9k+jqXFuNEUC0aGTaX6cVS+4qaKjIKG
Znq5tSlnaTlm6+k3G8YO4KcqRK29ZL8xHVgDivWgdEOaocCbD6QNFKOdzzYazwrPVoEGYIG0o9ga
sWLaaI+jAe3XZqYkV+0duBJfDUbiF2dBEO1InJG54DxK8dVSATMfwWufHG3irvUZkLoV2A8odnYH
7A2eBzpaw4gdSoWv5zb3B2NYzjs1uZkDLNN3WxrvvrNaPJqPqLBuJmUHXgF+JoHNalle0R+U7WP5
X7dFFP/trFuyHX3N8G0v8Ve28XU604i/9JTS4OWoU0xjpwwkJcILDiAFDdDys1yFSe/XNEBSv952
WUCHuX1g6CMu8G3ZoZ1SAdfiuWvLI+sN1TX4+NCjrDTvBeSGbcAayGSfWvjsO1wXnv66qfkL2jUN
SAIMGP1GE6BsCW0Z4d49ZS8ii+R+bGJMmhmjx+QpGScrOr7JVTAnk0RG4vFKEZZUtuZccIrHeRiz
2PRO1Flph5+swcemEM60nqHz0ySZN/O2yxpPGRL9DAVOWA23frmHzltluLdpecSJQPrgVa+1AwFz
2rXnSxLFCvv3GIxU4gTGHXY71QB6SSvDNFrvRhh6L7+sEItySGvXUrOTZfQsVXYilTfSTBxw5/HP
9/a3NCOea4DesufpcvQnMIW7IteY1M+n9TBlqss2knDmmVQT/5mm2SJA5ZFNGRoB1KUuUK00CEuZ
2nvtFA6FLEPBBgrtZw65TfRgXE0bFF08+Rl32PHFU+W/sPI7QbHJYWLNjhK7wTIb1Dmn152edxMb
lCdG+bSItfJajnG/cVxcgmNiyT1zN2drDoJK1ZJqbKKns0aJ5InoumzZm0Gc7qvSc3g4TMasFaL9
xvF8Ird8L9wmA1NqNDRde867bCbeHTrSm5G6Uv5dl9bfF8PpdwvZiXZBACZTsmTj5qvgh0/A8TsL
F5LLhok99VVCLtRSG5MFqhNQWI3UkRpUGA3FH5n46O3MbhYcsqpht+nV0S6Lp08C//6Y1+PGVTOY
V7ZIeomGZzrXRafmjdg9NychR/jxMA974qUukvBxYxMnrf644M46QCZlts5yh3j716oMKRfKSQK8
iplqYXtl/9nUmjOi7CiqgaoWpgd0ney90olHIrt8RvXQ5tHxS79HnBoxVQxXF1GPsn5x1VK9ju3D
QCe7ARVRlfvlw+tIEdUqRTfHJXnLfjOj9TmtMZf65HneAZFpC+OA/zhlSpUApuMMQCnYg6Qv7j54
DpNVmiv2MJOFziZ7OWv1BW2gAKzCi7cbDeSpXUrcqpIzWPIg8CnnHWjb7dcibnfxS/TyrcBFiP+i
vU7+LyUDIwfe5+htf3hvlYodzgBhJ9wvjTBGYx6eVKRD/XPnK9TDxY1qXhbgjeQXzBzbBLwVb5Bx
QL/+xUqy2l6A/at+ZhJvojp/04+zUIyzNoByY3KQ71FoH3vnEAC4FMpb1f0PQ890KV91JvyDYSow
bfN6hnt+Gcwao4ZDmAPohhoSCgDc87dZir4R09h0wu2/E5uRXj+oFxn06ClgyERQWArIvv2KK1HB
Up1Eh13IwIOTitVKUPx0V/QXAad57udZwtM26O76TvlhTvUxAwZzxtkzM455hZtV8PVAmvIrU8V4
o92PDVwFoWkNa7ujBSoDiaHo10WEeJYs+CElVH3gFEMI0j1RX/Hitod27/WF+1/uDiwWl4fs0paK
RMmp85Z59qdiq8YVInrKJaeVPr+KdZ/sSsAtY8PCUhQJEUr1ylimvUUcqBW+djcGuK0fq/D2KKYs
GHCCNf1D9bjTfuy09TO/+CUUdEBMsGOxiY8c0Hbs5oTwOC2AyBruAcNmwn43f0OrB+9H/Ixd7wPr
LQhuhcSsrwSa46JSNCUhP9ArLrnBCABqn54LdRwJ9ouR+3J4OFPuHbGi7ce6NccBUHjuFd/Rchcz
gnMS+BZcg1ElThxKnhzjYZ4tK3C2B9q213pxwVLmqMWhYp03NJpehaWGeJAZVk+FU4bPAwXi3rTG
msDhWh5Pbm9tQ+tm96OlpMaa8bUeS/mHEnchC78+Ft0a8CSkdM/EDrXyl+qOzp5QY5mQJ+3VjfG1
HQqXVJAVHTIXeKYC2lku/ZrnzDl2Gf1g2BmvLCcToHVl4Gww+Ua5PTviSn03hMp0GikALgC/188t
CZUUnu1ycVPqbkQuwGA479AXlY0w7iiH/baKm0bNWj9GoBuXGB4nniLNMt+RFqxpXHcECS1CxlP0
WJKJiTGLaCC5YvthugQy7pX1A2KfQQTh+W1IRSwXtUaaKtsl5yhv+/1H5+RCh5L5V54kWrUm+V8/
xhBOx8ZTO7bz+5tZhfOnXWbHidCiDSq/4m9hnJ2HHP4kFwobvTgEhqJ132BloGaaFgal5gb8XB2r
JTfCN+9llj9x3tVrLS+V/WI3skN7KJKqxRG0nbp6rMVRVVdN7KhltsFVSyy/tGOXUU2vWc6ITeBY
dUHLDtX6SjG98QwP72+WBD8/kVSxJsZQuhgOeMgx1son2PuxDe+KgHANlWMuvcjICVgx5tpsG4rC
6/KseMRImuZYM4mTfSRR3IHr1JEZevx7hj7SNcjIGqeYWt806vQ3nzjTxEYcxozz5QR6567k7dL7
+Bj1yKvtNI73AQlX4GeQmARWWC75Mkqp444d5+AgJOZ75mpRzn0amYv7+sDbd3gPanVQHlzbgYgn
YMIIhlMKmAb/GbzV8DmzATVcXRnfQ2j+qyoWPaOkYyAJT9m19dnkIOBX1T15AZUDQ9MQkEeLUNoB
gyr4FQHLVAkzYo5qdQlLWyQttdH3iU5/oikUqGXVrmJOc3qvHYO5XnN4yGFDLnHVthXbDgsIiu9E
1fzRU6YptVox9658pVe5RtoGtbZFHiNSttuTKBiVyXeLNS6ilUuljtt6fXmoqsroZTjWrxDr4kzC
zoMnk8NtVVzC0oeoZOiYhWgY7X/b+ULLSyWRQyaBDhQE/MM4OE/VDaG37J2WXQoYuc4SlWfPSWPo
fKszSGC/eY8+mxww73BpZSaIR0anmcRfYIfN16GgxkA5ERVkEL1xsQ70nvLTRHi30RKpZhNuI3HW
sTC4fMHD+L6GP7UpL3IZx+Gj1VgNMGel+30C15NTcbFRWji697UOkA+MdZ9ZKo90OJic1xHjbjut
4WTK4ItS6JPUE5TLIZrz81R9vDbqo9i409BO0TgjxTvrqqHIQCLZQZ4P8ZUmz2dnT8XhGcQ52Lux
gTNgNxYeHc4uGqODWtQSBxYuZNs2K2W4RY4Y3zucvZZHgb6HCrwoHmR7J8ZfpBEijvS08CmLHXJT
YfBY1KZY2/sJZpdu7j+aQIBfdclpCVkbAceeg7wbKIWnOyOoxfGE/vkpq6zxMtHf+uNO9bUpHAXl
iz4bS5tNczmZeoP9tB+gjJD9/2QlsMMZVKhvSwwmO0jnfV2WQZZwNT1FduXpQBWqwuTpGcMXMSi3
rojc6UBSZUGhz8VYXGaG6bNpmr6MbCjKGMNoUU/JJSCw+7ulZcQwxsmuLPyxSssUBJbhmRqGbpI5
W322TsXUk3tb9+baFqw5qPnPgF6an+J4fTXzPJNzYhTjDbg+i8+rmX6Foqsr/SBcgWRYbNQIUbcA
gLHfH96or8UlYv3KvJGfW5ZBdVfBuzeCcNJyfnwVk2IC7JQix3cnTi0qTjR1NC+Tnr6nmC9V7hOL
PQtjxMeRaYKYtIW0OEK9IAPmkCvSh7on78o9NrpqiQVLtCBwWsOFxPn7K44IXbEyw3pgMPoeHzFQ
fESMa3ShTv/UHpjCcw7cqocURJ3uyHo704K/s8qRk8a68j8GFst/BiWMIXF6EkZrNRGgGdMjDeho
1bplg431SdMhgTzA1+Z/a/ORf61wQHZ5fdmMYwEmj4f/kGvVQ7YtAzS/K3mJQtMQtAHiZl/ythoz
ipUhXwLD3TEGIm1B7xI6frzuTMsdDgkCYnmUYKxT4a2yZApoDV98X3KGTN7OV1FuroGxSAv7KKcu
dXyp/zjnOIXgSFwk9MwWRZflROZcg6XKyoJL5eeUg0z2QIc6pEtbITYhGIaSV54E9jxVY9ThZIgb
ua3ZyzuafmXRAFGBBf//rSj3ItNvnuLaR8s+BlRr+TwvyvClv1vX1r0dH4WQc/HmfGiijmBQNQpK
Ye53s7i6cS2TyYPT3Wp/TJJ/yaylozZDTjOu/eKQ7ckUo3b/ZZio1QI6dGEUWdgRLiS58RvzfXv8
JaFQfMHicg0cGoGpJHaQxi+bj0W/B0EVSZ3rssL8aCDFpljax+vnpEzvYbXF85qb3pufaMkjvsI3
ZC6Dq7NQ02kXwpC5jH3HLa3evg5tBtz5RD+9jos9ju83fx14toLdm6IzCiFyl+h34ruKuVywXBpj
BKGIMgc1xowet0ObGImhlQCb3FtICYyq2u7PGE2QGrM8Vd93lmexcf9nCgjF1G4s0mCkTsEsGg7A
UdjQ8wYRoWBhLuGctDC3Jxkeb4lqXj5CJl7mk961cEUMjusmkqWal09CX91GDLEjg3W0ccv1Xg93
rb4UCve/EiN+mE8vwbtMXKnElw9/RlkNZcusdzAV4ulUAuD4YWT0ftM3x5eKyLtmUo0fdtCcBb0q
9rXyVtTFZWjpbA/55w0LuHirI5xrwHABX8mgsiV+m9TppLaL4QJSRnfJ4VICB7ieTAAvZGkfBrKZ
XY+vo8Bzj2sWUglViHED66s8Vq/9NiIrPO2qI9GxKLLfYfPUEE5YDSPhLl6wUUIONof/plI3ehxG
kOpRjIf3EnGVSp6+Dh2A261J6EmR3LgNUJy8FYmQjL9qbdlcSw/5kNrVF0KUoMOH0n4DLVWdA3Wq
3QeaLXNmfW/PtwsnSFd+L7OAe9EVtnB1SsSrN8WYynrUGx6uHMiGsbi3ZrOL4paOomoWDdBwP/9A
jTdw4g+JC2GcUR4fjg1vQyEG3AmPfPvwzyp/llRkcrlfH0NbMVPIoL+k2FKIYDluAJP1cnSVs9Ke
VLtWQr5AwI4EEjkQ1NnTkTb72f321ISd+ferU9fz5/cm3zqDNweAmIngixlhLtdunAF9PJA77nW0
TKqhIkCS1ZO+IeC6ViMIny9IBzJO89QZ27Mtt+dFH1itGDD67KRv7cpkYAH7yD4pQCato7s6tR+z
FDzsGZ9zU4okOwnESDMEPdb8Zsvr+dBP6+VnUc9eLC/vLBB1lvARXHGKBvnvuMmzw7NEkE3aCs1q
vnEDAe0evp+UhwrP4YeEPJuuR01YaVjhX8r+ON05gVpTvdkvFWxhk1w8ZOHKWLuty43qcJS27BRU
d5yKR5jN3KFx5hfcWnD6mpB+x51XNTA2d7WI/YXo0EMQL70WTXNrJTR7Gc8LABYrT6AtGKpAaf4u
Bgwui82Hm9vJJ/Hf7+Eqm+EK8QxPE1C4c7oea77ITvH5zq7H/HUA74XpY0eWXlgTzyBIK3LOcidB
FkBHsrqoNrdwSoarGJF25IbhY7Mre0kCPWy60T9jblwPrJwxMkWbuJAMHGxJy/Jid1nVDSpbryIH
MJlrG8YOc2b/dt+0mBml0+duDrERmeX2l2WydslinIFNXHP/5QkTEZecHiY4hPNSx0Bxg+9eSOgm
32DDZtPLSKpOa2ybLN65GKdHrLK+wbxKaocW74vnumoqK1icn88BnXcIQkSSh5fOmuU0i2FKl3e8
iYDT5HbjJYhYVJK8JJbXbpiGjqyzB6rTVbpWl+S2k7YMmSOGAqZp5J5A7d89ExAz1eaCFPcIBupD
4H4yWmWk4djWwGVyqtfpOiAUObcZdL2DV1UPnJvNLxvMsNFuMz9qr7DjcgBVzkbn29h+xk5But9v
yGEZySbyzBwPznBe1G6pJWTNe01Joe8S1J/mQzF60n2P3escmmOjiNOIge501MXcql+4JghmF8Xp
4YGX+Gq6c9xt8hWxMhvrqAMNCvGmS2pVCELc4Gw/UvexuV3J8n/iMFoO7ZJCtN9uGMi2WZ0h8i0w
OSZe/lAZQ7Q37DL1nBLJzXZJ51BG+D/JIVroVhA82DIDvs2tvzad9/nHjYcBK4VExJmnk4CXP4QX
ZzNAJZ9Bmd0Oy+qDwVym9768CG+jX9jVXQsspxIQ6fJg9xS7rAQzsY0PxBVNWVOTcqP8kb2XsTMY
9+KIvc4B780xkYLCd4bgQb7SiZBQQ2eFwXGo88XhEHGRIdzgmZbsdWEVJ4KueV5cU93QjTwOvnc7
lX2dm8rsJpNTkI6KyVD3Hgwh52hpC5hxZSylS9pD7vqKOeOOnWqY9Vi3RE/pvGOtAPsBj2XbcTYU
VXvXcZwv2M5iBmrab8FjYbZ7PxVHKYzNgFv5vHrJwMxhHEkSKgRoaJ7sE0iAjxjtdlqvduUnduoO
LbkeXBv++M7u+Z5PZwSvqGUeOUZ7lFSMdPSMwws+RJRtL9KjM33xZANq3+hY9aM3k7MOlRbHSZn4
dFi7tD435TJvRZkcW7JVCNmR+3Pk/1HS2J0DR+JgH4Bgdu/twk7Ebn8zGrXVLjXW+y9nEhr55ts4
Ju41BCBTl2atQ0hzDbjDRTLltzxM8G8LwV/EvGVfkyWfX6BYlr6ccraUlD7R4rcgMPL8wwTCghF/
54ecNetYc/ToipKkOEXFOddUdsoiFz+UAu/AJ5/K+8AhXdxUuQnf/gkz3SWV4vhihQ2wSAnXV/bz
vOPPqb6zK1PkUUdnur0GlJ2hCxxi3HXpy5rsf8stjYW7mg1MgeleBnCwdJzCcX17gsOx6P1/xW3h
mp8rxDD/2j5bLHdh/QE+CQhNEC1ewV+3O5I7CwDK2OtfUh+qAJLgHY9Fh3awUOFzKClWJxpk+JRW
s4km2XO4u4xa7UFh9O58EQdBhk8DB11F6GaNOR5tdzUZrFw+orbSbxSd57WPMH1o2jpmL1wJbwwH
vMRvCRg/HVl+VlZrX8o7mA477CAWykWmArCAUUsrUE3bCg6KeBjVd+qYvUlblTTkiILXfyndJGMW
+SDtmtQ3LuNh+/jF+K72ljdsIlqAhb+KyP4EMUhb0UgzzaI2yPPmV+txq+Ps4Mduy2n+Z4Uu4Gsj
t0Rw4368BzB5EyGTQIRPF3fO4VK3zUXFf3bxX/LVHQKflUXmr7NEIoir3M3N1F1VRx5vbw1W316e
YYlf5yk2xE5oYyw5F9rKw99wcQwqdrLlTuoXhSBJdNYyWn8fIL3vG6q896Tr+IfACRmGdZ671Zvr
ZbKNKOyGPQFiZIqFZdHp2LGApuTUrBUF/wpi9p7jl7eA4bEra/9ldT461fBMLvQPj2CtudN6qBVw
adLC9h4iLAxJW/kl8kmBV2qjvx07aY49YnIu6omQteFiZUS1c37ZrZKjX3RMW+8Oh4ZmcVtK6LJ2
wpPDVJeNZeuzYXhhC1hKxHZJ2+3DJ18O+QQoNh7S8p9i3fjK6Yv2Y0pu6M+Priy7u50P8P7knasa
DxDCuQoQ4Mda1WXs7BdZA+AUP3jXm5N/b+pyAeotvs7vnk0Gt2jXOEikYT2fAxSPNn5NsADRkx07
3AfKQ15ddTLsPtWstRqy1McIRzkMnDQ78kF+Gut3/FNnzJtCsXAoMxeH7+u4wEgNa+oAQmvxszkC
1LGcCRkoke7Dys6VqFnyGumlLCmjfHmCbldv1HzsaxAdE74kti0NefK3QK/usDf7vzUVZ16SVvW/
l8YAtcNa8LHYgQKjyQDTBA9q9d5+jbI3jAUnq+zpEBZXIw0K1JokyVnq1o9jF43llPJit24aZIMV
DuMsEWCpn6yStOurhGHO+2/u0YIHgl3aGKyr2X3Vbl0UIgnjKbapu8bFgKDLq2HHqqmB6W6OMG+E
GsATS6UsUAdotMBjHZkoHXJLRVxpHWN/ZJ/YUDIxCmy4I0TnBboBHB5RFgWJNki37JM8nRuM7tNq
aWrqKtmrG9iQcwqADFLcJMP51l2HVGzfDUENNWzhxGhUIR7hQFDRmnuDw+z//k3xShsjKW7yP4na
WcXroIZ37QulnUSvvdbufIlTrjhlcmTCmHIKByCSXI6Qc5A4e0Na/c5jzpaRn8GMCMTQhMIID41B
PF8UUXq7X778tco7Inlluvs/ux7euB1rrx/btxd9sAIAJlj8M8HXrf5saqr5/j0XBx4zLN/tp++7
GBalnobSEjQw1+r3GCZEc6vfPr73n8/gj9C+iXBou8Z6LZ9XcxO6R7VnRQvtTbCGAAVf7G5/Na3I
6gTRlMTbw9/slEnbqllLKmUiBRU1awt4bTI9/IrsEUeYTGds3V8eR3vcIJd92tcOAkt/nOMjTFCm
9Vizftu2FniI1MK2bGGTxRXe1zovNkjQWvBFLZex54q+v+NvpFQjYDlte98FGYyMkvTFV64xADd5
vZTt4AGLztXDukvqboQmU1vjJunIx3L/f0h9aXuyzHKhz89dB68nJgVxyrOALGiKSizO9fwJqGhc
6fvCPDQj2kt+Lqh1PgZ7SdqyfTbHXBswasFKE56X9+YYTbWy8RdQ04e/ff5C0Ir2+b9C1GCB3Myl
04CbfhsB6XP46jYUGTOr9oUKZPKLuPjsShd2d7xENMiusYYsGTJfkAOCL/o0FXkU5ZJTGPezjhKP
kQl4TbdWkhS9SOUDmD5tMw7DcBhHaB+V/2OgMrAtdUE7a7brv+cPGXTnZcGadN/0T8v7qYhEg98p
3soDA6+di6cz3gDuKsMWxuFJPOghgfp9GeAq5jLIUA5FQVkr5NzJ1S3+f7UcteVGCyUXlbc4kfKq
IorwYzifZ0hjlSyDssarAEqy+ZmD9QSZbehKmVUK4jiVKd73Tagg7N+759Ok7ZwcIyBaRTuzwEFo
ci3xfj2lItyXn4oiCCmBdiXCpVvrVDfB+abw8Pv/bxiJvYct2Qbp+Ah8jaLPNCA3cpDfukqwY44i
0JwVDrwIZM/QrZs5eYL/7d9dquvTiDGEdFu3NplsXi0ktjsjFsrhMH6A5jYZko2az3/8QmRT6/fm
YRActdtvps3bJtFZXIkYwMqP9BCPjgdilTg1DI/FKhNC5v8q3gY5UJweCfkdT28VVpTB7bvOod9h
YDrHHC1sSsvhiAY9R0wSN+26uksZ+8YH8k8mJ+NmBqVWp2oE+RszUOT10GlUcCntpxXAy3CZsnwn
XxDZ91v++EDl8utY8nLbSMl6F0g8OF7Gcp8GHOY9y461qIcglzMdDWV0Z5PFDOQBn3JwleAoOEob
EdaOZEoFV/mHE8EDhe3A+eukhZ/jBzpvyaf+A5Dy+1y3D1OY/PVV0XtfNmQnpw/PmAF1DhX6y6mQ
bKRLCrvuecDbJqRnuhwSGjI5WqyPb8wiYsGoicjVo9CWm9yoddmswRyh/kjZS/sE7q8Rk4MKf83O
wC/SkZVmzdX8mhvlBb8lk/a4W5GFlMYE3hoP2Csl1lW39qOQnwoclMTveaaVmiqPp/c0V679RW4/
a19yQtoQN42J2G5/IYaX6kCGayy5ocBNow6p//ZIeMFh02QeE2l36O88fT5+H8nGTMz5NL92XV5X
a+bvX6miWZcV+FQLfARPxTBkoyfvuEftsH3pbvcwJygQMblyoFnHu8cxJ2hxErTHvDKcx/dC2w3E
p5ETmP8G2T9mqG5pTQreuR1Rap4Srag33yoDbePblP4jQLUwV0pw2lga+E26RZHV2jQTEv5navpk
48Wf4Zi/LDeyVZ4Gun95vVTMb3xcI2gJJ9hk1fTf6L3auix9R/0n87OEFYqHmOGI1nNsVUpbe7r5
urVNxcuteITpwJlh2ZWW3yUAZJPrg5FS67CtgFIwtFZWsH/o4mmUTNjaoJuLHxuvatwm79YrzteH
+E4fVYPZ+bptmer8c+3YBc4+zPSchUq7ygW025H/l179jFnQlkFoBwn4qLIA9LC4zP1bWXMpuKid
pVu/Yl+ry4C4IxxtO1qfjdM0czStf4+kttdpKJxQFxxwdWnYgDXJ0l2cjKbUZgc8r/oJbdxu6IJR
nooHTdbbKBQrQl1qYmg9xHLp+1MXbTguP+q9bk925WPkszptCsrbSqAYh9pvTT0VCd6OooaqvMhR
6BW0eBpGoW4jUtFYjAwZP+mF3FFBzWo7VcsXrwur41UKvTg9oiAepVIgLEyRHe45nLY9cR7l/8AF
HXgueRQXSI0BARGMdOV9yeTozKk+fPpRMJUbCt0Jc+3rqrY3qqU3N6w2uz0XkBmPzUfiVp9W2y/W
VKQJqvxL+/1FdKEPfdSppLvcMfXXZ5jaN2vDBGxKoKeop5XMCOwdCWRpjDNtvJBu55ITYEiSnRfr
Ft0K8x070zTcd7GB16Ce7C6WwBs6+5EGkeUnxxwrdZRZasb/5b/MYdTnQE/kRgEMC/puF+PFMOWl
SYHE96FPxMJghcsAVozfspBpDNnF4y1b/qMgOzwXAyZ6vnVEkv3n++ZEExxmYbAbvXVaSWV1hvjR
WQqmDprH1lj8qY2C55HFw4LpSyotCTHGVuywqzAtNwxn5PvRadMs/hZNEiWvk1Nh65A59AZBN9M9
6H8m2A2lnAuPDkTlO9Wau2ExIFLoqCQByPP0G1XUvHiwe38PVsKPoWYRTZx+RhK9ih4QyP0UkYy5
URsVHCGcSMq4Ssu45rntvAG1G/UiRfq4ENzSs7AbRUSgMk4yqbcNdXZrjIGZTSwYDY6YUmotFNbm
VNDB3mjxlxsXJEk0eBu4K7zkeDyz7m05Y7lDJqrBUCISLjqPWJWBq1c1QC99I6VRQzinPruciaBK
WpetMQj5AxmTIuMJEtnxLqOKlIhrOTkhpU8T3Bp0MUVWSrPSmO/IAfyBQZfIiG4CEbzpFmi0XAcV
gJGRgLwTJzMaUBhOuMEoAMAINy092ZFa8Iw+jkSzxjdyBSxWG5zZpXWM667GOsBm7uN4XHoM/9Zj
o3rR1SD5rmF1szqCRO0ZYpTvoXiNVTYankSjB3BGXtRDvj8VoZhcskrZmfCdJ8LqR59inQVEhmyR
rLL2NnXXvrwjDGlExemvLq3AAfG8YYhziFxlp65XiCNS2pgoIZwABblaLpprmWFjkoWiLp0yKqXK
viQE7fsacX1bU0X9v9JxWH22lNXt3yY5pBAgXBRwL8gIWAGB3aKWHpcLGu99wARpyHmkQ3++R3u/
Zfcxr4wtOmpwGbjAUwhKlqbKA9EpGBSi+kz6G3OmjmGngXcjPbBKH79MnwsvWE3aZ0PreQrNBpgZ
hZPdQXrk1o6SD1x6Q/sEbkfe1gO9YWlLRJSHoERB1r9V32lqPUtdakoKVY9yUP7LX+DyBeGZAysJ
RE4M031ZbvxsM0Y624xyCpvihXeAurZ2agS64wnJUJoOcw3h02hDKSArsuHHgV6CqfAuDN5ZnZ5c
no1sBgUiNpgGdvEPfnx02as4lO2PnH142qoYoA1Q1c6nVqirZBKdx1YThEStqugaBoeTf0TeCrHR
1smoo7o+t0ZE1d2N1R/DWebNWgzL0RgxqiNLl3rvWifrEOPiqJPGmo98T53sstx1+lJknP4/hQ5Q
yDjTUwEDbboe+sFzgckjQU97hoXr5wp0MXXjEZgUb0ASXLkDb2QcNxSwerqB1Thhki/e27itvwc4
ZLIopmLm0z0inGQCSM9GmsHTsyuav4VDyF+sHf0mndg8uh6S8CDtf/y91gUbxxSxvY8Qx3ooGOy4
DgfBSsbhN9oGtuV1lfC2nASbSW2d7Skvm24bEtuFM40aZbyHmDVqBNyi4PWWvtzSkCpOtoKUAnlg
8lFIvkBUTCLTTBfPfp+Nos2+2yRVEnOTQaYxmu7l8gEGWWzTDCKqASa72fsV+tQ23pGRM9XyTDer
bIjFcypR3LgaPXLKTESz+DCRMpCcq0y5TH4PvW+ZxPR1NOLwj7i5ab0d0z0axlYGCi3rLzVGCF+Z
b28CtSljRbDZqQyFAP0CiD+yYiaN11D/07CfCV8TuKQ9bh5G2+CQASq/nVMs/TTM6QsQdrXDo0nO
JEXglBNcXuhWJaHr9t5dRllVYE9+f5kyFa+NBYwEjfWdCCERw+0bSa2IrQ7ZrZNAx/ujaZV0jmIt
O8/MC5/IUvXDLUfzqxiPPgDM4UULoThjv/Jb6SmZ9J02VVwEnNDtGUwE9x/8haQ4/5bhQYkteZh7
1rcoIydYikqGTEh/OjFMV2/GtgMGBOSRiCGWWhlUW1KhDowv5plIxgc8JkHxntvZNdzenTWzVcFm
W0Gt1f2c3MCN8kw5xRo+ftbLOGFlQkdguhhpgS4vNjmuit64/tzkG5lmUfA1rHuJBC9BlSaF1qZ9
ihdS4NURIDzsIGBKNrlQeDeWVHBtCM9K21Scs1uHVHgdUkjeFQC2AdOKVH8rI692D0pFwQZLO+HA
lpsXhAjunPjf4XaeBQ+RnDg6BXWFGGogYrnBWTBP1urOR/tLVqIWS9gj2wBPMqABIdL5Yd98SgPX
5scBTnFkSk3962dJeU2X8aGFJXvomBu0uWiOar6/nYVGgt7Ojmh6w2v7+m9dip04VKG4K/LovF16
5A/xHtaIubvDDLYS4OscRVe5vO8VLi7XaAbNgzN8EQv6Vf2MVxjLQP1e7DUBvV4rbkwjlbrtTCdi
vhnfg+nj7JNY9Jpg3FsZg1UWfzwFHPT4e81ueFYVfaIa2uBBG++QmfXG4qkE/u7GqRWAhy558Poy
ZHhjccdrQ9FGUTBpcsRkpR3xxiVtXZG6Nqjs+4H2UU03rNbghVBEJFEMScHbDj+XwKcwi5wQfTfc
u180lz7Wyf9UqhnXLa6twPZEjxl10Z7yevDIe9fJGK3AVU5TTobvVajGKqJeBoZsTozRlkuytQpK
vGPciPWZ130yOrgO3OWfAV1M0oOvtCQktb7kL66AbdhEhxLTmtC4s7SQBTmhvpXtMM2WWozrV2fB
iOyCChakfy0vWMpBArXzfGE1KgNxBdyCOwD5JS1lnrqr6TXZFqs3LQiZfFS7r/cWESN4+ocKXgmc
PYe4XcYoBsxtZ7RywDzlYLBTcxw1tqeU51dFIPOYBk6v4t4QKrjxFZ6HzBkPktJXsASqF2+CqPZ8
ZsiIrl4Wwd6dskbldt3ZA7fi2C7VmGPjyUHqY0u846GXrZpnnKbfsfjojvQGk04I5xXXDxt8uvhh
NxN6QhfRskhXt07s1fd3/A793aixFqkGfnoP3eV0jHrvzmCvDgjpG8Y8Oh2K+fhsenKHymJbgtVr
WoTJLzbRF2TgH8YZg8LmdDUjKLZ6+CXf+6ld5XrQHeuN92DqvI7LsmGuPMmhaz26w+l0Tp5eab/S
JF8D1thtwBTyvgcH8k1onjOHeLWyXYAH1cSzUgFy1CxLnUJfL/eyZzvIn65nlhz6Rb5hhj8VNNMA
lcq8DXKI/jSEQKo72wHCtez1ikkkIYbnWkjzW+j4PP0YCm+Dbpyvi6MbMHx4K/pmsIZqHE9rjnBo
98cSRS9kfBKRx/o8R3J8enbnWAj2UxZbDfWQrLNQRx2Tdyvog8yc0+01hhwh9tIuO6AO77G1O5LC
q1AXj9DKQlnbUKgVI8sBYXWOzDYXZcrsokh5hKwjaPzfNUxYDntaR5XcbB8tGe0mD+8YHW7ecNSQ
MyAv4t5jqbzj28bQFYepB1jkvnzqtgSOJYssFW5LS/eVAOZwfIFuWX6rzh51ZAUQ8nNMHvQLWIYJ
eiKJWyGCG7b/jdI6TW6Pl1QZ6pgZG0N52WPUgkOVIhyM1CU51Wrz1LjX+Tu2DzQBK+xk1tVfSKBj
wg7pMqTys/atlHfpTeuPxSsh2cUsbe4cPuliLUIQirWcNDpeYVA5H82zGPE8jM7mgImk7aJRsQQs
V7Qi0wMpYflK9vVUUu5HY54wQDKrCl5ErHeS8iBr/rGiWye5Y01CuoHNxOI9pscKmREta/h5ovIj
Pjj+OnA1Z6PxnbIYC3TsjUKc81oMt8WlGYFD4lZKAMKA8VRnTJVjcnz2mR45852mjwSLme4DaAb/
TDBH9mrJ/A1rbja6RlfOAZM0xgN1Ocrb47pFiffFqyh7L2ntlpdyOP2qebqc4C5AwA5/v2sxt/qO
Wx/gji2tipnYQvs0Vdp9++y98jWRu0zv0bZdVdvwXmRJCRKi2r0L9xLmlQ5Xya+DIz/69NNhe1UH
ZK0x+jljq1pAqvLJ3tRjWuQodg4NJ5dQdPF9ipLB32cxV9A/WOZqcjl42aj3SvNKTEkotpLP/yJL
LOq4l9iZWPFfUd9bDzqGN5KQqDeKdaqovFHfnBCiNhgfHf9S/9MS4NnznvAh6BAhGoPjPNSI8ERs
9i023nCLYTKKztpCscwK5Xdc/zc8k1qKjmQtsElNQRRoiSh7X7I5+PUkEJYOwKrXiszmiyiIa3ve
6brkOfk4l2WQ6phTU8LguH1n1AyPXn3Dq6Jz4+5PCRboa9ScH11m6elfba/zPdDXoiOsFK6KXmf6
P04AlOKXZz/Fd5FDPnmOLSKetAIFmpmyEzfEQwTSxWTByBOfS/cFbzmjt71HngusWcpokqAyLDMv
7U73Rql+hoMzSnTqpvdKUrELU8sKWOl26HPF+joWRVfq9ZMC9GipgOkjboG5YAc3ny/ef/+EcQmA
Q0yigy9pminNnYLK6PbdPZ7tffaozypqtjFtjZox8ffbNhFTEkoUZZkeuvVcaZeMQDNfB5cLRNi7
B970OEqOfPUr+8/X30JE7DLARgq68GR9Jw8RcB1MPXcah9CA5r5RWeCLcUneoieMsQL5z1xCATCV
oE9AI/QbSuor9G1hcn9ra/PkSxzdalvrljCFvQSGlAp5FBoEsCbmcXzF+w/lwfXE12ulqV0BKDO4
3QivPDsnh0wVysNtwyzOsXqbryVhb7m5JDOtqD2OgjoJznng9iagxj0KvoyGEsNchd9hqNzpHYGC
lnUxVouM2FuWZavMA8b+xXlXPnF2kZPEvtd+9Jxyr5g7KaXiYI89/ehcoOZK7lKZFAoe2K3xdVUA
zuxW7vRODCPpyFnfCTsPykBfO+DK++dqjpdwanMl9z4PTOqqjpGSVcm2QcPXib8Bgbd8CqNED//c
auTZ938ctDL0bYVBCvdG/8kbFx2fQMn2YqaHBZ5yagRrY4uGZs0BmrfRZ9akHATmXgBOnxVvs69z
GPMzZii+m35vFVHi5rf9HqS8JlijoE7r6oe0sr8yyE3r4I6KjMnwDc0VHmBPKyz8aYpjMQNUwEjq
1lF/9ziW2+BS/pEgQbdkdxbOI83o+n3XJtiH2mQ7CM4pN3bDHzJaEiVBFnd5FYzQOVBfUObI+ykS
T9hS9+p99bJCvYbKXww4fHH3naaiN4jBAcHs+9+XUYAgQDjSkKZUjJfqucwApInCnPF5do6G7TmV
Go4kx4qj2DVwytpbXZpaLq8PXxM3lMuFLPKiwn6hnytbtYOWo5TZSOv7IOEqL7LePDFhG5Ewh6d5
j4bfl3JLQfSCrScq+/gaxzjABZYU1MJAhy0BVSFKC4IGQpjPOolaL09FBo08Eor9nJRniFiX9E0B
SVY12BV2i6EUX5FFhRHwIr9ddI6jl9FFtRUfys1fZdQsmuZtQiYA3jkf98EB2NIBBXWYubKZ/nU9
il56nMOzsQkH+HdWe3WvikUfHtsOKVeenDu0PUhHT+5lQCom9bRXrfPvt6f7lsxnG7clogh7SKqq
lptOllIZLyLAk8CmMnkg30mU5jK7sqOEokKFZ2Cq6k4bQaf3nqFKjJSgvf5SHJi+q2HuelRDzhro
BK2OBxUqw8OHqqtzA4To49QfYyv6Fe0EqCFJ5o92e5r9y9OTGyjxfSP3Zg+GjJl7lTmOdgiipFX7
riZaDPrv5a/sQGp0+By9y00PjA01ayqaL+VwZV8mXCYPxUvQMR8nd+Zw496l3TjtYgGzR4h1VvHO
XSDKRcwB+GbrXXu9y4LxGGSKwpGNITr8IOqCbUPhulTpF7orE+zm+7CRHqj/oZLfhZiOgqcumVE/
dnzFW9jnOk0S5GwgX4EH3s2VwfyR4FnQlz0/fM8zmG3xU9ELyYTiwgf6LpJPmVKbZtRIcy+ZSXRO
WxeQxYB/Y5mC8+CNzE95JCRflu36xGkau5+J2ZKIgTbrM46F4/HC+fNcGdRg8SuwfLOcqqLAY6v1
d6xvKICxt/l5EosjpAjXSyoXY7gTXElnSr8ZKyxZnXUZaIov8/9TfADPgdeK9cw1QWZv5MGn+F7A
b1YMqqygvN2WjGlGUkZ/aD6ZOKLHrZHB2SpNgm4XD1YsmzH3yM//OGqws+dkpeYV4Dj8t/4Btrrw
2AJBdudXlR/XQUjDssK1mtLapTdcggFaQjDE94SHJ8Ti7FM0TmJfZloOQ+HYTMcwZPnvIqCddfiw
wd3rtAgQg9i/XeVpSmgLP/0bwlqKf5Hsfo+j9Oi16BUnPxolyL1gJvAlzL/Z97m+1fkXoT3uU/1W
o461WfMLrgWEHcd1IZoQ8bUsOFIMtKy175JfCeBdEcaMxtNCG4tpeL6y/5c00OL9NM8iIt1LA8Er
suM4IwRyoR4qjdBywz5fUOk9eXgeaiyHNSVQMOSjInUMX+uqrG6/rTIb0c7qb643UsYfeBmxXkBw
0AEjJUe2fka9xmfS/OAvVzm4RhfhJHw2BW1cPYTyDjJ1Ori9VLvhuKcM00zmRmmS6IWSP2mkk6fF
T4N4mMYbjG5R1Jh8jcvVLLUGxcJrhGMYXTs6vGYQFvCeassesc6S4UETCMqWU07R+o5XxvtYhdNI
pWQThFQ6T5wHLWfKGYHoYULfIITsXHdnQCa8urF7vNXospatXrq+uFQAmWATwwVke5JmiaAB183c
gDaZlsmUovVX0B0mOw57RGWxr/iRJztpp0xP46l3SiH0rlQ87TkwMRHrb1MqeFAlgGfbQxN2Rgis
kAguBBK69D6nkvDW2N8Xkl4fG3qYa5vA1IE63uQFVpbsBK6IYMeJwJsel6rjGuAYj6Mmo6PKveSQ
7AZ7DsCssFmDoVp6sWJdAlgA2fnPQbVEAOpOev/6E119reikieWcUOQvx3eg/SWgU4wkXlwMAl1p
67big5tOZX9nAeA3xBLV1CWGTv5ZcCJwwCmUzEKCioLeM/iCOUh88qTip6deQyLp2AHQ2v9AwV5G
4h/ZAxh1qnrDQ4f/RakHtIDGH9AvFiRKpPYb/g+8kLnwTNYiGS/Z7iS+NFfjyh1vbAHI3Sornmxa
dDCzHlgqAiO+VXCrQgM2U6B3APzno/ImXYFpVbnq22QnW6/I+adQpGomdqsIq/mYq7VML1wfXm4x
om1x72vKa8511a+rfG60A+yyyilnnVH85xg5A6RzB9ZeFn/udwdADfJ99AoRdohwU8VWi+4Ce4Xa
B3o3e9BC4iibWrEHqYS/VsQr9xzjuak7izd3GpgTp66f7ORgpn131yA1JP2nPMugzeK6tz4mQyNI
rFLrh6giIBSCsxDHmS4il5QXPO3X59K11dF/OJgT9xEK3g6LZn8xoTPo29yZ61mXqwW7o7iKW/cH
QfdUTQkBpVfvZEvAA59pGp0Bm9H1LzyKnUInCMhj6jgDiJdijPjim0pvcGrLwYfMpGgWrP02ixQL
ihRkwmeVS1w9BIyg/sRQdPHiadVZQjt1TdwLnR4fzyi9wyiYBI4jR3oXlTMMDDj6aLLC2w+Vw1iH
mRBKL520JxYkmvQu6Ix4LHiRue/1A5IyaBxGnJfLHxMG78jLvhlA0beBPRhUeLn7JxEXNLgkNSjQ
C0WcmFMz8o+eMdmlC5UxVwHt6Tiz4eKTXl1rID1IQkZ/GWWFm0RVWAX6KqOO2k8Uq6DBP3rT4UCW
mvK1QKpp33IRIgOZ+UmrsRbUCyHsrnmuHak1kNepoex12oHYA/TQUfszJJOGa/x5zI84yykHHgto
QlNM322fUeYdq7o77/dC2Qy3/WHcXPAN8LySuE5aMqpS9jDt1oiZii7OHpdsHK1LUn3eC2xGr3Tm
VtlS4N29ozD4xkpBf56UA105aRvIvjsGxPqU9ExO4JcC0ijvy+7DUP19o3gog38hlSo1a+rdAYwU
B2JEDt1MGEY7ecgfYG8CBD+eNRKXrL1rgim6lXu6nOJHpqnMldD6A38y1CeG8+a81o5kjmS/rVE5
ZiyBklTEVnlluEflyqUAl1hhmgPdi6yTqudKL1jmJgUtOQH7AF7Bv6oY+xvYaD7di5FyUXBFGssf
WNubTun6j3PS6xBmTPEsDzA8OS+kTawSoGbaK4OPWRejBUmvDSlRfhD4yYMi2GzMkE9/qkHi/ZqZ
h4NK9RnhhdJHS1muO4Z/8YN6UO6TnujRZi343LF2PTdw1jFNn7c7uLDMEugh1YEFAKCiF746XgG4
WUI+qNOK2/I9EfQGdkLt1WxjOxSJH84D2NdUOdiQabUI18wjGB7yH70h8TCIGYtu6lhuHRYprVGK
7FaNDpKrisNFt7u2tovWek+IR6SzPGk/KP8ltVXayUijCNzJyc9uW/m3o2ke5hAWgQJmysBZAMYc
8CyiiXtnuKNYopWkJYk9QGRUxPMS+kez4FGZvADtuc0T3xMKH8OxXQIX4TJd4a/nCnELkYr8KgqX
zLxUE9orCvO8glfS05Xu2yC0WlkJeEtWk91XD9zA3u3uZDZcIbXwIGjrwMj6dY/FI1NTyCuBK2M7
zxiNsP09W5Mueab6zd8t8RpsPj4bzxeVXWa+OCEgUD9KmPWuyh0PqlmHKopwIyBFlUdrpXE+pRGW
0yJjsSJdqhB3PwJ6bue/An1/fueOokXbpEFBgPAZJK55cqglTCqPDl9Iy54UPLFm3o47S/r03hRc
Ei1MMwd3NUAqN9A4eZdneWrVei3EIrXJ661KkvdfKECzv4WQfoG6zt0MUn01x46/ObvCZptAq+GL
bNFdo7kdsQpsiXHT3WKUA2cWc/kyC2XgvNuBnqw8y+rVOYlR6f5noYirtpBY3CkjodoIt52lWJbG
JNfHzl/GMOxgFduM0rUAtPZ20QZTZ+iLB9lXXwMfRvBc1lRx/Rihcm25Chpc7Gb8Bbv4HSY1o6Yx
xDcl3RLHmIFoD5I/zRCzcoPNv+ly6a3Dia6KRFpQCPu5ORDoFX7vfE7qW+hjmjMU5kb2DnYghsfR
2eqv0wbN06CVe/J7drgQFZ8UpVj29N0c40cCg48NgoXeuFn3eKNXjU9X4s4QTQMjFLFhx9SW5RUY
3QQZHFykcfMD1YEZVMDH29vXMrPVK5FtVy232W8vtZ1yQjdDTLvVjP3h6u1yHpvu4/uyRdRIvJAJ
mvq5lSbdARDHLhhhm5J/ciyw+tU0sLQtqQE4AtHVbIc30EVYdb5Hg2r6oGsIf4qqKDlxgzgXGWd1
REwTm85/hc6zcbsTxP9OhYAk2pBORo04aaY4VBu4gjeHMAYLzYrY3qKCtk2QjQSoYGAVBjsWr+ID
jWLazW4PVSx5zB7DAMa+ZtXpgxotwXgu2llZyASDnOGM3eAAf+QUNjfBQ8OLUXrKWkgL7EI0kgGs
kAtN/r3MfXs3e9eDLasw5Ows+dbg+h67DnAJzZY/Xc+tgxJ/sjWqPD+FMtKgnPZuVGzVLar5ZDH/
wR2U8ruWz5ii5HEOj2vNyz6nRfJbQZvByos1XPrNcue4/3pngZUmlKZp79NyuBKG1nPDMGYwdtu+
OOp1O3sjpf59jcfgGc6OtDx+TUcNsJEu8gKQkPUPn3Z6h/fQK5z6tIxitHKPhWDLJjDqgA/ymXEm
4Yt/eu56GFn53LEIFV2PldaiSCIugRAr7U7JhM9Pk11YRisZ6gtLTUFWhhZ8OYsEMNpZ3PNGl71a
C0AgHNBgkFmMyK7QnQaf9wX0pxdFem0aohmCXdF706IjFBHvNG2RCEMedAWY3zeKtQX/Y90pNB7p
x+ZwnMjNyHkFu2B6mn3fHaXNsKTxlAacVR77dHdWS5s0v5SMXceXYQGoW8KDYsf66zrHt5LDfZGU
HXqlxcczyeuUFf29n+urVKe3AwbZRumBekKG2JrVBe1NgFaXuxup5sf6DJUlLXFH8MTtzEzrGVrV
OUJrgwc5GgiOjud4feSaa3bpl0fi/FuYStOl1Ro9mitWXcu6Zg4QdlxOepgbfFwWiIqImHxHyPIT
84G1jgBO1/RG8jkctqp8H7HFIB+mj93uuKkbmkMVCfwkpN4mKfWB+e6kObKdTk8I+fg588pf4nyS
euAYKLTofwogXw9Ozpu72hyIBTSF0EFSNNFRKD9PRiuP8Qi3S+ptI8ibgEskIxr3tmKLTAnsXZ1S
OB4nJaDZjRQ6SrzB0Zd+5aVVFxB//BBhZbV8sgMetI0/QbvTEcBJCxSNLry71rXMdlIa/ai0hQaQ
HXUHud9bOA/LykqUcqSN/o9gDGZoE0qNWDMpnW7qdC+WLXSlwoGXdxRp3tp/YCx++l+jkJkmaQG/
Ul4iqTov3uqlzIOx5A0kJBhnp1cMwwXaSNPX/BaiEmcNLDT/m7NBZyYufN2HfWqhotEr8A3+OUsb
ttptwq/DE5Ui5t9eJxljVdJjQnjegfCQ9uK5m+1rgkhr4ydhGl//VtpTOUP1YWre+WW+tqohGtPm
ao1TnwzSBRZ+6MAOCTygguVMBJU2I7t/RB4iL29qSXt/bKYjyAIO1zuBE52UvZAaswzbqtc1SLZM
UVuEH5Lshf3qfyXfFoXFFsx3MWTJE1UI4AP6AW13BeY4u3fiqxHOQlHDgEbDXr0lSRo1+ETzqyeA
rN11IkMky5UlqumYlLuhy7XNTDSZ9kLGH9FVqGS7kgWUYyNauHKn5kPGbbV7+5cFYCAjqqaI6Di6
td3wHoslzUkbhB9heTlxY8ekjJyobbecIFYJXoik6FVTab+KmMsPWhwnveEp6ag0ey+bZgPcbhGH
vLbBG0xo2cNdFImBR6necuq6WigzIV1tzTz4YDOJZYFOuERy8LGLfF70nt+lc9kHextkfoZlBbi+
B2XfMxaTm+P3Oshd+v5NAjF5hi7Y+quhOmRuZ4b2YihgSAyBumuk4lKmCIDCBqqWiFAziqvXm6+T
CdTsJ8BqynNc+pEEcQSy0Tbk2npqenHi5qXcDEZi1SbLvrTru7Z6xqY0GEKR6M+v+L85b8rd14LI
6aIeujDT01cdCJc7rLQarKw2sRjcIqar/ZBzTKguKEBu6vuoJMngnyU4g+Uxb4XJrif4WD1IHAbb
U08GTD0AoRA6+vuv1Leode5Mj/dFSRutE3kP9q4nHAQTiFjAl/jQGcDhoaP2bi4VdrSf5oOvIOfJ
twNKZFrrXPNFv8RXKENUhgbkHjPrmGwj7LEv9Aphxo7KQ4JpSXgEBmnCJl7uuIVUfhf1w4x6PF/F
e7nuXCXwdHgps42VQU3tdNlArNrQBCWnglryZDHrMXLrBjTZ9uvg6tnjPDNyqQvCIyXb8C+iCNgP
00suyIrheURCyTJEpQVheVh8FuUC5Hj4ajFjfmBIZ16AoorA4RPWf/vwrRr+HSjjK8ubjfWKcbqW
pglgi4lNcAoxvo5dGu7P6eWx2DsNZWRcukUX2wZ7N+KRRr+klOKnnIymnOJbXPREQ00QD0ZOzJX/
r01ecxV4cdc+dkoeCrIRhO+i+bK4PqiV3AEzKTPVGiQXFIBbPkxRm7raxd9LeVnR8K8Sm48ivFnj
/bcOel9OabvxVNlMk80vAFOh60k+162B+lZYuQ0QrdvblJf7rz61M30T+hljrD0OCp3gnh+7AF5t
E/NYAiw+dZXP9i8bnZqVjpNDtuW5zH/QhrjxgW+KKnTTy01LUUHd7uIHrYURPXq4Ik52jx9ImQSq
sasMvz0FRLT5I/ZTmyN0Rhxh/QgQiUqaN4nzWysZO0G7l+tTHMrDolMlJSHAkFVsn3vjsAqcLAZQ
MYFdAs671/j4+36WR5J04ol8aOts/+rkvJtAli/gFBZ6HmxkXLehEl7Kp6wTfE/3IjPGBtQD6xvW
/FcTJ09M5b4AaevIm2meVc6GeruAYThswSA7aRjj1MZrj2QJX10L+wBSrmEnsZf8i2hHL7LXrNTP
6I1ve1wDM8FjWen1uNFJq10pqhZ4tVi51xjMKF5272ELLfjZC46FxPvqVmARVHwYKd1xpGrI9cAu
hOsQiklooLogLIAZqXGDZqLiMeZ31TslrFV6dypiAvx/gHVzpvC4ATbfwoW9av9cFN1e2Lg7Xt+l
MuRxwXjJbEqqtbnGFfIgkhcO/42qf+4M9uV+bGsARSW/65QLkv/z3TkgNp1GNAa6zUhuPzkD3gDP
jJLkwTs+TWuP4JLojdvhYBKkFPJPt7/8NGVFFccErYMZ2d9DyA4svJSMUVpLidstwzKPccC6vDm4
Wp5Q8ZYmWGhz8GT000kdNOZYwq+m4NSstnTt2uBAEHGGyOAAONvh8I2kLjzKm89nA3K36cFmsE+i
CROr4SiK1qn4ipQB6o12g0obCRxM7E9GNPqlEaKXE42haKelA+/TiM7yhccFD0DUNr7u5TMbz4xA
av5LopqXAW3XAsjmoTk4JTkzcZu5tkVprXDZpMoESChxRF/NODq5VdNgmpGcA9h2lJH2SzDWuSob
cAlz/ee6+cmR9LDdM/4uAiN8alR+vWNQ9Gq7TmBHSNNbuLwdanezsokHNmr2Pf4BcFJv87Z2QU2l
hbNt8ivW1+tO2pVqPdXtfNimB2dMgpsVsK/cERdqB2xTdEj2FFdGgpBALUcTBcF1aJETUsRvJeAq
6YU7EBz/ATj93MACeO/sBAiPc8BaE82+ucTnRvd3TIJt0JzKz7idgRYUCxLKR9GaSh/qD/UCISfK
1xxaN5wqLsxv/hoRqx4emj83YOHQ/SL5yE6atR2TsFRKs33IgY7FWd/sDuIRRpWtaOp+WKuuzleM
neIQohK6L29KksoF3+dHd0pnTUd6aIsUITuriHdBd7V+wbVKrbxi2Fzr41hCDw9s791k5jy3UJie
aI/kCA8vJpmVQJyGpUW3SY0L8ufeKQo9akgHi9oH0YlD7/diRSNCIQFXdIzJVH3l1ZIqFYZmUuG7
7CT47vMKM72xUu3aMhdTs0mcJ3ReIsRKrDCnSsZv/6LvKQSbzjXJsrZBNrl4hSKZVGOYv+Y8RpwX
sDeGvRm+E8QuWq+xWTOdHc+iD529olPO2CHjKFIv2b2Z7i2JKmlkl96riNIOSLSf9yJ//7vp3lVd
3svaJYuQK3a5lg+SFYj7JJZKM7YmuH4AIWvQ0cH9yyCUdLKYHW+/eB8jzxm+CfWGf49mXS0AZSUG
bdo3jQwZFgli4PtOi2VOxzLWKMjcvspLbObAaOkg7sdvDYojrVV5SwQXdJ2cx5DUIb4LN3n1Dse2
foszwxc7tomyXO8S7cFYD+kbBY7/9hkZuwpCk9kpd3/gNzsUDe0PJFm18U4+inkvrd9LNBMD7NCK
Icj1StExPmho4ewZ96UUR3+Amo8f1s45O0DwhchxfJC8LHkBI8f6Lx8Qo8StdxFkIsRi2FPu5sTW
08+WX1Ly2Yhckh8NZEw75KfmDuHfn29VBWgn0jwsK+Uf+d/eHcCScCisdk9QQBL9QSVnFdTZu+yD
YjZMQZMchnximYz389QseYcllOAd2WBfkQP3atwpHUyk9lAFN3b6ksA5eUgxscuYLZPghRCM4aSM
m14nLwsFsETR2cxPLEriuHDAZQ0lC150ybqY9FEc/6PIIJKG8uZxaIQ38e5q5+lVpV4m+RbFooKU
QTSBJym8nIKuk/AdidGOgDzcNCxZIfAQlhghnuCD+3wl5sVocz/if5X6QN+FpYjrJYpT5Dm6LQu6
lzlDxcaRkPifLTfZR2Ut0HsqpuuvMkRO+/eANHGx1fmOurWXidAbRujS0dC3ZikiQSdFIEzDAV22
fU/0ZvUKg21dDt+ImqwzwooCCf3+Xg9+9vt+wH3rJoee0k5NER3j+UF3XnWBVgZVuCKTax+RMbOF
80p8y+6tbnQ665ErOxtlReKAWM6+5DZsqr+PV/6EfI9gaePAWp168GYNQIuzC1w+tAkTUZhKDDOi
1T1Rx6ONHf8l32MfHj8UrS3VUi2R6nFs2M7IfpAAbiZ9UbYtgK4acPDYqn5yuXuWQ6Rv4Dy9PGTq
hEHp6A9kHkDCvBTpwjkJn/nH20n6gwElyruGknm3FqKPLayLDJJHpNpQhWvTtq7un5EUQWO1F4Rj
juJNzGVVpF+kWf3HIYk4N2gcf0RvbiskDPb7LEnZ7Pi2ab/5mWnGH87lO/GcHzBQrqOdIq0fpUiz
c3qS6gC8T2p7oYRZEFXOqrMsWgvmsyrEaGQZX/UX0XqFA4yXUoVBZqhZI2u9dnCueUwKMNs+cEaB
92hVsZovAlaHcxemYoI/O/1VnmdmmyR9S/W9p2vbB6nVg3e1zJH8AlAoHXHrBo8CCiQSCcnHOL9s
YAN/j52ISxJiY7jZrW+ibrXvmSExdgsdlWnoMYbB/pJFxNpl6q7C9qy6iUmgZTNmJXhX8xB1S8R2
6kUPe4PPA617gCLFGOS5DZGmfZF9XUWY5jyLPdIi0ajD8ridWwUgnNeLzbwUTSSHZhPA2AI7i08I
yKyb1gNNvPQdANoPGWS2z7itIRAEhOAlhnPO3BKubJd/y6CIl657HoZzTwCDi+xdRjM36D6RKKwk
X/DhpWDxx9UAfdcei5tYWO6bIM8DLdYys9OO9K/s60nUiUUZSoQyE2xZcB5k7CkKlSp2uXTks6MJ
Bh61FGkrAa7Q2Ar8ze6NjSjmNNYBfH01uFCqA+C/BOoz/9PTkRKPdU2oS94wxBU3zy4HwkKy3U45
cJ5Gu2A26pE3ZJICc6/ZARSxxPCybfFY6ud4XeyiryqwlhHGs+aDR0YHr8pPQG+1d3A57mZyBcio
Zbijr+S6HD4gNFtSLb0YMZhBee8gzL5x2ob7FGjW8+FACKAE5R6MKfDyuAoUB9IVVWEKfiAuYYhU
Pk7VhYrnPBkf8K9FhecDo/qSeK4YJDnlKGZFfRKBLqAg9FtcvtAs0zeAc1Ap72cWvQYXsFdvHo0d
fR3RR3k9UKwpRxKFF9SBoed7AIWNX6dr5uEhuyymZdINyGUKlj6E6mvR3UBdotWt/gH5Ef/sGm4f
NIl+oBEFwPJAxm2rKV+RX7EMuY0KH/1/lFsatUdsy6gFA9RBICFWei+rTKC9CL6LT7BfbPPIFN+1
7UHC3W35Crj8IsX6bYpl7rtj4ZjMhuozwVirDuVRTf6qnUpPPoViFOMDoJ5FS6T1JgHB4Vv4qIVy
v2/WOk5vS7qOJV756O3u5zK52zPuvsT5q/ci+23naZufFhiDBbakP9ON1fq0ucfwezYwnNSylK4M
N0hJCI7x5vMOAsCR2fkeJynWcEXh/9W3jqof6DEScLNRpUk+3aYSEBiTFNNb5XhOrpxVQHsZeY7W
HDVrvPAVfT3V7ZS99GrUvtDSGYjUntTp23TuEgxcI7Q58b2/xwlBGZ2FnwO3iuCBi8od8PbJTKPX
MSYs28uV+3y7gdfEW74PRQwAUMIIF2RsmLj5Hj7yTi1u8m3mZIT/Zp2qexsetlm/thw6cfoKa3ki
S1fImE6ingF+l1fZv2+0wysdTaI5GsI136KY4+ng5XtqO9qpdOYtS5qFYZvsaYtUXgGQbAHHzcSA
CNmXwHSnbtHj/pv0x6V8bwNJhj2oXtN2tDNzlKdxBD0w7NJi4fo7AozutWBgbzntPCXgxwZnSy2U
fY5ou2D7vynx82kQN8Y1gVlAdbKWmLqw37z3YeipIuzNz5RRGEyuFHFlwjr76TgBf09Z8vPo/tXf
yCwpbnAEtz6c5lljG+O6YhJcamCNwkv4opzXfZXaKgQdLK6/yUjyIy7HsOvjnFJctyn0UD5frA6B
C0i4a4ElrHlBAU8/3jVvja208AOrwLKV1MtLhvH0cSmrPF9RblLCyEEhzcgFKeN8c9rEKw3+jxwj
AGc2PXQfk0eRZw+CAQ0fGxSkRGOpp2v3ar4iGW+lrWbqHMN6qzQ32HvIQFSGRW7V/XWKz+P74XfA
UCIEI2VK3tfmHiWgCNFqWafQk3FHJz7Lz90Y367UM7lRLw/Deo66F+pS9nVEfEZaLDwqc8Pq0f0y
hDCssgfwsG+3hkbVmvaZI6Kd8jyYHTSOG389k7ERnRWhaXKxBfnNXXF2GarlXL8aqv5GyxKIWHMk
Fvngai7vsc3+jEWeQxoa1/QKcT492ld5unXzVfBo4EO3WrTY/vuyHWNOA8oCyiUFTlkBC8087lmD
L+cv2BJeMZPDBYwrbm2aXHq21jofdwsFhnnjFztGrrQKQKzgGGHwm40LvyYFKwoijyS9v6lPFRDe
U0nkg2LZB9oK0PJHD76Axn8kpXx1eRYcIk8TVhG81LpY0YvxNoRsP1EgIp5OljA0p706fcvU69Mg
28q2AJ7JCtxORpZOPPIylBkfYP/3AE/w4U4YN6vGHHU9WhMcyKfF6rG11tzLjDo4DfUJhW2YFRhB
nAlbk7IpnQEXIBxrdMuHCU0Fr05miNHgmg2BFv+/aGNfqyOnEJuFE8a9eigdoPBvQ9BkTc5TkNWK
FR2VQa+NIbrnXuAXDYIvFqy/5x39CTjwTIQmUyMoBhOb0KqLYt2MFGp40G+y43XHtHlB3MneqPRd
ZYIPJKMiutRcasxcMsa6v+DXNpXjtAMbJyq7yUWQq2Hu9AZiXuKpqjYTDU//ETbD7lhOsXABYX3Y
IQ4swjY2kvQz0j819su9SWhIPS15DzVkuASyJ1ba/HXUwZscqpXcFdRWjKRDskVObKrfW5YS4kNE
qAJ5ZeU/WDHaG+JerSCAKFjXoMhZEyvGT9J0GbwcIBmzBQup1uUwOK4igM7IrfE3ySs2CPrw+yht
YMKkQJxH8nN91av+FAl67Tzl0Yo10+cSGZf0jXfsL69GUYoj4Pt6b0zR3LZwFQvTy38AyP3VUqrs
P8DmrYQZ3iXOqAe72gEp2J9CXscIVfsmNRMOB31d046abPk8L+ESEjoHV3DFTH2BDkEB9vQal3cY
ol7WsGLA6rT2w6H6srFE/KHzW6Nyx2X1DAqAGnfxTWRPnj5levtpp43Nh7m7wH7ekbOzG6orviA4
YnSvyftcr1Jl7rn2Pue6TYes5A3bNCXCeBu31Mas3rvNfY3NDQ0xIl9pRJE0nq+x1uND8diw5vqm
zMvEo4YoBE+bPVaKRizdUOdp1PRSptZWXnvLqmzg1B3h6t8tXCSvFEQPEJp0w6GW1IjReY3QWz2x
M/K+9cdRwgUdM+AX8m6cmj5QYXVS/Bwc4cOzCFlaFooy0fanrpKKcfAUwu+EOnQYhiWaJxOwscqI
gaZu215AKzE08n4Z/3K4WGZl2CbndxyDSS05jOmkE3aKwdyqgeLCr1RtrmMHyMZec6VoHalN+G3I
h4LxRiUmCHkmExiiV4Bh4FipHJEXiqLBSYhHk1J5xzV0Xds6GyIVZZdxarkDjE4YjFXja3I5yGqg
XO+VSx6KBcX2vB6lr26JMttN2swuk2KbWaWrxCAxQzszEdQ3280j7Ylt3stK8oop1mk7n347tDQn
CXvPGyqOVG1zlNNByvk0H9wp3TDjkUT0+dMDsaI4G70BhAxQF+5Xd5pY1jc6N11+VOixa4T5J4go
VtToXHNHrynDVr7XMJIibU2D1sYuST3RU8TyjYCnrc1V7cgquxBkbI/HcdsjKNbG1fIiTtr1a7Io
/vpCAQ9d/dj7nUmoXKlrBjYX2CdcXIq4V05drgEqR2QNE5ZxXgbRFt8ONI1IYQPrRVZI4h4HAch3
H/DKLDkllz4bLRRE3HvgOQbU3DR+yp7z0LgoRLwI1nD40yq1WDBqO+9QR9PHZddyszaKpRRTXrsA
4MbcaQa2QNPOyyaQPzvIWY4/+Rf+/wzeFjX6VHyMVqm6vJvouW2aG1jbVr3icH7daMyNq1fmpvJ7
CqeL/Kq+Iy4rs2k4BwmCM/71cZwqJabxZ4bF/jdU8kA2bdTzBCq7IsEKBeaKJMHbWjKe16ahovYZ
ealrlxy8Bn20wyfTz5XkzkAQandsC9d58zxjC7FgyuuC6U6ufF3q6mAP9Kdh72nk73k+p6QU3sJW
gLbKYwbadxRbpsDAfW6CE4TmErYhGmh1ZbtRUFNnrYxGBIlfGlZpfoaF7RH39TE7Jhpj1DVgLDXJ
9DeKR3PENaaQJjz3TjzqUCwh9xiubC8dfg+kC4/+N1YUtWcZQ+9I6XtBYVFqJ8Qrj9naQdqBBJFB
O+3/L3usRwITB2ZnYY3uE3GvWCtPTEuxUd2RQpYcTGNyYQEN4ctPsV8rA0WJlI4cOJd32dkdcSYc
MLfZDngxORGEByyuCmrqM/ICugBYBMhGw8XaThynTgFXvXHrOG31vSlDJYHq7Bu/HhgiewDsxC5N
PcErhqygGypxtt6Qpb9vsRuidC/DJ0Jaf6ez2svA+bJ9ZJgMfuac5dpWFFgnEeaMULDCOHp0tDaw
LMJrIMI4L/5IBxuCtKtNx3URuw4TQYdDuNCoME3diJRQ433nYglG9cfigmzF3m16GEAPTI96GCtO
uBHdwiP0jascioFHrdF+KbwOAAxJtSs+fFGTqiSv4c1Oyk5JWoHy5FQbEfqGh3TN3vNJKBArDqoY
mGsd/LnJHDmuJHw5IJji2d96sKQWoBX+iSIIPym/Z6I1wsD96H58V+yzs15GhlbVzt3xk+y5MR3V
m7XKfApfeQmxAAr+RKCpxU+IQvFQf1VpzSRUClOEglClx/Shp38zkM8Ec80yTYV45IcWc/jeYj50
QDyoawkLP9yOfI7p/ntCxw/URhXbXcK7d/YZViA8qP0CPdSjm5FO4QOGVlJqi+uH1XLWb6Ce/NT/
fW+yIMPOD856zwnndYOfaZ82IA1MOykML/jqfhFBeRfPoXXC825P950T/tQGPItXkgQ+RlUqbWS2
rQcTCK5TfUSB1muwh5upeLjW80jVMiUJAKFwgI0w1DVJIBG5fU3+LfLWE+9Pyk6AlYkg9davaJ4s
f5RZi73WV+TDNnqvJVpiq+mptjlXOd+lwmJ+UU/kXiAyqe0JXeZYNHsCv8CT1aOgZ7k6/GEX5csY
51ofSskz13+zhv6EwotSohpg7FXbS5MrNopJveSY5wvlHWKfbgMQ2EgkVn0I6SI/dNqCZCFFSBqN
EdZVjfvlGbRDVCSqwtlRPjE5TMOSXjnNb9JCak6lPoVleu/bnjli+AkwrSVTHPcl9w/OgBA7zs9F
MU6JXQ85sIzag+Ikxwh0a8ltmDsSuHjx6W+NyH18l4Tb8YF5+63MU9o+1aTdL32kzUq/isLfNdrc
17WlkdKleGntVa8TEudbP7lU7Sqi80HeKAFt819Z//zWyJvERaE44Ckx4I+mPpDOyKCwqzF14mbc
9Y9la0qB0+blqUsJ8mcFQPNXk6/PJVXYjz6Jakr3fkwDnkoNRv9lMvQd/JGtgJXZ6BvoKvKZpL2k
Ts9ESi3DwkWMY3tdia1P1jAcMMj3tQv8QSnJLb7+AwqvZNm4Bbu28KJhFk4qUsSd6eELfb4dq8l0
xwqUjHrh1mZtyY6VIoCrEx9gqiUFgJUBvSj+qX3sP/wSqy6oGG5Agwf68fEPNTY5szOkNLvzfkUO
paOJxhJMzBdyzSLqDzGX+pKD585wlPOL0l1V+D/gmgpPGsqTU71ZKWCJ33+AeRF9tmCWvibpHVYx
c+bSW1J9cFKqS25s8u23v1Jit/S31BnDWStJ+Xw3HF6CFNijgkV3qV6gYN/olLzLbijvuz8Sv7zP
UsxJRqH/LRgzFBOmdmLjN+XG1JaNYKlG1KnM8PkZF+OCS2MxDy69VvlLH1LC+QRPvKOHQY4XxJiE
TGTVT/a0CX/FVHYIBl/MASDCthCRJbX3KcasMZKQh5BM8tDWJqzJjRz9NfCqG+WxvDhNYuBmftTT
IradcdYaBDVn2kXiislqfsYRO4j2h9ssYkQz/V0ky1hNgdny7yIb7a9EMLBlXbRwsKUyWYsCWkld
g5God+jJrcbamXh57goKMMSitseC5a4Tru8uAjregQtMxbHggcbXhau1ejwxjD2i8QIxqfx+6VGT
7XrC8ts8uIJnhcFdO3EJhkUF4mcxD0F2X5zsXl1l5JGyK9bS7JRJvEqMsSfnyJmSfq8MJO7k+s+m
uv6RoJAGo59DJmuj6dcdY7HHrqXTANsTnFFHgMH30FDV+jnIgPU4lEDC6/33499prxvoFoO6fYag
wS4Dmw3m1nLsU7zkHj46NlKCev7wWoN/qf/80o0URdUgFxG1tycErzjQdWilDdSM+Zlz5+paGg2p
Oj4FgcuJzhXxbKt/lJd6UHRcjrwg/HGmFKpw5TMIGkib0O0EaMQ3miM5GFLebDrqQFUGG7t3/y+O
ypeK2e4YV5FO6xy0Xkto0X7DLnNlyKPi128yTuOXKI0ogJcjf0VMgkHv3TBduyDbLJGPrUmj/Qh9
wE6ffa7PrtgfWiL8l7TxiY6HMU7uBPBF0isCqb2Jz51GIGkQ5YdEJ7rk2p43jpFiiooOJtrWmP+Z
TVvZYCgVXBTQdCDEeraXnW6c1YOjE2W0tAq4Tl3v+WFZRlEqHeckp1P96zulVstYd56xxqmV+7F8
z6gyLQ7zjq/SdsAwXHg+MdMwZ+UnUrnz9y0nLcKqGG4lMq4pm6GC1lUSaHOSRiiLfOHOQQYpXBKH
Ke6/wWHMPa0ps/T72aR5tpiReXMAG1kj+5a4ZuZJmHcUC/V/c8eqsFai5dCgyjdcPXDW3hxz43Ec
Ed7wCxddDTEtLU4xLEEA2A8nTf1qSnrkcpDoOzmKjIXAUDbH1p1smwflBww2eNnnfSmYvSqbD1dP
ubDjvqIeFKMFY5cm7RSriRdMocy2ZbY9jbmeRwO75Pfp8Y1N+EYMIdjwlxAdWPHgRTMzK6NuD5Ai
mSplwXLasaBEU+2+FgPr4oQuH3QebsNHrRFw6IRKIDrgKew3GTMjhSB2QgwLUIQYyAgqpXQap5TY
w3+BEXoJRuvkdybozstboHLI8QIMYyX64pCD4cHaTDxXTTkect4y7BwIDLBwke2NsZoi1J2FvwGq
F6V7+GFxSFCYPCbwqV30KwOxFYhWeaECgBPdJjG3eiAy35gQuk271CV1jK7m31Pug69zg9Vvbxtb
udeD5br31SMY6DIAEfS4tmc1cFk65Zx175rHQqtC2trnwcoa90j9SZqrwdZ2eqTDtBKqXIEUSjlR
Bjkh5iOwQG06/Hl0joJjwmOU2DiYDIoKkiXhZeWMBF4fjh74oItZOBcui/R8Yq2KZ81zAYkdpIen
oxU8AnD5DNdpRBW7i5i61g/9Bwp3pG4wZrEauxDb2/wrN+oPsIpblZk1+rXYg4Sh7UWoSuPrsVCv
OxX6tN0bkR6JizACUCJhGtS9CopSh4vLZr76ldpLbjOb2LDQsxSvdzk8qQ37Wtb+ttLYJ1bsGVbM
KzdODUc4I1PdEPwR0BTrZagcEyQr9v8jPKNzjGhXSaFXlRx3yzhReT3npuVCoBkRn5HXebUnrB9O
6tyF3MwJUXKvsh3bq92D2fo4VYNjQn3J6pl2PpDNojnCs0siO0exDrD5jWQ1YHEnGi/QwMs0PHdc
GqI/Kwtv3LteSV6VUvwBvkiFd5HRyRHV2sYHdHYEo0O23zi/5e6eCfiQ5XkZmLLXFJB4WRpl5yk7
LFAcqjdlw5GRxXkDWN+bMAa9g7rseE9csx7IQhRi615ZFJRLi5ToSfdZ0OaeURMLwMC08ZHhC9qU
cez/pik+yEPyYNfbr34KO02F80wmHKDV9krjxREB+Fo8ziKZ51LeWC2XJ+SzsbIRMSywbF3uiUDp
SKoJD8vaDBwjeV4Ho/PlaYg0hfvdzT2jYI+kW/+HJnja4ilSBxwxxtZdSyvw2w9WnvdzgZM+2O6y
35usP0hMGGgArg66fgpayohLcur7GDt3oTtdZkLrw+e5e0WvUIZkIX5BaF8rf+oY5knGDQJOKzpP
7J+AQZSbnViNzwIS+FdD50QO/XqKPmTm4sRtJWQ8foNKAMCE4mynOiooAVwYVfoRiYIYiCRy1k/x
Uea5hJg1X9yHsYgm3w4AvJ/EZlIBtc0twlKORn7A1Chd4P3+GA7SmHTL+B8dfrEVe+o6ViWJfS+x
BnEBstjScMuevF2iMImP+CYxRspzw9bSgsIbNt3bqN0JPeQMctpK/Ao10k4vxrc41VkmYxJtjeoQ
zHOup4VhxjykYVtYRa6+Gnw+lvx60t7pjXTaBqV9Sk2ulMmqx7w5LHBj0Y8G4w43HQB8LMrQpgwm
D2Ei2+r+VLpj0wILLtPppE1QlN1GPOlfuvGKRI744M75hlGkgiCYzd2WA0gECDZdvpL7M9Ek3/rP
awqK/OzoldyglPs2SB6v86OwKrcJ8gSU1izLHLLSFzrc+6bmv31AusTGN8V2OZit4gvqGMbHdE7B
cXmzWsji+8VK4ZfLX/5sU5q7A4heV62UdSkdyKBg+8HTetZc+AOqjAby8W2l1ZwABZg/P9Tnnu1S
uX3HWbIrTVQohQBv8oibW9qz2Z4cavjVj7tMUIyzl6Kyxy9oWrsHBtb2K2qpY5AJnXrqDF3iUIKY
hysR26T9sHBpEdGUEbtmVAubojXWpY6h/9Bvw9jlkkdI31Z+1FTpGmkpxhTEuzDdth/8FUk5haVw
I8xhsRVQ9BB65+RjDIlv4+uAhf4BSSdMar9b5eSRtLNxdzPqnYYWBZgXU9RvSvQKI72tNifSh0Oo
oHZxN6QtFq+ynSYEt7guWD5XcNhNNQc0NR8zZyIH5hSSSZl4jBRrhdzucWaUcY7iGpjAoAg42/2b
ey5ggEFSL/fqYhtGgg/iPUIpOIuoIb6yhS4EkWppO5kEw6lQXFveMxDy4U0IRSiRc2szVGnpSqou
THYI7NjVZY115Cn7EY/iHmoJnqViExgwsXMZKZFWGLwkVgRVJCYuZnvjd+FjLCSOctn5gBv6cwcQ
RtjF+1otDGziZgRARmQIZzgxmHWW/G9DSLrbI+BQICva75DvouBXAO0NBBmY4k7I1M59T8a2cKph
7fxPT3olOMfm+I5uZj2sNplvTPf/vKvyIZEXMuwfMg0YXn1WQD/XCL6fnM2/tDowiKOpN2mQuHc6
deBq8QBsvYIYQZZdC3v/ZBrC1yLEySnxOajavlioB817Wkhi3As8CGBMDupNewizAAnjtzJTgOuV
+JJzMYo46135pkrpd92v/lkBJUk2hJt1tPpbGUmEq3ngHZCoFWJIPOV/JczgcTPoJxu6LBqoIXHw
1secDuWdRU59Hm0tKSYSZkzavretJEZub7fpjUNHs1zp73tJFts4zhbOiLBMY8SPwERlwhHVILnB
FU1l/mFJsCEP9H7qv4UYzTe2hEh65LQOMLgAz109XIolkjux33brAYezu9hU1f7wrv68p/Wc4tcW
MvyPm0nRffx73XlMS0+lNlGgqTfhS7k5PZLZhE3a+bAVvM1eoGWudtaRQpF7gB1+sk/h6saSCXSl
ITVH8DW7rTTMnaYaRZsINbTGX/QiXYL5TSCQ3iQd6a4htzq+9lib0kT9BJWIBcwcAfNHaJJ4bZCA
y3pk4Qks7wyZfYge4zVg1+i2e1BvlkIiOXHd+QWMgequT5JrOFM9ltHHTu0SpvSI0ziDrHEdNieM
y+rPv4Ov8e/tg/eqC4W/9uoEhw7GIX+DvRI0dCEDT0UPXI8sy8oWHRu2Dm53HnrEKqq1vZWMFkIz
lKAaAXHAuoH9lqflL0YEAWcdVmGJEL9XDrZFAbmJBuKfm6pWwkxYwe0Mu8RjtHEtBzRC6lQ3F7Vd
3sUxR6EwzUTguNCJzeCKIoiQ/0jPSjmRUxKVrGv2GIHaXdl0Li0TTH+W9BGWLEtoMshQenjiX77Y
bFMqzWsFyumvGmGFeUQhHjZdiywKDF7CpA6gvontkHDoHj2TUb6a/c80UeLI/1RZqfdtktz1cRfi
84rtZESfsKNs10C8Ijr3kK7eJT9cIAc2zOMNX3d6dTFW03C9fvssUUVGKFkRi0SZfLA9GsdX1gVC
7EBP/TiODLt5fi2VGKQ/Hfq1TPR+IxBvFzgWMxjAM+P1oQchx0fVRGeB3SS6I4J46LszTWg/DMXW
DCMurJAbF5pzuaUcojfiZhOjqqGzuIVE5LeCKMwOOsEdKxDYBZ8Efx93Zz7ZcAtbdpbQ2AcDnv4U
BkBv1J5paPmeqMfsRBOPrQqTfjg1JihCmiMghT9vTo6Y+lD9apIYLXiUtA62g5IlXGZife8oLUqk
iCQL3bgl32zyKe5wGoFqXCt/Q5ma1q84uoh3va0tyymcNOU7FIBMiUw4sMy9ieIEgjwr4EksMNW9
zn882U79sHwqBgbiD7y1uH0fHrjOe/FkwBsCURyyah8i/Bsw+/mEUJxtnqn/xLskWTpxBXivz+88
kk90UXeAWdre1MLO/rAM5o6WQXxP0o3UKj9+zxEl6dCUQdpvzMaSkiIo8o1gu0vN58v6oz4ZrhfK
9JNvr5gLo5UrQR126O0cTDzbw9AZBTeOdbUJeQq4amxQOEOHf60NEqHYTFGiDe6wip0WaA06RBVI
1xiWcHJmerCh8k+r/BPlh58snAvfQcMcCK5LgFV+Mj2q3atXr3SIdC518MlmR7RS3RhH6YzkWfLY
vzYr3Z/YRQYB/1+853h/zObJOJZy7ZbYIMlcsFTWJ3bDvJwZXgkgqgZFZAJ0C6tX64QEDp9djgQd
otgAT385pZPFZgpVeKyp/njPI4Lg486uOUvZ8RlaFtJi5CZkeC7VBR5HjmHoql7LUAnBVGDmbkr/
Q65JGvZh1+PCKs2U8N0grYS+g4zK47iKfGZ1qAWVCvXZcdOhzEqwYh4cQxpsRBI1s9OHdC0d2bzR
tk5lO0HhzmpMGlmsuBJpdXOkNkYoBQ9oDfxCj6hvurnp+pKOyApx8CH3XrifF2q5sMj3zf1QZyxO
fAk52oCF4LeMvs2ucR6oApHXIL8c+BC4XF3d6M68+Klnvd4ZG1takJNwS/dcE543WjtTShVP7NxQ
5rfjG0lTlJO3mWz0ksI0P7fUavLFRUc8aHY2hRSrxDOJQ+p+RAUvqzjM4CTXT2qUhy+N3M4i/CQD
JG0kl+gqrydn3ECHm0YSWPcf+jarlmq4YJ9mr9Tfz5dM/RALcBszCwFCgOzYVRs+rj6jtfr7VV2W
rlf6b4trZPXny38zSJAy6eFxlEKjUAxA7NWsBl8BpOJIR5dnZ8Y8nrZ81ZHjG1FRpm/Dw4sKoijW
N3cFKl+vDzVtFoV+EF+ePJN4asR05xFet5XN5LjpIjdaenLEsqcjmscUKZlGmnyewIx68w23MngT
5Mt2i2yViWs1r0pIqrXRqpR19dk9i3D3vlrambOZHiVxzypzsA94HQsbNUgbeA6yIzRDwmZBl8fT
QiYIq9UbtxcqKHA6LZWAqZ9aIZKselWMvVAmJpsDRPcLJbFryNy9IQ7mImHNR8jHyY2Z4Mf7iW+V
hNaUCJN2KS3GJRz5V2GQJ6obTY852geELTjNJoarWp8rq968hJKFK2G7VRMCvHzl+o1kgVVQwBez
bf4Eg7igJ+XT8ICuxa5peQ2coZ9DoC1fq/LjZhwIU+K+54juJICAg/7PyBGGieiKkA4n+uHw3eXm
t7iBolgFIRdpGoCP0FApcuE3+SizG6klS+2sQOOEr0En0Ng3d0wm1yq+LXm6iBhX3cHfJ0J7IcXs
lVEGlh4ilHYRZ/PM3tbL+f97gGCH3RB2PXuuJz83rrjOBoboHi3L+8NFGilJoqE6fUtxWIRbYazl
WGWMFM6p0Mp+K+Md0oaQ1T2COcNfkobur4JFRWr6jiljZ6q8cV9Y4p5J60I60irL2CokIwy7aige
GIE5CDnEiPMjZMRupwdLRbBiVJzJVOumFAAMi1eGn+Nj6iYRfrrW+XBsIEd9PDNtWFMnkgUjr/dm
UFTTEEaGLiy7/sqzz3GKbX7bmtmWq03atize7pY8Cse0KmX/n2zeES6yn0iLP0MacdbcCeNXisy9
ClgVpK1rl5NkoThgVAXi8VSjhA1Vkg+a03BuIrd58nLdH1Z72eF0K2uMqF4m92Nwbb56Oa1Un2nB
/Wb274KWyo85adgRSdD4b8+BxneraOs/CMgvsLYBHdMNFLZuJU97wI2Pn1O78joNaf1IsEsTcf2i
HrUY0gJiP83EF3nl/eX0xShVCNxlMLVBmmpzxTUZkWAtmvLEIMqjzOOUGpnace3/+XCDc4ZDKVNW
I3CbGLDVjmfm4v5tDSZ3sI/3jtmq9bPDIjittfxf+novPqi8jUf/OpXQ7EFfVlGfPDk7F+I77M35
1QwbgwJ6LpO1NswwSLEqp43I9SHd/lkMQSGr3xooJon7Y7avLnzE7BWthVzzwE+hQDk4/kv8QjHj
oOtJkfTQdXCKuRRfKAeyDmBL57tn62+K1LqEbvE9dkaKinqQ5/WgrR1RG/sSJg3o/rqTU50eNYY3
zEZ+6XZO3Qk4fCGemcPD+NcMdrMHA1vWr9de0dOiPgiPBZezGA6jqc0PA3vUzJBpm21DX/X22WHD
Wqvd1ELDovVhi5lEixyL8wqOFmtJoMVnlWFMYMncHKV6mxCKBpfZf46uge2Kzqwf7AR6HyOFZpAA
3PLgRaFi1lyBMU4e72kMWa3jhlbNbEDYb1KgCQs6bnUCotdTe5xLh2H9u7iXaI43fvpVmjLaI+Vr
flQ9jkbc6TVI4WiMvRLgwTpwwSS5FzMg/I7JC6cr6nEhVPwTkQj6q0CibvicfbeeL9T7VpaN/oT9
jjPJs2gIVOpHA0Mv3bLt6qi/20gIiPoUJOaj2IVVWYv8cXwV0lq8DHvTGBwnDF+I1jUgP1mU0goR
VeAn6wRYnNlcu5JRZpDEQJxF5QVS4OxoPidIFGmyD704hHJsyDvZ7y2ZxYX61Tr8M5Fgw/cx5BEL
Jz5NgDqhpJi1T4BHogoj4urFUM+ve2PZ18QoVUMz79D6D7FxNJcySVl1BDzNNfuFiMBq8l9Sf7LY
7w0uJpzKG8oail9iOUjYj7YD6yUsLTE/IHh6UHo7WxycjxxDddOVZX3KPMDHSOvpQYoYnuNLSAjk
g6236ctyKbEa5NaSQG87YLISi3sgbNZIxSLXroZ2bcvUkttkEE401F2oaEMlm2ubiKixCqXOyXhi
zQLj7wNi6TiS0jzgM/bk2OyGbPKwnDszVSWOeM6lvTVr39/+gRG13yscdoIecq/74apTFDUjm3qO
nzM59RvZnSYxga99QrJI0m5s4jPsNyLWtn4L1JztplnVYKA0j7T5v+w+tLOdhnNwps7E7Zi/hJXa
cYMP0GFCbFhCDNpUCZw4ewQdAmKziKce4AJtKvIMX6pcux5W7acOjsUimVuYQhG7zA76jsTWo1NT
XU+SWGJG/3GeysR28TTBSe29STrIyboX9mtDfu4vvO1pgu21XuNXa+L7aO9L2R8Eusg5EzAqDWLF
aguaMRa6h5n//BSMKA5O4h65oIBzB80KS9lII+n7EaxpTVxyEXBqktB/gKQQvmxqv0ROPdczINvp
WxMOETN1IeKqJaucUX9n1RXHLZvIGGEHz+o0VgdlHMqvrKPNHsqmP31QZ/DuYUqEblH8BAr3qo3g
PmB24wEwOTfuXvzuwuNcT4hv0YDqQL9Ov9FHAVGOo5e3FbBeRHnq4l/H3YpqODwNs9VhN8CPdKVv
BW7EBPDmz/cSI/ot4/UirAiT9vCdPmwLTsePwaxBVgPk6zGfqCvXkC+ImnRizshlOfLrbHYLDwR6
3jNiUdzezT/LZ1kA+axaMlfujFUhNwNHu87BeSRDgRs6rXDzRpFhjlTwuSeWQY85J0gTQs1Gl3m5
mtFXAmjR3TX7e2hZKlYqUmr1Qre211B/ydVJvAlqEtucxdkdjpih4ahsen+l8aBFVTdn7Pxj/9dx
5fAcwzN/KVpxS6sMdcxcIUZA305qjQP367isZ7cb4DjWd/B8Sr2bRYGLG9fjXNbodjVupzI8aiQc
NvRC4oi7RFK3hUOyyU+ZDhU89LoSQmPhytL3R9W+Ldo8rsv9y+VV5ijvbavMsdPJNOPVd4uznQjt
SRb3AeIItDrj3hisu5xsrASEkvHv1x+GaRBxRW0EQ5MyQPEeFD/Uc8q9XkhdotbdcM2XY+teZsQB
WXcZqCZIBI5PxeMNGtxypcMbQkC/Lo0fGv1JvnSKMKXnNVBn55RTPCNzCZjCEwy/HHNXe4snKMDB
Bn3rzl4pu9frkBHT2w1tYNLUvwcdz+z0FcjH26YCJF49s/smak9U4LORM0hbsmmSo6bC2SQMJVn7
IcQLAxBN+xXWHX2VkcKtHSJ//GgDl1ROdQ7GVPJNhF1M2nF54KfurRa3xaPql60j05toLcAMxBWm
nmwDHkrsCYeab/IsEKR1jiKfcv5kUfH5baFlAcr9Ux4KUfwKkGw8YpVVCVzadjFbXe2xByW7rE3T
Iqveo28KchMT+jTlkzDzpWiuUFlKTIHbf97kRRUTD/GgXgiZplwFZObEai2JA3znZA+GyPPqNvOx
3rHNZb/pttVIGvHqykn1O37bBMBmAbRCS/+jxAnP3qs/fhkvi9jc6sNR4MWV9KQ3s51gbANpC9Io
PtFt5YdDAmplMr5K0VCcBmc5+AEn1jgqMPV6tQJLM+NUJ34ofCj3gAuSEfnSHSjgst5Y8miKQRkg
6Bq6hrneEK6ZPITafLAHo3XzSS33ZKlBzjvGn/0c1YSxT4jpdkW1nLDMJbJauqnULUVPGwac2Wi7
Fk+okiwk1IJMrrMMcK0avwEir6tWmZ8zET6iLulespnW5f5TBQIwvdgWA0q1uo358lXQG3hd0tY3
RqFrmX1Km3hUmAfEaX9kVV9pzGTGl0LK1YLePOMIACAPOmVpMJOulLm04Lsfivf7KEDgC3dkCxD/
OD3AJoauYMrXPHkbEiTi5yxAZPsrE013MDFP/r7iQBSbpbs2FoB2Ui4BgWHpZeOH5XOEk2WbkiHV
FEdLI8MpZHRGMCYPnrCtUAsm+7Rlb/ODO/e+XS8u87e8zH74Ye6HsZBlfuiaxwv48KA9DvCg2Kg/
ch2FDUIogI5QuIR2pqBpcYBPo2a2lU5Z63qvPhCSxdTrW0rRvKZcMU07jCl39TFJFxPX6n5bsSw+
S6yQOjhvbxSpzxzvE85q1FbbmMI0ZHRzQd5mzEI0mzaZktbREYxgJeRoH/HhGpgdg8geQUxWNMz0
t2KRnOzVjCPqhQk5T5yNXuK7bemzlMjsGV1n99xQwizIYveWd9ONAfuAvedusFEkPjg3FydI/EjX
KLQM/fRsSXaymdteIvPsb6CKFVkGOiWzEpPTv9uc3KhrKQsIvyTm7M+DDbIEEDPN20h6zDp8r2R5
ZJRWQlPXAxG5UqjXEZuMXS7mPxgoHxZ4Cg5nn55PTNKuAJ4q6g==
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
