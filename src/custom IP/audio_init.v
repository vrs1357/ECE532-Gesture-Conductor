//jn//jn`timescale 1ns / 1ps
//jn//jn//////////////////////////////////////////////////////////////////////////////////
//jn//jn// Company: 
//jn//jn// Engineer: 
//jn//jn// 
//jn//jn// Create Date: 07/08/2015 06:07:53 PM
//jn//jn// Design Name: 
//jn//jn// Module Name: audio_init
//jn//jn// Project Name: 
//jn//jn// Target Devices: 
//jn//jn// Tool Versions: 
//jn//jn// Description: 
//jn//jn// 
//jn//jn// Dependencies: 
//jn//jn// 
//jn//jn// Revision:
//jn//jn// Revision 0.01 - File Created
//jn//jn// Additional Comments:
//jn//jn// 
//jn//jn//////////////////////////////////////////////////////////////////////////////////
//jn//jn
//jn//jn
//jn//jn
//jn//jnmodule audio_init(
//jn//jn    input clk,
//jn//jn    input rst,
//jn//jn    inout sda,
//jn//jn    inout scl
//jn//jn    );
//jn//jn    parameter stRegAddr1 = 4'b0000;
//jn//jn    parameter stRegAddr2 =   4'b0001;
//jn//jn    parameter stData1 = 4'b0010;
//jn//jn    parameter stData2 = 4'b0011;
//jn//jn    parameter stError =   4'b0100;
//jn//jn    parameter stDone = 4'b0101;
//jn//jn    parameter stIdle = 4'b0110;
//jn//jn    parameter stDelay = 4'b0111;
//jn//jn    parameter stPLLsecond = 4'b1111;
//jn//jn    
//jn//jn    parameter INIT_VECTORS = 35;
//jn//jn    parameter IRD = 1'b1;//init read
//jn//jn    parameter IWR = 1'b0;//init write
//jn//jn    parameter delay = 1000*24;
//jn//jn    
//jn//jn    reg [3:0] state=stIdle;//State machine
//jn//jn    reg [32:0] initWord;
//jn//jn    reg initFbWe;
//jn//jn    reg initEn;
//jn//jn    reg [6:0]initA=0;
//jn//jn    always @(posedge(clk))begin
//jn//jn        case (initA)
//jn//jn            0: initWord <= {IWR,31'h40150100};
//jn//jn            1: initWord <= {IWR,31'h40160000};
//jn//jn            2: initWord <= {IWR,31'h40170000};
//jn//jn            3: initWord <= {IWR,31'h40F80000};
//jn//jn            4: initWord <= {IWR,31'h40191300};
//jn//jn            5: initWord <= {IWR,31'h402A0300};
//jn//jn            6: initWord <= {IWR,31'h40290300};
//jn//jn            7: initWord <= {IWR,31'h40F20100};
//jn//jn            8: initWord <= {IWR,31'h40F97F00};
//jn//jn            9: initWord <= {IWR,31'h40FA0300};
//jn//jn            
//jn//jn            10: initWord <= {IWR,31'h40200300};
//jn//jn            11: initWord <= {IWR,31'h40220100};
//jn//jn            12: initWord <= {IWR,31'h40210900};
//jn//jn            13: initWord <= {IWR,31'h4025E600};
//jn//jn            14: initWord <= {IWR,31'h4026E600};
//jn//jn            15: initWord <= {IWR,31'h40270300};
//jn//jn            16: initWord <= {IWR,31'h40100100};
//jn//jn            17: initWord <= {IWR,31'h40280000};
//jn//jn            18: initWord <= {IWR,31'h4023E600};
//jn//jn            19: initWord <= {IWR,31'h4024E600};
//jn//jn            
//jn//jn            20: initWord <= {IWR,31'h400A0100};
//jn//jn            21: initWord <= {IWR,31'h400B0500};
//jn//jn            22: initWord <= {IWR,31'h400C0100};
//jn//jn            23: initWord <= {IWR,31'h400D0500};
//jn//jn            24: initWord <= {IWR,31'h400E0300};
//jn//jn            25: initWord <= {IWR,31'h400F0300};
//jn//jn            26: initWord <= {IWR,31'h401C2100};
//jn//jn            27: initWord <= {IWR,31'h401D0000};
//jn//jn            28: initWord <= {IWR,31'h401E4100};
//jn//jn            29: initWord <= {IWR,31'h401F0000};
//jn//jn            30: initWord <= {IWR,31'h40F30100};
//jn//jn            31: initWord <= {IWR,31'h40F40000};
//jn//jn            32: initWord <= {IWR,31'h40000F00};
//jn//jn            33: initWord <= {IWR,31'h4002007D};//This sends the address of the PLL reg and the first config bits
//jn//jn            34: initWord <= {IWR,31'h000C2101}; //These are the config bytes for the PLL reg
//jn//jn        endcase
//jn//jn    end
//jn//jn    reg msg;//New message signal
//jn//jn    reg stb;//Strobe signal
//jn//jn    reg [7:0] data_i;//Data into TWI controller
//jn//jn    wire [7:0] data_o;//Data out of TWI controller
//jn//jn    wire done;
//jn//jn    wire error;
//jn//jn    wire errortype;
//jn//jn    wire [7:0] twiAddr;//Address of device on TWI
//jn//jn    reg [7:0] regData1;
//jn//jn    
//jn//jn    reg delayEn=0;
//jn//jn    integer delaycnt;
//jn//jn    
//jn//jn    
//jn//jn    assign twiAddr[7:1] = 7'b0111011;
//jn//jn
//jn//jn    assign twiAddr[0] = 0;
//jn//jn    
//jn//jn    TWICtl twi_controller(
//jn//jn            .MSG_I(msg),
//jn//jn            .STB_I(stb),
//jn//jn            .A_I(twiAddr),
//jn//jn            .D_I(data_i),
//jn//jn            .D_O(data_o),
//jn//jn            .DONE_O(done),
//jn//jn            .ERR_O(error),
//jn//jn            .CLK(clk),
//jn//jn            .SRST(rst),
//jn//jn            .SDA(sda),
//jn//jn            .SCL(scl)
//jn//jn        );
//jn//jn
//jn//jn
//jn//jn    
//jn//jnalways @(posedge(clk))begin
//jn//jn    if (delayEn==1)
//jn//jn        delaycnt<=delaycnt-1;
//jn//jn    else
//jn//jn        delaycnt<=delay;
//jn//jnend
//jn//jn
//jn//jn
//jn//jnalways @(posedge(clk))begin
//jn//jn    if (state == stData1 && done == 1 && error != 1)
//jn//jn        regData1 <= data_o;
//jn//jnend
//jn//jn
//jn//jn
//jn//jnalways @(posedge(clk))begin
//jn//jn    if (rst==1)begin
//jn//jn        state<= stIdle;
//jn//jn        delayEn <= 0;
//jn//jn        initA <=0;
//jn//jn        end
//jn//jn    else begin
//jn//jn        data_i <= "--------";
//jn//jn        stb <= 0;
//jn//jn        msg <= 0;
//jn//jn        
//jn//jn        initFbWe <= 0;
//jn//jn        case (state) 
//jn//jn            stRegAddr1: begin// Sends x40
//jn//jn                if (done == 1)begin
//jn//jn                    if (error == 1) 
//jn//jn                        state <= stError;
//jn//jn                    else
//jn//jn                        state <= stRegAddr2;
//jn//jn                end
//jn//jn                data_i <= initWord[31:24];
//jn//jn                stb <= 1;
//jn//jn                msg <= 1;
//jn//jn            end
//jn//jn            stRegAddr2: begin    //Sends register address x40(XX)
//jn//jn                if (done == 1)begin
//jn//jn                    if (error == 1)
//jn//jn                        state <= stError;
//jn//jn                    else
//jn//jn                        state <= stData1;
//jn//jn                end
//jn//jn                data_i <= initWord[23:16];
//jn//jn                stb <= 1;
//jn//jn            end
//jn//jn            stData1: begin
//jn//jn                if (done == 1) begin
//jn//jn                    if (error == 1)
//jn//jn                        state <= stError;
//jn//jn                    else begin
//jn//jn                        if (initWord[7:0]!=0)//If there is another byte, send it
//jn//jn                            state <= stData2;
//jn//jn                        else begin//no more bytes to send
//jn//jn                            initEn <= 1;
//jn//jn                            
//jn//jn                            if (initA == INIT_VECTORS-1)//Done with all instructions
//jn//jn                                state <= stDone;
//jn//jn                            else            //Only 3 bytes to send
//jn//jn                                state <= stDelay;
//jn//jn                        end
//jn//jn                    end
//jn//jn                end
//jn//jn                if (initWord[32] == 1) msg <= 1;
//jn//jn                data_i <= initWord[15:8];
//jn//jn                stb <= 1;
//jn//jn            end
//jn//jn            stData2: begin
//jn//jn                if (done == 1)begin
//jn//jn                    if (error == 1)
//jn//jn                        state <= stError;
//jn//jn                    else begin
//jn//jn                        initEn<=1;
//jn//jn                        if (initWord[32] == 1) initFbWe <= 1;
//jn//jn                        if (initWord[23:16]== 8'h02)begin//If its the PLL register
//jn//jn                            initA<=initA+1;//Move initWord to the remaining PLL config bits
//jn//jn                            state <= stPLLsecond;//And send them
//jn//jn                        end
//jn//jn                        else if (initA == INIT_VECTORS-1)
//jn//jn                            state <= stDone;
//jn//jn                        else
//jn//jn                            state <= stDelay;
//jn//jn                    end
//jn//jn                end
//jn//jn                data_i <= initWord[7:0];
//jn//jn                stb <= 1;
//jn//jn            end
//jn//jn            stPLLsecond:begin
//jn//jn                if (done == 1)begin
//jn//jn                    if (error == 1) 
//jn//jn                        state <= stError;
//jn//jn                    else
//jn//jn                        state <= stRegAddr2;
//jn//jn                end
//jn//jn                data_i <= initWord[31:24];
//jn//jn                stb <= 1;
//jn//jn            end
//jn//jn            stError: begin
//jn//jn                state <= stRegAddr1;
//jn//jn            end
//jn//jn            stDone: begin
//jn//jn            end
//jn//jn            stIdle:begin
//jn//jn                state <= stRegAddr1;
//jn//jn            end
//jn//jn            stDelay:begin
//jn//jn                delayEn <= 1;
//jn//jn                if (delaycnt==0)begin
//jn//jn                    delayEn<=0;
//jn//jn                    if (initEn)begin
//jn//jn                        initA<=initA+1;
//jn//jn                        initEn <= 0;
//jn//jn                    end
//jn//jn                    state<=stRegAddr1;
//jn//jn                end
//jn//jn            end
//jn//jn        endcase
//jn//jn    end
//jn//jnend
//jn//jnendmodule
//jn
//jn// CONVERT FROM INOUT to TRI-WIRE
//jn`timescale 1ns / 1ps
//jn
//jnmodule audio_init(
//jn    input clk,
//jn    input rst,
//jn    // New 3-wire interfaces for SCL and SDA
//jn    input  scl_i,
//jn    output scl_o,
//jn    output scl_t,
//jn    input  sda_i,
//jn    output sda_o,
//jn    output sda_t
//jn    );
//jn    
//jn    parameter stRegAddr1 = 4'b0000;
//jn    parameter stRegAddr2 = 4'b0001;
//jn    parameter stData1    = 4'b0010;
//jn    parameter stData2    = 4'b0011;
//jn    parameter stError    = 4'b0100;
//jn    parameter stDone     = 4'b0101;
//jn    parameter stIdle     = 4'b0110;
//jn    parameter stDelay    = 4'b0111;
//jn    parameter stPLLsecond = 4'b1111;
//jn    
//jn    parameter INIT_VECTORS = 35;
//jn    parameter IRD = 1'b1; // init read
//jn    parameter IWR = 1'b0; // init write
//jn    parameter delay = 1000*24;
//jn    
//jn    reg [3:0] state = stIdle;
//jn    reg [32:0] initWord;
//jn    reg initFbWe;
//jn    reg initEn;
//jn    reg [6:0] initA = 0;
//jn
//jn    // ROM for initialization vectors
//jn    always @(posedge(clk)) begin
//jn        case (initA)
//jn            0:  initWord <= {IWR,31'h40150100};
//jn            1:  initWord <= {IWR,31'h40160000};
//jn            2:  initWord <= {IWR,31'h40170000};
//jn            3:  initWord <= {IWR,31'h40F80000};
//jn            4:  initWord <= {IWR,31'h40191300};
//jn            5:  initWord <= {IWR,31'h402A0300};
//jn            6:  initWord <= {IWR,31'h40290300};
//jn            7:  initWord <= {IWR,31'h40F20100};
//jn            8:  initWord <= {IWR,31'h40F97F00};
//jn            9:  initWord <= {IWR,31'h40FA0300};
//jn            10: initWord <= {IWR,31'h40200300};
//jn            11: initWord <= {IWR,31'h40220100};
//jn            12: initWord <= {IWR,31'h40210900};
//jn            13: initWord <= {IWR,31'h4025E600};
//jn            14: initWord <= {IWR,31'h4026E600};
//jn            15: initWord <= {IWR,31'h40270300};
//jn            16: initWord <= {IWR,31'h40100100};
//jn            17: initWord <= {IWR,31'h40280000};
//jn            18: initWord <= {IWR,31'h4023E600};
//jn            19: initWord <= {IWR,31'h4024E600};
//jn            20: initWord <= {IWR,31'h400A0100};
//jn            21: initWord <= {IWR,31'h400B0500};
//jn            22: initWord <= {IWR,31'h400C0100};
//jn            23: initWord <= {IWR,31'h400D0500};
//jn            24: initWord <= {IWR,31'h400E0300};
//jn            25: initWord <= {IWR,31'h400F0300};
//jn            26: initWord <= {IWR,31'h401C2100};
//jn            27: initWord <= {IWR,31'h401D0000};
//jn            28: initWord <= {IWR,31'h401E4100};
//jn            29: initWord <= {IWR,31'h401F0000};
//jn            30: initWord <= {IWR,31'h40F30100};
//jn            31: initWord <= {IWR,31'h40F40000};
//jn            32: initWord <= {IWR,31'h40000F00};
//jn            33: initWord <= {IWR,31'h4002007D};
//jn            34: initWord <= {IWR,31'h000C2101};
//jn            default: initWord <= 33'h0;
//jn        endcase
//jn    end
//jn
//jn    reg msg;
//jn    reg stb;
//jn    reg [7:0] data_i;
//jn    wire [7:0] data_o;
//jn    wire done;
//jn    wire error;
//jn    wire [7:0] twiAddr;
//jn    reg [7:0] regData1;
//jn    reg delayEn = 0;
//jn    integer delaycnt;
//jn
//jn    assign twiAddr[7:1] = 7'b0111011; // 0x3B
//jn    assign twiAddr[0]   = 0;
//jn
//jn    // Instantiate updated VHDL TWICtl with 3-wire interface
//jn    TWICtl twi_controller(
//jn        .MSG_I(msg),
//jn        .STB_I(stb),
//jn        .A_I(twiAddr),
//jn        .D_I(data_i),
//jn        .D_O(data_o),
//jn        .DONE_O(done),
//jn        .ERR_O(error),
//jn        .CLK(clk),
//jn        .SRST(rst),
//jn        // Connect triplet signals directly to top-level ports
//jn        .SDA_I(sda_i),
//jn        .SDA_O(sda_o),
//jn        .SDA_T(sda_t),
//jn        .SCL_I(scl_i),
//jn        .SCL_O(scl_o),
//jn        .SCL_T(scl_t)
//jn    );
//jn
//jn    // Delay Counter logic
//jn    always @(posedge(clk)) begin
//jn        if (delayEn == 1)
//jn            delaycnt <= delaycnt - 1;
//jn        else
//jn            delaycnt <= delay;
//jn    end
//jn
//jn    // Data Latch
//jn    always @(posedge(clk)) begin
//jn        if (state == stData1 && done == 1 && error != 1)
//jn            regData1 <= data_o;
//jn    end
//jn
//jn    // State Machine logic
//jn    always @(posedge(clk)) begin
//jn        if (rst == 1) begin
//jn            state   <= stIdle;
//jn            delayEn <= 0;
//jn            initA   <= 0;
//jn            initEn  <= 0;
//jn        end else begin
//jn            data_i   <= 8'h00;
//jn            stb      <= 0;
//jn            msg      <= 0;
//jn            initFbWe <= 0;
//jn            
//jn            case (state) 
//jn                stRegAddr1: begin
//jn                    if (done == 1) begin
//jn                        state <= (error == 1) ? stError : stRegAddr2;
//jn                    end
//jn                    data_i <= initWord[31:24];
//jn                    stb <= 1;
//jn                    msg <= 1;
//jn                end
//jn                
//jn                stRegAddr2: begin
//jn                    if (done == 1) begin
//jn                        state <= (error == 1) ? stError : stData1;
//jn                    end
//jn                    data_i <= initWord[23:16];
//jn                    stb <= 1;
//jn                end
//jn                
//jn                stData1: begin
//jn                    if (done == 1) begin
//jn                        if (error == 1)
//jn                            state <= stError;
//jn                        else begin
//jn                            if (initWord[7:0] != 0)
//jn                                state <= stData2;
//jn                            else begin
//jn                                initEn <= 1;
//jn                                state <= (initA == INIT_VECTORS-1) ? stDone : stDelay;
//jn                            end
//jn                        end
//jn                    end
//jn                    if (initWord[32] == 1) msg <= 1;
//jn                    data_i <= initWord[15:8];
//jn                    stb <= 1;
//jn                end
//jn                
//jn                stData2: begin
//jn                    if (done == 1) begin
//jn                        if (error == 1)
//jn                            state <= stError;
//jn                        else begin
//jn                            initEn <= 1;
//jn                            if (initWord[32] == 1) initFbWe <= 1;
//jn                            
//jn                            if (initWord[23:16] == 8'h02) begin
//jn                                initA <= initA + 1;
//jn                                state <= stPLLsecond;
//jn                            end else begin
//jn                                state <= (initA == INIT_VECTORS-1) ? stDone : stDelay;
//jn                            end
//jn                        end
//jn                    end
//jn                    data_i <= initWord[7:0];
//jn                    stb <= 1;
//jn                end
//jn                
//jn                stPLLsecond: begin
//jn                    if (done == 1) begin
//jn                        state <= (error == 1) ? stError : stRegAddr2;
//jn                    end
//jn                    data_i <= initWord[31:24];
//jn                    stb <= 1;
//jn                end
//jn                
//jn                stError: state <= stRegAddr1;
//jn                stDone:  begin /* Stay here */ end
//jn                stIdle:  state <= stRegAddr1;
//jn                
//jn                stDelay: begin
//jn                    delayEn <= 1;
//jn                    if (delaycnt == 0) begin
//jn                        delayEn <= 0;
//jn                        if (initEn) begin
//jn                            initA <= initA + 1;
//jn                            initEn <= 0;
//jn                        end
//jn                        state <= stRegAddr1;
//jn                    end
//jn                end
//jn                default: state <= stIdle;
//jn            endcase
//jn        end
//jn    end
//jnendmodule


