////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 02/25/2026 12:18:19 PM
//// Design Name: 
//// Module Name: marker_overlay
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////
//
//
//`timescale 1ns / 1ps
//
////module marker_overlay(
////    input clk,
////    input [10:0] x_count,      // Connect to your video timing logic
////    input [10:0] y_count,      // Connect to your video timing logic
////    input [10:0] target_x,     // final_x from centroidCore
////    input [10:0] target_y,     // final_y from centroidCore
////    input dbz_flag,            // From centroidCore (1 = no object detected)
////    input [23:0] in_p_data,    // vid_data from v_axi4s_vid_out_0
////    output reg [23:0] out_p_data, // To rgb2dvi_0 input
////    input in_hsync,
////    input in_vsync,
////    input in_valid,
////    output reg out_hsync,
////    output reg out_vsync,
////    output reg out_valid
////    );
////
////    // Box settings
////    parameter BOX_SIZE = 20;   // Half-width of the square (Total 40x40)
////    parameter THICKNESS = 2;   // Thickness of the box lines
////    parameter CROSS_LEN = 5;   // Length of each arm of the "+"
////
////    always @(posedge clk) begin
////        // If dbz_flag is 1, we don't have a valid centroid, so just pass through video
////        if (dbz_flag) begin
////            out_p_data <= in_p_data;
////        end else begin
////            // Logic to check if current pixel (x_count, y_count) is on the box perimeter
////            if (
////                // Horizontal lines (Top and Bottom)
////                //if within the top edge of the box (target_y - 20) and within the very bottom edge (target_y + 20) then draw green lines
////                (((y_count >= target_y - BOX_SIZE && y_count < target_y - BOX_SIZE + THICKNESS) || 
////                  (y_count <= target_y + BOX_SIZE && y_count > target_y + BOX_SIZE - THICKNESS)) &&
////                 (x_count >= target_x - BOX_SIZE && x_count <= target_x + BOX_SIZE)) 
////                ||
////                // Vertical lines (Left and Right)
////                (((x_count >= target_x - BOX_SIZE && x_count < target_x - BOX_SIZE + THICKNESS) || 
////                  (x_count <= target_x + BOX_SIZE && x_count > target_x + BOX_SIZE - THICKNESS)) &&
////                 (y_count >= target_y - BOX_SIZE && y_count <= target_y + BOX_SIZE))
////                ||
////                // 2. Crosshair Logic (The "+" in the middle)
////                ((x_count >= target_x - CROSS_LEN && x_count <= target_x + CROSS_LEN) && (y_count == target_y)) ||
////                ((y_count >= target_y - CROSS_LEN && y_count <= target_y + CROSS_LEN) && (x_count == target_x))
////            ) begin
////                out_p_data <= 24'h00FF00; // Bright Green
////            end else begin
////                out_p_data <= in_p_data;  // Original video pixel
////            end
////        end
////        // Pass through other signals
////        out_hsync <= in_hsync;
////        out_vsync <= in_vsync;
////        out_valid <= in_valid;
////    end
////
////endmodule
////
//
//
//`timescale 1ns / 1ps
//
//module marker_overlay(
//    input clk,
//    input rst_n,
//    
//    // Video Timing Inputs
//    input hsync_in,
//    input vsync_in,
//    input de_in,
//    input [23:0] in_p_data,
//    
//    // Video Timing Outputs (Aligned Passthrough)
//    output reg hsync_out,
//    output reg vsync_out,
//    output reg de_out,
//    output reg [23:0] out_p_data,
//    
//    // Centroid Inputs
//    input [10:0] target_x,     
//    input [10:0] target_y,     
//    input dbz_flag
//    );
//
//    // Internal Coordinate Counters
//    reg [10:0] x_count;
//    reg [10:0] y_count;
//    reg hsync_prev, vsync_prev;
//
//    // Parameters
//    parameter BOX_SIZE = 20;   
//    parameter THICKNESS = 2;   
//    parameter CROSS_LEN = 5;   
//
//    // --- 1. Coordinate Tracking Logic ---
//    always @(posedge clk) begin
//        hsync_prev <= hsync_in;
//        vsync_prev <= vsync_in;
//
//        if (!rst_n || (vsync_in && !vsync_prev)) begin 
//            x_count <= 0;
//            y_count <= 0;
//        end else if (de_in) begin
//            x_count <= x_count + 1;
//        end else if (hsync_in && !hsync_prev) begin
//            x_count <= 0;
//            y_count <= y_count + 1;
//        end
//    end
//
//    // --- 2. Synchronized Passthrough Logic ---
//    always @(posedge clk) begin
//        // Delay sync signals by 1 clock cycle to match pixel processing
//        hsync_out <= hsync_in;
//        vsync_out <= vsync_in;
//        de_out    <= de_in;
//
//        if (dbz_flag) begin
//            out_p_data <= in_p_data;
//        end else begin
//            // Bounding Box + Crosshair Logic
//            if (
//                (((y_count >= target_y - BOX_SIZE && y_count < target_y - BOX_SIZE + THICKNESS) || 
//                  (y_count <= target_y + BOX_SIZE && y_count > target_y + BOX_SIZE - THICKNESS)) &&
//                 (x_count >= target_x - BOX_SIZE && x_count <= target_x + BOX_SIZE)) 
//                ||
//                (((x_count >= target_x - BOX_SIZE && x_count < target_x - BOX_SIZE + THICKNESS) || 
//                  (x_count <= target_x + BOX_SIZE && x_count > target_x + BOX_SIZE - THICKNESS)) &&
//                 (y_count >= target_y - BOX_SIZE && y_count <= target_y + BOX_SIZE))
//                ||
//                ((x_count >= target_x - CROSS_LEN && x_count <= target_x + CROSS_LEN) && (y_count == target_y)) ||
//                ((y_count >= target_y - CROSS_LEN && y_count <= target_y + CROSS_LEN) && (x_count == target_x))
//            ) begin
//                out_p_data <= 24'h00FF00; // Green Overlay
//            end else begin
//                out_p_data <= in_p_data;  // Original Pixel
//            end
//        end
//    end
//
//endmodule


