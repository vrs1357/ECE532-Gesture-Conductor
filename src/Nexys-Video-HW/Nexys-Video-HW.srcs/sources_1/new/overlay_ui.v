`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2026 10:09:01 AM
// Design Name: 
// Module Name: overlay_ui
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

module overlay_ui (
    input clk,
    input rst_n,
    input debug,

    // Video Timing Signals
    input hsync_in, 
    input vsync_in, 
    input de_in,
    input [23:0] in_p_data,

    output reg hsync_out, 
    output reg vsync_out, 
    output reg de_out,
    output reg [23:0] out_p_data,

    // Centroid Inputs (0-1023 normalized)
    input [10:0] t1_x, input [10:0] t1_y, 
    input [10:0] t2_x, input [10:0] t2_y,
    input dbz_flag 
);

    reg [11:0] x_cnt, y_cnt;
    reg hs_prev, vs_prev;
    reg [11:0] r1_x, r1_y, r2_x, r2_y;
    
    // Parameters for the marker and the text region and pitch
    parameter BOX_SIZE  = 20;   
    parameter THICKNESS = 2;   
    parameter CROSS_LEN = 5; 
    parameter START_Y   = 100;
    parameter TEXT_X_START = 100;
    parameter HORIZ_PITCH  = 32;
    
    // Normalize coordinates from the centroid detector to the 1080p video stream
    always @(posedge clk) begin
        r1_x <= (debug) ? 12'd600  : ((t1_x * 36'd1920) >> 10);
        r1_y <= (debug) ? 12'd400  : (((11'd1023 - t1_y) * 36'd1080) >> 10);
        r2_x <= (debug) ? 12'd1200 : ((t2_x * 36'd1920) >> 10);
        r2_y <= (debug) ? 12'd700  : (((11'd1023 - t2_y) * 36'd1080) >> 10);
        
        // Determine the current pixel value dependant on the status of vsync and hsync
        hs_prev <= hsync_in; vs_prev <= vsync_in;
        if (!rst_n || (vsync_in && !vs_prev)) begin
            x_cnt <= 0; y_cnt <= 0;
        end else if (de_in) begin
            x_cnt <= x_cnt + 1;
        end else if (hsync_in && !hs_prev) begin
            x_cnt <= 0; y_cnt <= y_cnt + 1;
        end
    end

    // Calculate the positions of the text grid
    // 32 pixel width hence (>> 5)
    wire [7:0] slot_mult = (x_cnt >= TEXT_X_START) ? (x_cnt - TEXT_X_START) >> 5 : 7'd0;
    
    reg [4:0] s1_char_slot;
    reg [3:0] s1_row_idx;
    reg [11:0] s1_local_x, s1_local_y;
    reg [6:0] s1_active_pct;

    always @(posedge clk) begin
        s1_char_slot <= slot_mult[4:0]; // Determine which character slot we are in
        s1_row_idx   <= (y_cnt >= START_Y) ? (y_cnt - START_Y) >> 6 : 4'd15;
        s1_local_x   <= (x_cnt - TEXT_X_START);
        s1_local_y   <= (y_cnt - START_Y);
        
        // Calculate the percentage to be shown on the overlay for value being used for the centroid
        // Each case corresponds to a row of the text
        case ((y_cnt - START_Y) >> 6)
            //4'd1: s1_active_pct <= ((11'd1023 - {1'b0, (t2_y)}) * 20'd100) >> 10;
            4'd1: s1_active_pct <= (t2_y * 20'd100) >> 10;
            4'd2: s1_active_pct <= (t2_x * 20'd100) >> 10;
            //4'd3: s1_active_pct <= ((11'd1023 - {1'b0, (t1_y)}) * 20'd100) >> 10;
            4'd3: s1_active_pct <= (t1_y * 20'd100) >> 10;
            4'd4: s1_active_pct <= (t1_x * 20'd100) >> 10;
            default: s1_active_pct <= 0;
        endcase
    end
    
    // Determine what character of text needs to be drawn depending on what pixel we are at
    reg [6:0] s2_char_id;
    reg [4:0] s2_rom_row, s2_rom_col;
    
    always @(posedge clk) begin
        case(s1_row_idx)
            // Row 0 corresponds to text of the title "Music Conductor System"
            4'd0: begin
                case(s1_char_slot)
                    5'd0:    s2_char_id <= "M";
                    5'd1:    s2_char_id <= "u";
                    5'd2:    s2_char_id <= "s";
                    5'd3:    s2_char_id <= "i";
                    5'd4:    s2_char_id <= "c";
                    5'd5:    s2_char_id <= " ";
                    5'd6:    s2_char_id <= "C";
                    5'd7:    s2_char_id <= "o";
                    5'd8:    s2_char_id <= "n";
                    5'd9:    s2_char_id <= "d";
                    5'd10:   s2_char_id <= "u";
                    5'd11:   s2_char_id <= "c";
                    5'd12:   s2_char_id <= "t";
                    5'd13:   s2_char_id <= "o";
                    5'd14:   s2_char_id <= "r";
                    5'd15:   s2_char_id <= " ";
                    5'd16:   s2_char_id <= "S";
                    5'd17:   s2_char_id <= "y";
                    5'd18:   s2_char_id <= "s";
                    5'd19:   s2_char_id <= "t";
                    5'd20:   s2_char_id <= "e";
                    5'd21:   s2_char_id <= "m";
                    default: s2_char_id <= " ";
                endcase
            end
            // Row 1 corresponds to Volume (Blue - V Position)
            4'd1: begin
                case(s1_char_slot)
                    5'd1:    s2_char_id <= "V";
                    5'd2:    s2_char_id <= ":";
                    5'd3:    s2_char_id <= (s1_active_pct >= 7'd10) ? (8'd48 + (s1_active_pct/10)%10) : " ";
                    5'd4:    s2_char_id <= 8'd48 + (s1_active_pct % 10);
                    5'd5:    s2_char_id <= "%";
                    default: s2_char_id <= " ";
                endcase
            end

            // Row 2 corresponds to LR Balance (Blue - H Position)
            4'd2: begin
                case(s1_char_slot)
                    5'd0:    s2_char_id <= "L";
                    5'd1:    s2_char_id <= "R";
                    5'd2:    s2_char_id <= ":";
                    5'd3:    s2_char_id <= (s1_active_pct >= 7'd10) ? (8'd48 + (s1_active_pct/10)%10) : " ";
                    5'd4:    s2_char_id <= 8'd48 + (s1_active_pct % 10);
                    5'd5:    s2_char_id <= "%";
                    default: s2_char_id <= " ";
                endcase
            end

            // Row 3 corresponds to Pitch (Red - V Position)
            4'd3: begin
                case(s1_char_slot)
                    5'd1:    s2_char_id <= "P";
                    5'd2:    s2_char_id <= ":";
                    5'd3:    s2_char_id <= (s1_active_pct >= 7'd10) ? (8'd48 + (s1_active_pct/10)%10) : " ";
                    5'd4:    s2_char_id <= 8'd48 + (s1_active_pct % 10);
                    5'd5:    s2_char_id <= "%";
                    default: s2_char_id <= " ";
                endcase
            end

            // Row 4 corresponds to EQ Balance (Red - H Position)
            4'd4: begin
                case(s1_char_slot)
                    5'd0:    s2_char_id <= "E";
                    5'd1:    s2_char_id <= "q";
                    5'd2:    s2_char_id <= ":";
                    5'd3:    s2_char_id <= (s1_active_pct >= 7'd10) ? (8'd48 + (s1_active_pct/10)%10) : " ";
                    5'd4:    s2_char_id <= 8'd48 + (s1_active_pct % 10);
                    5'd5:    s2_char_id <= "%";
                    default: s2_char_id <= " ";
                endcase
            end

            default: s2_char_id <= " ";
        endcase

        // Ensure ROM row/col fetch logic uses these same slot values
        s2_rom_row <= (s1_local_y - (s1_row_idx << 6)) >> 1;
        s2_rom_col <= ((s1_local_x - (s1_char_slot * HORIZ_PITCH)) >> 1) + 5'd8;
    end

    // Build BRAM address based on the character needed and which of the 32x32 pixels of the character is being read
    reg [16:0] s3_bram_addr;
    always @(posedge clk) begin
        s3_bram_addr <= {s2_char_id, s2_rom_row, s2_rom_col};
    end

    // BRAM read
    wire [1:0] s4_pixel_type;
    font_rom_32_2bit font_inst (.clk(clk), .addr(s3_bram_addr), .data_out(s4_pixel_type));

    // Function to draw the box markers
    function is_marker(input [11:0] x, y, input [11:0] tx, ty);
        begin
            is_marker = (
                (((y >= ty - BOX_SIZE && y < ty - BOX_SIZE + THICKNESS) || 
                  (y <= ty + BOX_SIZE && y > ty + BOX_SIZE - THICKNESS)) &&
                 (x >= tx - BOX_SIZE && x <= tx + BOX_SIZE)) ||
                (((x >= tx - BOX_SIZE && x < tx - BOX_SIZE + THICKNESS) || 
                  (x <= tx + BOX_SIZE && x > tx + BOX_SIZE - THICKNESS)) &&
                 (y >= ty - BOX_SIZE && y <= ty + BOX_SIZE)) ||
                ((x >= tx - CROSS_LEN && x <= tx + CROSS_LEN) && (y == ty)) ||
                ((y >= ty - CROSS_LEN && y <= ty + CROSS_LEN) && (x == tx))
            );
        end
    endfunction

    // Function to draw the box marker outline (Same as box is_marker but thicker)
    function is_marker_outline(input [11:0] x, y, input [11:0] tx, ty);
        begin
            is_marker_outline = (
                // Horizontal Edges (Top & Bottom)
                (( (y >= ty - BOX_SIZE - 2) && (y < ty - BOX_SIZE + THICKNESS + 2) ) || 
                 ( (y <= ty + BOX_SIZE + 2) && (y > ty + BOX_SIZE - THICKNESS - 2) )) 
                 && (x >= tx - BOX_SIZE - 2 && x <= tx + BOX_SIZE + 2)
                ) || (
                // Vertical Edges (Left & Right)
                (( (x >= tx - BOX_SIZE - 2) && (x < tx - BOX_SIZE + THICKNESS + 2) ) || 
                 ( (x <= tx + BOX_SIZE + 2) && (x > tx + BOX_SIZE - THICKNESS - 2) )) 
                 && (y >= ty - BOX_SIZE - 2 && y <= ty + BOX_SIZE + 2)
                ) || (
                // Thickened Crosshair (3 pixels wide/tall so color has a border)
                ((x >= tx - CROSS_LEN - 2 && x <= tx + CROSS_LEN + 2) && (y >= ty - 1 && y <= ty + 1)) ||
                ((y >= ty - CROSS_LEN - 2 && y <= ty + CROSS_LEN + 2) && (x >= tx - 1 && x <= tx + 1))
            );
        end
    endfunction

    // Start "drawing" by determining what the pixel we are currently at should be:
    // Is the pixel part of the cross hair marker? (Color)
    // Is the pixel part of the text box area?
    //   When pixel is in the text box area, the BRAM result tells us:
    //     Is the pixel part of the text core? (White)
    //     Is the pixel part of the outline of the text? (Black)
    //     Is the pixel in the text box but does not contribute to overlay? (Passthrough)
    // Since some cycles are used to calculate the pixel assignment, pipeline Vsync, Hsync and Enable accordingly.
    wire hit_m1 = is_marker(x_cnt, y_cnt, r1_x, r1_y);
    wire hit_m2 = is_marker(x_cnt, y_cnt, r2_x, r2_y);
    wire hit_mo1 = is_marker_outline(x_cnt, y_cnt, r1_x, r1_y);
    wire hit_mo2 = is_marker_outline(x_cnt, y_cnt, r2_x, r2_y);

    wire text_zone = (y_cnt >= START_Y && 
                      y_cnt < START_Y + 320 &&     
                      x_cnt >= TEXT_X_START && 
                      x_cnt < TEXT_X_START + 960);
    

    reg [3:0] p_hs, p_vs, p_de, p_m1, p_m2, p_mo1, p_mo2, p_tz, p_dbz;
    reg [23:0] p_data [0:3];
    integer i;

    always @(posedge clk) begin
        // Shift bits for single-bit signals
        p_hs  <= {p_hs[2:0], hsync_in};
        p_vs  <= {p_vs[2:0], vsync_in};
        p_de  <= {p_de[2:0], de_in};
        p_dbz <= {p_dbz[2:0], dbz_flag};
        p_m1  <= {p_m1[2:0], hit_m1};
        p_m2  <= {p_m2[2:0], hit_m2};
        p_mo1  <= {p_mo1[2:0], hit_mo1};
        p_mo2  <= {p_mo2[2:0], hit_mo2};
        p_tz  <= {p_tz[2:0], text_zone};

        // Shift register for 24-bit video data
        p_data[0] <= in_p_data;
        for (i=1; i<4; i=i+1) p_data[i] <= p_data[i-1];

        hsync_out <= p_hs[3];
        vsync_out <= p_vs[3];
        de_out    <= p_de[3];

        if (p_dbz[3]) begin
            out_p_data <= p_data[3];
        end else if (p_tz[3] && s4_pixel_type == 2'b10) begin
            //out_p_data <= 24'hFFFFFF; // White text core
            case(s1_row_idx) // V, LR, P, Eq (Top-Down) (Hint the color corresponding the marker)
                4'd1: out_p_data <= 24'h60FF60;
                4'd2: out_p_data <= 24'h60FF60;
                4'd3: out_p_data <= 24'hFF6060;
                4'd4: out_p_data <= 24'hFF6060;
                default: out_p_data <= 24'hFFFFFF;
            endcase
        end else if (p_tz[3] && s4_pixel_type == 2'b01) begin
            out_p_data <= 24'h000000; // Black text outline
        end else if (p_m1[3]) begin
            out_p_data <= 24'hFF6060; // Red crosshairs
        end else if (p_m2[3]) begin
            out_p_data <= 24'h60FF60; // Blue crosshairs
        end else if (p_mo1[3] || p_mo2[3]) begin
            out_p_data <= 24'h000000; // Crosshairs outline
        end else begin
            out_p_data <= p_data[3];
        end
    end
endmodule

// Font metadata stored in BRAM, 32x32 pixels per character, each pixel tells us whether it is part of core text, outline, or transparant
module font_rom_32_2bit (
    input clk,
    input [16:0] addr,
    output reg [1:0] data_out
);
    (* ram_style = "block" *) reg [1:0] rom [0:131071];
    initial $readmemh("font_data.mem", rom);
    always @(posedge clk) data_out <= rom[addr];
endmodule
