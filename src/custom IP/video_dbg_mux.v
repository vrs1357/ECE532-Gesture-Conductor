`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2026 08:06:17 PM
// Design Name: 
// Module Name: video_dbg_mux
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


module video_dbg_mux (
    input  wire        clk,
    input  wire [1:0]  sel, 
   
    input  wire [23:0] raw_data,
    input  wire        raw_vsync, raw_hsync, raw_de,

    input  wire [23:0] hsv_data,
    input  wire        hsv_vsync, hsv_hsync, hsv_de, 

    input  wire        is_red, 
    input  wire        is_blue,
    
    output reg  [23:0] out_data,
    output reg         out_vsync, out_hsync, out_de
);

    // Pipeline video input so they align with HSV calculation, and is_red check in other blocks
    reg [23:0] raw_pipe [0:7];
    integer i;
    always @(posedge clk) begin
        raw_pipe[0] <= raw_data;
        for (i = 1; i < 8; i = i + 1) begin
            raw_pipe[i] <= raw_pipe[i-1];
        end
    end

    reg [3:0] v_det_pipe, h_det_pipe, de_det_pipe;
    always @(posedge clk) begin
        v_det_pipe  <= {v_det_pipe[2:0],  hsv_vsync};
        h_det_pipe  <= {h_det_pipe[2:0],  hsv_hsync};
        de_det_pipe <= {de_det_pipe[2:0], hsv_de};
    end

    
    always @(posedge clk) begin
        case (sel)
            2'b00: begin // Standard output
                out_data  <= raw_data;
                out_vsync <= raw_vsync;
                out_hsync <= raw_hsync;
                out_de    <= raw_de;
            end
            
            2'b01: begin // Output is_blue view for debug
                //out_data  <= hsv_data;
                //out_vsync <= hsv_vsync;
                //out_hsync <= hsv_hsync;
                //out_de    <= hsv_de;
                out_data  <= (is_blue) ? 24'h00FF00 : 24'h000000;
                out_vsync <= v_det_pipe[3];
                out_hsync <= h_det_pipe[3];
                out_de    <= de_det_pipe[3];
            end
            
            2'b10: begin // Output is_red view for debug
                out_data  <= (is_red) ? 24'hFF0000 : 24'h000000;
                out_vsync <= v_det_pipe[3];
                out_hsync <= h_det_pipe[3];
                out_de    <= de_det_pipe[3];
            end
            
            2'b11: begin // Output is_red on-top of normal stream for debug
                out_data  <= (is_red) ? 24'hFF0000 : raw_pipe[7];
                out_vsync <= v_det_pipe[3];
                out_hsync <= h_det_pipe[3];
                out_de    <= de_det_pipe[3];
            end
        endcase
    end

endmodule
