`timescale 1ns / 1ps

module centroid_core#(
    parameter COLOR_UB = 8'd8,
    parameter COLOR_LB = 8'd248
)(
    input clk,
    input resetn,
    
    //video signals
    input vsync,
    input hsync, 
    input p_valid,
    
    //for debugging purposes
    input debug,
    
    //8 bits per channel -> 24 bits
    input [23:0] p_data,

    //outputs normalized from (0-1023): 2^10 = 1024, but just for bit overflow and safety chose 11bits
    output reg [10:0] final_x,
    output reg [10:0] final_y,
    
    //if no red object then divide-by-zero flag will be 1
    output reg dbz_flag,
    
    //used to show what it sees as red (useful for debug)
    output reg is_red
    );

    //how many red pixels we can hold. defaulting to 1024, but we can increase it to a power of 2 if needed, like if our "red" is a bigger blob
    parameter BUCKET_SIZE = 1024; 
    //this is the divider since shifting right by 10 is same as dividing by 1024
    parameter SHIFT_VAL = 10; // 2^10 = 1024
    //how smooth do we want the marker to track the 'blob': 3 smoothest, 1 least-smoothest
    parameter IIR_SHIFT = 2;
    
    //tracks current pixel's position on the screen
    reg [10:0] x_count, y_count;
    //huge registers to hold the sum of X and Y coordinates present in the bucket. 32 bits because (1920*1024 < 2^32)
    reg [31:0] rolling_sum_x, rolling_sum_y;
    //making it 20bits, but ideally should be 10bits, or 11bits since BUCKET_SIZE is 1024
    reg [19:0] active_pixels; //keeps tracks of how many pixels are in the bucket
    //it stores the coordinates of the last 1024 red pixels found so they can be substracted later
    //11bits because it can count upto 2047 (we use 11 bits for height so use 11 bits for width too)
    //size is 1920x1080 WidthxHeight XxY
    reg [10:0] history_x [0:BUCKET_SIZE-1];
    reg [10:0] history_y [0:BUCKET_SIZE-1];
    //the pointer address telling the history where to save the next red detected pixel coordinate
    reg [9:0] write_ptr; //10bits since BUCKET_SIZE is 10bits, this is for the address while above was for data
    reg buffer_full; //have a flag, if buffer full
    reg buffer_full_final;
    //IIR filters registers to smooth the coordinates
    reg [47:0] filtered_x_acc, filtered_y_acc; // to fix overflow

    //Detecting 'red' using HSV: [RGB is very light dependent and very noisy hence using HSV (color dependent)]
    //Hue (color type), Saturation (how intense the color is), Value (brightness)
    wire [7:0] h = p_data[23:16]; // r == h
    wire [7:0] s = p_data[15:8]; // g == s
    wire [7:0] v = p_data[7:0]; // b == v
    reg [7:0] h_d1, s_d1, v_d1, h_d2, s_d2, v_d2;
    reg p_valid_d1, p_valid_d2, p_valid_d3;
    reg is_red_d1;    
    always @(posedge clk) begin
        p_valid_d1 <= p_valid;
        h_d1 <= h;
        s_d1 <= s;
        v_d1 <= v;
        
        p_valid_d2 <= p_valid_d1; 
        h_d2 <= h_d1;
        s_d2 <= s_d1;
        v_d2 <= v_d1;

        //the actual is_red portion which looks at the HSV values
        //is_red_d1 <= ((h_d2 < 8'd8) || (h_d2 > 8'd248)) && (s_d2 > 8'd160) && (v_d2 > 8'd120);
        // TO THIS (Higher saturation and brightness):
        is_red_d1 <= ((((h_d2 <= COLOR_UB) || (h_d2 >= COLOR_LB)) && (COLOR_UB < COLOR_LB)) || // Hue wrap around (Red)
                     (((h_d2 <= COLOR_UB) && (h_d2 >= COLOR_LB)) && (COLOR_UB >= COLOR_LB))) && // Hue normal
                     (s_d2 > 8'd160) && // Minimum saturation
                     (v_d2 > 8'd120); // Minimum brightness
  
        p_valid_d3 <= p_valid_d2;
        is_red <= is_red_d1 && p_valid_d3;
    end
    
    //keep a history of 'red' seen so that we can use X amount of red pixels in a row as a 'red' object/blob detected case
    reg [3:0] red_history;
    wire is_blob;          
    always @(posedge clk) begin
        if (p_valid) begin
            if (x_count == 0) begin
                red_history <= 4'b0000;
            end else begin
                red_history <= {red_history[2:0], is_red};
            end
        end
    end
    assign is_blob = &red_history; //it's an actual red blob/object (NOT NOISE) if all the 4 pixels seen were red

    //vsync and hsync edge detection
    //reg vsync_d;
    //wire vsync_rising = (vsync && !vsync_d);
    reg vsync_rising;
    //reg hsync_d;
    //wire hsync_rising = (hsync && !hsync_d);
    reg hsync_rising;

    reg [8:0] vsync_pipe;
    reg [8:0] hsync_pipe;

    always @(posedge clk) begin
        hsync_pipe <= {hsync_pipe[7:0], hsync};
        vsync_pipe <= {vsync_pipe[7:0], vsync};
        hsync_rising <= (hsync_pipe[7] && !hsync_pipe[8]);
        vsync_rising <= (vsync_pipe[7] && !vsync_pipe[8]);
    end

    //hardcoded-XY counters for 1080p
//    always @(posedge clk) begin
//        //if new frame or reset then set counters to 0
//        if (!resetn || vsync_rising) begin //to adapt to rising edge
//            x_count <= 0;
//            y_count <= 0;
//        //if valid pixel
//        end else if (p_valid) begin
//            //if the x hits end of a row (1920-1) then it resets to 0 and increases y
//            //if (x_count == 1919) begin
//            if (hsync_rising) begin
//                x_count <= 0;
//                //if it hits end of the frame
////                if (y_count == 1079) 
//                if (vsync_rising) 
//                    y_count <= 0;
//                else 
//                    y_count <= y_count + 1;
//            //otherwise just increase x so you're moving across the horizontal frame
//            end else begin
//                x_count <= x_count + 1;
//            end
//        end
//    end

    always @(posedge clk) begin
        if (!resetn || vsync_rising) begin
            x_count <= 0;
            y_count <= 0;
        end else begin
            if (hsync_rising) begin
                x_count <= 0;
                y_count <= (vsync_rising) ? 0 : y_count + 1;
            end else if (p_valid) begin
                x_count <= x_count + 1;
            end
        end
    end
    
    //delay the logic accordingly based on the pipeline. this is needed such that the data it's looking at is not from 8 pixels/cycles ago (3-cycle HSV + 4-cycle Blob + 1-cycle logic)
    reg [10:0] x_d1, x_d2, x_d3, x_d4, x_d5, x_d6, x_d7, x_d8;
    reg [10:0] y_d1, y_d2, y_d3, y_d4, y_d5, y_d6, y_d7, y_d8;
    always @(posedge clk) begin
        x_d1 <= x_count; 
        x_d2 <= x_d1; 
        x_d3 <= x_d2; 
        x_d4 <= x_d3;
        x_d5 <= x_d4; 
        x_d6 <= x_d5; 
        x_d7 <= x_d6; 
        x_d8 <= x_d7;
        
        y_d1 <= y_count; 
        y_d2 <= y_d1; 
        y_d3 <= y_d2; 
        y_d4 <= y_d3;
        y_d5 <= y_d4; 
        y_d6 <= y_d5; 
        y_d7 <= y_d6; 
        y_d8 <= y_d7;
    end
    
    //make the valid also pipelined to 8cycles, so there's no reset to (0,0) when it moves off the horizontal right side
    reg [7:0] p_valid_pipe;
    always @(posedge clk) begin
        if (!resetn) 
            p_valid_pipe <= 8'b0;
        else 
            p_valid_pipe <= {p_valid_pipe[6:0], p_valid};
    end
    wire p_valid_d8 = p_valid_pipe[7];

    //start summing them of, it keeps adding as the pixels roll over
    always @(posedge clk) begin
        //if reset set everything to 0, dbz_flag to 1 
        if (!resetn) begin
            rolling_sum_x <= 0;
            rolling_sum_y <= 0;
            write_ptr <= 0;
            buffer_full <= 0;
            buffer_full_final <= 0;
            active_pixels <= 0;
            dbz_flag <= 1;
        end else begin
            //reset sum at the begining of a new frame
            if (vsync_rising) begin 
                rolling_sum_x <= 0;
                rolling_sum_y <= 0;
                write_ptr <= 0;
                buffer_full_final <= buffer_full;
                buffer_full <= 0;
                active_pixels <= 0;
                dbz_flag <= 1; 
            //if it's an actual red blob object and it's a valid pixel then start summing
            //end else if (is_blob) begin //<--kamtest
            end else if (is_blob && p_valid_d8) begin //<--kamtest-fix
                //once the buffer is full (1024 pixels in bucket), we must add the new pixel and subtract the oldest one from the rolling_sum. this makes the sum slide along the object.
                if (buffer_full) begin
                    //remove the old coordinate and add the new one if it's full
                    rolling_sum_x <= rolling_sum_x + x_d8 - history_x[write_ptr];
                    rolling_sum_y <= rolling_sum_y + y_d8 - history_y[write_ptr];
                end else begin
                    //just keep on adding until the bucket is full
                    rolling_sum_x <= rolling_sum_x + x_d8;
                    rolling_sum_y <= rolling_sum_y + y_d8;
                    active_pixels <= active_pixels + 1;
                end

                //keep history of the new pixel
                history_x[write_ptr] <= x_d8;
                history_y[write_ptr] <= y_d8;
                
                //start incrementing the pointer
                if (write_ptr == BUCKET_SIZE - 1) begin
                    write_ptr <= 0;
                    buffer_full <= 1;
                    //buffer_full_final <= 1;
                end else begin
                    write_ptr <= write_ptr + 1;
                end
                
                //has something, so divide-by-zero is 0
                dbz_flag <= 0;
            end
        end
    end
    
    //wanted to dynamically scale the values to different screen resolution, but too complex thus hard-coded for 1080p
    reg [35:0] scale_x = 36'd546;
    reg [35:0] scale_y = 36'd971; 
    
    //final output using an IIR filter method
    reg [31:0] current_x, current_y;
    reg calc_done_d1; 
    reg update_outputs; 
    always @(posedge clk) begin
        //if reset, then middle of the screen which is 512 since it's normalized to 0-1023
        if (!resetn) begin
            final_x <= 11'd512;
            final_y <= 11'd512;
            filtered_x_acc <= 32'd512 << 10;
            filtered_y_acc <= 32'd512 << 10;
        end else begin 
            if (vsync_rising) begin
                //only update the tracker if we saw at least 10 'blob' pixels this frame
                //if (active_pixels > 10) begin // cause 50 is too much, 25 didn't work
                //if (buffer_full) begin //let's try showing only when buffer_full so that it doesnt go to 0,0. Works, but is kinda laggy.
                if (buffer_full_final) begin //let's try showing only when buffer_full so that it doesnt go to 0,0. Works, but is kinda laggy.
                    current_x <= (({15'b0, (rolling_sum_x >> SHIFT_VAL)}) * scale_x) >> 10;
                    current_y <= (({15'b0, (rolling_sum_y >> SHIFT_VAL)}) * scale_y) >> 10;
                    calc_done_d1 <= 1; //to tell the next stage the data is ready
                end else begin
                    //if no active pixels or red blob then don't do any IIR and let it stay at its last known state
                    calc_done_d1 <= 0;
                end
            end else begin
                calc_done_d1 <= 0;
            end
            
            //happens after 1 cycle, this is where it does the IIR [new = (old * 7/8) + (new * 1/8)]
            if (calc_done_d1) begin
                filtered_x_acc <= (filtered_x_acc - (filtered_x_acc >> IIR_SHIFT)) + ({16'b0, current_x} << (10 - IIR_SHIFT)); 
                filtered_y_acc <= (filtered_y_acc - (filtered_y_acc >> IIR_SHIFT)) + ({16'b0, current_y} << (10 - IIR_SHIFT)); 
                update_outputs <= 1; 
            end else begin
                update_outputs <= 0;
            end
            
            //lets update our final output registers (occurs after 2 cycles of vsync, updates once per frame)
            if (update_outputs) begin
                if ((filtered_x_acc >> 10) >= 11'd1023)
                    final_x = 11'd1023;
                else
                    final_x = (filtered_x_acc >> 10);

                //final_x <= (debug) ? 11'd512 : (filtered_x_acc >> 10);
                //final_y <= (debug) ? 11'd512 : (11'd1023 - {1'b0, (filtered_y_acc >> 10)});
                if ((filtered_y_acc >> 10) >= 11'd1023) 
                    final_y <= 11'd0; // Capped at the bottom
                else 
                    final_y <= 11'd1023 - (filtered_y_acc >> 10);
            end
        end
    end

endmodule
