`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2026 12:19:40 PM
// Design Name: 
// Module Name: rgb2hsv
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rgb2hsv (
    input  wire        clk,
    input  wire [23:0] rgb_in,
    input  wire        i_v_sync, i_h_sync, i_de,
    output wire [23:0] hsv_out,
    output reg         o_v_sync, o_h_sync, o_de
);

    // ROM set-up for fixed-point arithmetic for hue and saturation calculations to avoid costly division logic
    (* ram_style = "block" *) reg [21:0] hue_rom [0:255]; 
    (* ram_style = "block" *) reg [23:0] sat_rom [0:255];
    
    integer i;
    initial begin
        hue_rom[0] = 22'd0; sat_rom[0] = 24'd0;
        for (i = 1; i < 256; i = i + 1) begin
            hue_rom[i] = 2785280 / i; // Determine {60 deg * (Diff / Delta)} by doing {(Diff * hue_rom[Delta]) >> 16}
            sat_rom[i] = 16711680 / i; // Determine {(Delta/V) * 255} by doing {(Delta * sat_rom[V]) >> 16}
        end
    end
    
    // Input flops
    reg [7:0] r0, g0, b0;               
    reg v0, h0, de0;

    // First step calculation
    reg [7:0] max1, delta1;             
    reg [1:0] max_sel1;
    reg signed [8:0] num1;
    
    // BRAM access flopping
    reg [7:0] max2, delta2;             
    reg [1:0] max_sel2;
    reg signed [8:0] num2;

    // Second step calculation setup
    reg [21:0] inv_delta3;              
    reg [23:0] inv_max3;
    reg [7:0]  max3, delta3;
    reg [1:0]  max_sel3;
    reg signed [8:0] num3;
    
    // Product calculations
    reg signed [31:0] h_prod4;          
    reg [31:0] s_prod4;
    reg [7:0]  max4, delta4;
    reg [1:0]  max_sel4;

    // Output flops
    reg [7:0] h_final, s_final, v_final; 

    reg [3:0] v_p, h_p, de_p;           

    assign hsv_out = {h_final, s_final, v_final};

    // Flop inputs for timing
    always @(posedge clk) begin
        r0 <= rgb_in[23:16]; g0 <= rgb_in[7:0]; b0 <= rgb_in[15:8];
        v0 <= i_v_sync; h0 <= i_h_sync; de0 <= i_de;
    end

    // Calculate the Value (Max), Delta (Max - Min), and Hue Numerator (G-B / B-R / R-G)
    always @(posedge clk) begin
        if (r0 >= g0 && r0 >= b0) begin
            max1 <= r0; max_sel1 <= 2'd0;
            delta1 <= r0 - ((g0 < b0) ? g0 : b0);
            num1 <= $signed({1'b0, g0}) - $signed({1'b0, b0});
        end else if (g0 >= r0 && g0 >= b0) begin
            max1 <= g0; max_sel1 <= 2'd1;
            delta1 <= g0 - ((r0 < b0) ? r0 : b0);
            num1 <= $signed({1'b0, b0}) - $signed({1'b0, r0});
        end else begin
            max1 <= b0; max_sel1 <= 2'd2;
            delta1 <= b0 - ((r0 < g0) ? r0 : g0);
            num1 <= $signed({1'b0, r0}) - $signed({1'b0, g0});
        end
    end

    // Pipeline for ROM access
    always @(posedge clk) begin
        max2 <= max1; delta2 <= delta1; max_sel2 <= max_sel1; num2 <= num1;
    end

    // Get matching required ROM value for Hue/Sat calculation, pipeline matching unused values
    always @(posedge clk) begin
        inv_delta3 <= hue_rom[delta2];
        inv_max3   <= sat_rom[max2];
        max3 <= max2; delta3 <= delta2; max_sel3 <= max_sel2; num3 <= num2;
    end

    // Multiplication for Hue/Sat calculation, pipeline matching unused values
    always @(posedge clk) begin
        h_prod4 <= num3 * $signed({1'b0, inv_delta3});
        s_prod4 <= delta3 * inv_max3;
        max4 <= max3; delta4 <= delta3; max_sel4 <= max_sel3;
    end

    // Determine final Hue/Sat with bit truncation for >> 16
    always @(posedge clk) begin
        v_final <= max4;
        s_final <= (max4 == 0) ? 8'd0 : s_prod4[23:16];
        if (delta4 == 0) h_final <= 8'd0;
        else begin
            case (max_sel4)
                2'd0: h_final <= (h_prod4[31]) ? (8'd255 + h_prod4[23:16]) : h_prod4[23:16];
                2'd1: h_final <= 8'd85  + h_prod4[23:16]; 
                2'd2: h_final <= 8'd170 + h_prod4[23:16]; 
                default: h_final <= 8'd0;
            endcase
        end
    end

    // Pipeline vsync and hsync signals to match output
    always @(posedge clk) begin
        v_p  <= {v_p[2:0], v0};
        h_p  <= {h_p[2:0], h0};
        de_p <= {de_p[2:0], de0};
        o_v_sync <= v_p[3]; o_h_sync <= h_p[3]; o_de <= de_p[3];
    end

endmodule
