//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
//Date        : Fri Mar 27 16:24:55 2026
//Host        : cong-ThinkPad-T440 running 64-bit Ubuntu 25.10
//Command     : generate_target hdmi_wrapper.bd
//Design      : hdmi_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module hdmi_wrapper
   (DDC_scl_io,
    DDC_sda_io,
    DDR3_addr,
    DDR3_ba,
    DDR3_cas_n,
    DDR3_ck_n,
    DDR3_ck_p,
    DDR3_cke,
    DDR3_dm,
    DDR3_dq,
    DDR3_dqs_n,
    DDR3_dqs_p,
    DDR3_odt,
    DDR3_ras_n,
    DDR3_reset_n,
    DDR3_we_n,
    IIC_SCL_I_0,
    IIC_SCL_O_0,
    IIC_SCL_T_0,
    IIC_SDA_I_0,
    IIC_SDA_O_0,
    IIC_SDA_T_0,
    TMDS_IN_clk_n,
    TMDS_IN_clk_p,
    TMDS_IN_data_n,
    TMDS_IN_data_p,
    TMDS_OUT_clk_n,
    TMDS_OUT_clk_p,
    TMDS_OUT_data_n,
    TMDS_OUT_data_p,
    ac_adc_sdata,
    ac_bclk,
    ac_dac_sdata,
    ac_lrclk,
    ac_mclk,
    hdmi_hpd,
    hdmi_rx_txen,
    led,
    reset,
    sw,
    sys_clk_i,
    usb_uart_rxd,
    usb_uart_txd);
  inout DDC_scl_io;
  inout DDC_sda_io;
  output [14:0]DDR3_addr;
  output [2:0]DDR3_ba;
  output DDR3_cas_n;
  output [0:0]DDR3_ck_n;
  output [0:0]DDR3_ck_p;
  output [0:0]DDR3_cke;
  output [1:0]DDR3_dm;
  inout [15:0]DDR3_dq;
  inout [1:0]DDR3_dqs_n;
  inout [1:0]DDR3_dqs_p;
  output [0:0]DDR3_odt;
  output DDR3_ras_n;
  output DDR3_reset_n;
  output DDR3_we_n;
  input IIC_SCL_I_0;
  output IIC_SCL_O_0;
  output IIC_SCL_T_0;
  input IIC_SDA_I_0;
  output IIC_SDA_O_0;
  output IIC_SDA_T_0;
  input TMDS_IN_clk_n;
  input TMDS_IN_clk_p;
  input [2:0]TMDS_IN_data_n;
  input [2:0]TMDS_IN_data_p;
  output TMDS_OUT_clk_n;
  output TMDS_OUT_clk_p;
  output [2:0]TMDS_OUT_data_n;
  output [2:0]TMDS_OUT_data_p;
  input ac_adc_sdata;
  output ac_bclk;
  output ac_dac_sdata;
  output ac_lrclk;
  output ac_mclk;
  output [0:0]hdmi_hpd;
  output [0:0]hdmi_rx_txen;
  output [7:0]led;
  input reset;
  input [7:0]sw;
  input sys_clk_i;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire DDC_scl_i;
  wire DDC_scl_io;
  wire DDC_scl_o;
  wire DDC_scl_t;
  wire DDC_sda_i;
  wire DDC_sda_io;
  wire DDC_sda_o;
  wire DDC_sda_t;
  wire [14:0]DDR3_addr;
  wire [2:0]DDR3_ba;
  wire DDR3_cas_n;
  wire [0:0]DDR3_ck_n;
  wire [0:0]DDR3_ck_p;
  wire [0:0]DDR3_cke;
  wire [1:0]DDR3_dm;
  wire [15:0]DDR3_dq;
  wire [1:0]DDR3_dqs_n;
  wire [1:0]DDR3_dqs_p;
  wire [0:0]DDR3_odt;
  wire DDR3_ras_n;
  wire DDR3_reset_n;
  wire DDR3_we_n;
  wire IIC_SCL_I_0;
  wire IIC_SCL_O_0;
  wire IIC_SCL_T_0;
  wire IIC_SDA_I_0;
  wire IIC_SDA_O_0;
  wire IIC_SDA_T_0;
  wire TMDS_IN_clk_n;
  wire TMDS_IN_clk_p;
  wire [2:0]TMDS_IN_data_n;
  wire [2:0]TMDS_IN_data_p;
  wire TMDS_OUT_clk_n;
  wire TMDS_OUT_clk_p;
  wire [2:0]TMDS_OUT_data_n;
  wire [2:0]TMDS_OUT_data_p;
  wire ac_adc_sdata;
  wire ac_bclk;
  wire ac_dac_sdata;
  wire ac_lrclk;
  wire ac_mclk;
  wire [0:0]hdmi_hpd;
  wire [0:0]hdmi_rx_txen;
  wire [7:0]led;
  wire reset;
  wire [7:0]sw;
  wire sys_clk_i;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  IOBUF DDC_scl_iobuf
       (.I(DDC_scl_o),
        .IO(DDC_scl_io),
        .O(DDC_scl_i),
        .T(DDC_scl_t));
  IOBUF DDC_sda_iobuf
       (.I(DDC_sda_o),
        .IO(DDC_sda_io),
        .O(DDC_sda_i),
        .T(DDC_sda_t));
  hdmi hdmi_i
       (.DDC_scl_i(DDC_scl_i),
        .DDC_scl_o(DDC_scl_o),
        .DDC_scl_t(DDC_scl_t),
        .DDC_sda_i(DDC_sda_i),
        .DDC_sda_o(DDC_sda_o),
        .DDC_sda_t(DDC_sda_t),
        .DDR3_addr(DDR3_addr),
        .DDR3_ba(DDR3_ba),
        .DDR3_cas_n(DDR3_cas_n),
        .DDR3_ck_n(DDR3_ck_n),
        .DDR3_ck_p(DDR3_ck_p),
        .DDR3_cke(DDR3_cke),
        .DDR3_dm(DDR3_dm),
        .DDR3_dq(DDR3_dq),
        .DDR3_dqs_n(DDR3_dqs_n),
        .DDR3_dqs_p(DDR3_dqs_p),
        .DDR3_odt(DDR3_odt),
        .DDR3_ras_n(DDR3_ras_n),
        .DDR3_reset_n(DDR3_reset_n),
        .DDR3_we_n(DDR3_we_n),
        .IIC_SCL_I_0(IIC_SCL_I_0),
        .IIC_SCL_O_0(IIC_SCL_O_0),
        .IIC_SCL_T_0(IIC_SCL_T_0),
        .IIC_SDA_I_0(IIC_SDA_I_0),
        .IIC_SDA_O_0(IIC_SDA_O_0),
        .IIC_SDA_T_0(IIC_SDA_T_0),
        .TMDS_IN_clk_n(TMDS_IN_clk_n),
        .TMDS_IN_clk_p(TMDS_IN_clk_p),
        .TMDS_IN_data_n(TMDS_IN_data_n),
        .TMDS_IN_data_p(TMDS_IN_data_p),
        .TMDS_OUT_clk_n(TMDS_OUT_clk_n),
        .TMDS_OUT_clk_p(TMDS_OUT_clk_p),
        .TMDS_OUT_data_n(TMDS_OUT_data_n),
        .TMDS_OUT_data_p(TMDS_OUT_data_p),
        .ac_adc_sdata(ac_adc_sdata),
        .ac_bclk(ac_bclk),
        .ac_dac_sdata(ac_dac_sdata),
        .ac_lrclk(ac_lrclk),
        .ac_mclk(ac_mclk),
        .hdmi_hpd(hdmi_hpd),
        .hdmi_rx_txen(hdmi_rx_txen),
        .led(led),
        .reset(reset),
        .sw(sw),
        .sys_clk_i(sys_clk_i),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
endmodule
