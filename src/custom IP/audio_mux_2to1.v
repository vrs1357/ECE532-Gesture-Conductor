`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2026 10:04:32 AM
// Design Name: 
// Module Name: audio_mux_2to1
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


module audio_mux_2to1 (
    input wire        sel,          // 0 = Stream A, 1 = Stream B
    
    // Stream A (Left and Right)
    input wire [23:0] streamA_L,
    input wire [23:0] streamA_R,
    
    // Stream B (Left and Right)
    input wire [23:0] streamB_L,
    input wire [23:0] streamB_R,
    
    // Output Stream
    output reg [23:0] out_L,
    output reg [23:0] out_R
);

    always @(*) begin
        if (sel) begin
            out_L = streamB_L;
            out_R = streamB_R;
        end else begin
            out_L = streamA_L;
            out_R = streamA_R;
        end
    end

endmodule