`timescale 1ns / 1ps

module marker_overlay(
    input clk,
    input rst_n,
    input debug,
    
    // Video Timing Inputs
    input hsync_in,
    input vsync_in,
    input de_in,
    input [23:0] in_p_data,
    
    // Video Timing Outputs (Aligned Passthrough)
    output reg hsync_out,
    output reg vsync_out,
    output reg de_out,
    output reg [23:0] out_p_data,
    
    // Centroid Inputs
    input [10:0] target_x,     
    input [10:0] target_y,
    input [11:0] stable_width, // NEW: Needed to scale back up
    input [11:0] stable_height,// NEW: Needed to scale back up     
    input dbz_flag
    );

    // Internal Coordinate Counters
    reg [10:0] x_count;
    reg [10:0] y_count;
    reg hsync_prev, vsync_prev;
    reg [11:0] real_x, real_y; // The actual screen coordinates

    // Parameters
    parameter BOX_SIZE = 20;   
    parameter THICKNESS = 2;   
    parameter CROSS_LEN = 5;   
    
    // --- 1. Un-normalize coordinates ---
    always @(posedge clk) begin
        // Perform the scaling: (Normalized * Resolution) / 1024
        //real_x <= (target_x * stable_width) >> 10;
        //real_y <= (target_y * stable_height) >> 10;
        real_x <= (debug) ? (12'd690) : ((target_x * 36'd1920) >> 10);
        real_y <= (debug) ? (12'd690) : ((target_y * 36'd1080) >> 10);
    end

    // --- 1. Coordinate Tracking Logic ---
    always @(posedge clk) begin
        hsync_prev <= hsync_in;
        vsync_prev <= vsync_in;

        if (!rst_n || (vsync_in && !vsync_prev)) begin 
            x_count <= 0;
            y_count <= 0;
        end else if (de_in) begin
            x_count <= x_count + 1;
        end else if (hsync_in && !hsync_prev) begin
            x_count <= 0;
            y_count <= y_count + 1;
        end
    end

    // --- 2. Synchronized Passthrough Logic ---
    always @(posedge clk) begin
        // Delay sync signals by 1 clock cycle to match pixel processing
        hsync_out <= hsync_in;
        vsync_out <= vsync_in;
        de_out    <= de_in;

        if (dbz_flag) begin
            out_p_data <= in_p_data;
        end else begin
            // Bounding Box + Crosshair Logic
            //Using real_x and real_y for drawing
            if (
//                //OLD:
//                (((y_count >= target_y - BOX_SIZE && y_count < target_y - BOX_SIZE + THICKNESS) || 
//                  (y_count <= target_y + BOX_SIZE && y_count > target_y + BOX_SIZE - THICKNESS)) &&
//                 (x_count >= target_x - BOX_SIZE && x_count <= target_x + BOX_SIZE)) 
//                ||
//                (((x_count >= target_x - BOX_SIZE && x_count < target_x - BOX_SIZE + THICKNESS) || 
//                  (x_count <= target_x + BOX_SIZE && x_count > target_x + BOX_SIZE - THICKNESS)) &&
//                 (y_count >= target_y - BOX_SIZE && y_count <= target_y + BOX_SIZE))
//                ||
//                ((x_count >= target_x - CROSS_LEN && x_count <= target_x + CROSS_LEN) && (y_count == target_y)) ||
//                ((y_count >= target_y - CROSS_LEN && y_count <= target_y + CROSS_LEN) && (x_count == target_x))
                
                //NEW:
                // Box lines...
                (((y_count >= real_y - BOX_SIZE && y_count < real_y - BOX_SIZE + THICKNESS) || 
                  (y_count <= real_y + BOX_SIZE && y_count > real_y + BOX_SIZE - THICKNESS)) &&
                 (x_count >= real_x - BOX_SIZE && x_count <= real_x + BOX_SIZE)) 
                ||
                (((x_count >= real_x - BOX_SIZE && x_count < real_x - BOX_SIZE + THICKNESS) || 
                  (x_count <= real_x + BOX_SIZE && x_count > real_x + BOX_SIZE - THICKNESS)) &&
                 (y_count >= real_y - BOX_SIZE && y_count <= real_y + BOX_SIZE))
                ||
                // Crosshair...
                ((x_count >= real_x - CROSS_LEN && x_count <= real_x + CROSS_LEN) && (y_count == real_y)) ||
                ((y_count >= real_y - CROSS_LEN && y_count <= real_y + CROSS_LEN) && (x_count == real_x))
            ) begin
                out_p_data <= 24'h00FF00; // Green Overlay
            end else begin
                out_p_data <= in_p_data;  // Original Pixel
            end
        end
    end

endmodule