`timescale 1ns / 1ps

module audio_init(
    input clk,
    input rst,
    // Using Xilinx naming convention to force Interface Grouping in Block Diagram
    input  IIC_SCL_I,
    output IIC_SCL_O,
    output IIC_SCL_T,
    input  IIC_SDA_I,
    output IIC_SDA_O,
    output IIC_SDA_T
    );
    
    parameter stRegAddr1 = 4'b0000;
    parameter stRegAddr2 = 4'b0001;
    parameter stData1    = 4'b0010;
    parameter stData2    = 4'b0011;
    parameter stError    = 4'b0100;
    parameter stDone     = 4'b0101;
    parameter stIdle     = 4'b0110;
    parameter stDelay    = 4'b0111;
    parameter stPLLsecond = 4'b1111;
    
    parameter INIT_VECTORS = 35;
    parameter IRD = 1'b1; // init read
    parameter IWR = 1'b0; // init write
    parameter delay = 1000*24;
    
    reg [3:0] state = stIdle;
    reg [32:0] initWord;
    reg initFbWe;
    reg initEn;
    reg [6:0] initA = 0;

    // ROM for initialization vectors
    always @(posedge(clk)) begin
        case (initA)
            0:  initWord <= {IWR,31'h40150100};
            1:  initWord <= {IWR,31'h40160000};
            2:  initWord <= {IWR,31'h40170000};
            3:  initWord <= {IWR,31'h40F80000};
            4:  initWord <= {IWR,31'h40191300};
            5:  initWord <= {IWR,31'h402A0300};
            6:  initWord <= {IWR,31'h40290300};
            7:  initWord <= {IWR,31'h40F20100};
            8:  initWord <= {IWR,31'h40F97F00};
            9:  initWord <= {IWR,31'h40FA0300};
            10: initWord <= {IWR,31'h40200300};
            11: initWord <= {IWR,31'h40220100};
            12: initWord <= {IWR,31'h40210900};
            13: initWord <= {IWR,31'h4025E600};
            14: initWord <= {IWR,31'h4026E600};
            15: initWord <= {IWR,31'h40270300};
            16: initWord <= {IWR,31'h40100100};
            17: initWord <= {IWR,31'h40280000};
            18: initWord <= {IWR,31'h4023E600};
            19: initWord <= {IWR,31'h4024E600};
            20: initWord <= {IWR,31'h400A0100};
            21: initWord <= {IWR,31'h400B0500};
            22: initWord <= {IWR,31'h400C0100};
            23: initWord <= {IWR,31'h400D0500};
            24: initWord <= {IWR,31'h400E0300};
            25: initWord <= {IWR,31'h400F0300};
            26: initWord <= {IWR,31'h401C2100};
            27: initWord <= {IWR,31'h401D0000};
            28: initWord <= {IWR,31'h401E4100};
            29: initWord <= {IWR,31'h401F0000};
            30: initWord <= {IWR,31'h40F30100};
            31: initWord <= {IWR,31'h40F40000};
            32: initWord <= {IWR,31'h40000F00};
            33: initWord <= {IWR,31'h4002007D};
            34: initWord <= {IWR,31'h000C2101};
            default: initWord <= 33'h0;
        endcase
    end

    reg msg;
    reg stb;
    reg [7:0] data_i;
    wire [7:0] data_o;
    wire done;
    wire error;
    wire [7:0] twiAddr;
    reg [7:0] regData1;
    reg delayEn = 0;
    integer delaycnt;

    assign twiAddr[7:1] = 7'b0111011; // 0x3B
    assign twiAddr[0]   = 0;

    // Instantiate updated VHDL TWICtl with 3-wire interface
    TWICtl twi_controller(
        .MSG_I(msg),
        .STB_I(stb),
        .A_I(twiAddr),
        .D_I(data_i),
        .D_O(data_o),
        .DONE_O(done),
        .ERR_O(error),
        .CLK(clk),
        .SRST(rst),
        // Connect to the new IIC_ naming convention ports
        .SDA_I(IIC_SDA_I),
        .SDA_O(IIC_SDA_O),
        .SDA_T(IIC_SDA_T),
        .SCL_I(IIC_SCL_I),
        .SCL_O(IIC_SCL_O),
        .SCL_T(IIC_SCL_T)
    );

    // Delay Counter logic
    always @(posedge(clk)) begin
        if (delayEn == 1)
            delaycnt <= delaycnt - 1;
        else
            delaycnt <= delay;
    end

    // Data Latch
    always @(posedge(clk)) begin
        if (state == stData1 && done == 1 && error != 1)
            regData1 <= data_o;
    end

    // State Machine logic
    always @(posedge(clk)) begin
        if (rst == 1) begin
            state   <= stIdle;
            delayEn <= 0;
            initA   <= 0;
            initEn  <= 0;
        end else begin
            data_i   <= 8'h00;
            stb      <= 0;
            msg      <= 0;
            initFbWe <= 0;
            
            case (state) 
                stRegAddr1: begin
                    if (done == 1) begin
                        state <= (error == 1) ? stError : stRegAddr2;
                    end
                    data_i <= initWord[31:24];
                    stb <= 1;
                    msg <= 1;
                end
                
                stRegAddr2: begin
                    if (done == 1) begin
                        state <= (error == 1) ? stError : stData1;
                    end
                    data_i <= initWord[23:16];
                    stb <= 1;
                end
                
                stData1: begin
                    if (done == 1) begin
                        if (error == 1)
                            state <= stError;
                        else begin
                            if (initWord[7:0] != 0)
                                state <= stData2;
                            else begin
                                initEn <= 1;
                                state <= (initA == INIT_VECTORS-1) ? stDone : stDelay;
                            end
                        end
                    end
                    if (initWord[32] == 1) msg <= 1;
                    data_i <= initWord[15:8];
                    stb <= 1;
                end
                
                stData2: begin
                    if (done == 1) begin
                        if (error == 1)
                            state <= stError;
                        else begin
                            initEn <= 1;
                            if (initWord[32] == 1) initFbWe <= 1;
                            
                            if (initWord[23:16] == 8'h02) begin
                                initA <= initA + 1;
                                state <= stPLLsecond;
                            end else begin
                                state <= (initA == INIT_VECTORS-1) ? stDone : stDelay;
                            end
                        end
                    end
                    data_i <= initWord[7:0];
                    stb <= 1;
                end
                
                stPLLsecond: begin
                    if (done == 1) begin
                        state <= (error == 1) ? stError : stRegAddr2;
                    end
                    data_i <= initWord[31:24];
                    stb <= 1;
                end
                
                stError: state <= stRegAddr1;
                stDone:  begin /* Stay here */ end
                stIdle:  state <= stRegAddr1;
                
                stDelay: begin
                    delayEn <= 1;
                    if (delaycnt == 0) begin
                        delayEn <= 0;
                        if (initEn) begin
                            initA <= initA + 1;
                            initEn <= 0;
                        end
                        state <= stRegAddr1;
                    end
                end
                default: state <= stIdle;
            endcase
        end
    end
endmodule
