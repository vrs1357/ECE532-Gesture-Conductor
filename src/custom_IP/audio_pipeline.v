`timescale 1ns / 1ps

module audio_pipeline #(
    parameter DEPTH = 65536,
    parameter NUM_GRAINS = 32,
    parameter WIDTH = 24,
    parameter GRAIN_W = 12,
    parameter PIPE_STAGES = 15          
)(
    input clk, input rst, input lrclk,
    input [10:0] pitch_control, bass_control, treble_control, volume_control, stereo_control,
    input signed [WIDTH-1:0] data_inL, input signed [WIDTH-1:0] data_inR,
    output reg signed [WIDTH-1:0] data_outL, output reg signed [WIDTH-1:0] data_outR  
);

    localparam ADDR_W = 16; 
    localparam STEP = (1 << GRAIN_W) / NUM_GRAINS; 
    localparam OFFSET = 32768;

    reg lrclkD1;
    reg lrclkD2;
    
    always@(posedge(clk))begin
        lrclkD1<=lrclk;
        lrclkD2<=lrclkD1;
    end
    
    assign mix_data = lrclkD1 & ~lrclkD2;

    // Quantize the pitch control since using value directly has "interesting" results
    reg [10:0] pitch_quantized;

    always @(posedge clk) begin
        if (pitch_control < 11'd102)      pitch_quantized <= 11'd256; 
        else if (pitch_control < 11'd204) pitch_quantized <= 11'd304; 
        else if (pitch_control < 11'd306) pitch_quantized <= 11'd341; 
        else if (pitch_control < 11'd408) pitch_quantized <= 11'd406; 
        else if (pitch_control < 11'd614) pitch_quantized <= 11'd512; 
        else if (pitch_control < 11'd716) pitch_quantized <= 11'd645; 
        else if (pitch_control < 11'd818) pitch_quantized <= 11'd767; 
        else if (pitch_control < 11'd920) pitch_quantized <= 11'd861; 
        else                              pitch_quantized <= 11'd1023; 
   end

    // Initialize BRAM for audio buffering
    (* ram_style = "block" *) reg [47:0] mem [0:DEPTH-1];
    reg [47:0] ram_out_reg;
    reg [15:0] w_ptr_final, p_tdm_final;

    always @(posedge clk) begin
        if (mix_data && !last_mix) mem[w_ptr_final] <= {data_inL, data_inR};
        ram_out_reg <= mem[p_tdm_final]; 
    end

    // Pipeline buffers to meet timing requirement for BRAM to DSP
    reg [47:0] grain_pipe [0:PIPE_STAGES][0:NUM_GRAINS-1];
    reg [21:0] win_pipe   [0:PIPE_STAGES][0:NUM_GRAINS-1];
    reg [47:0] v_pipe; // Increased width for safety

    // Grain pointers
    reg [24:0] p_fixed [0:NUM_GRAINS-1]; 
    reg [15:0] w_ptr;
    reg [11:0] grain_timer;
    reg [31:0] lfsr;
    reg last_mix, tdm_busy;
    reg [5:0] tdm_idx, tdm_idx_d1, tdm_idx_d2; 

    // Grain computation logic, use generate block since each grain is essentially identical
    genvar k, s;
    generate
        for (k = 0; k < NUM_GRAINS; k = k + 1) begin : grain_logic
            wire [11:0] t_loc = grain_timer + (k * STEP);
            wire [11:0] tri_val = (t_loc < 2048) ? t_loc : (4095 - t_loc);
            wire [21:0] win_now = tri_val[10:0] * tri_val[10:0];

            always @(posedge clk) begin
                if (rst) p_fixed[k] <= 0;
                else if (mix_data && !last_mix) begin
                    if (grain_timer == k*STEP)
                        // Use a linear feedback shift register to slightly randomize the grain startpoints to get more natural sound
                        p_fixed[k] <= {(w_ptr - OFFSET), 9'b0} + (lfsr[k] ? {lfsr[7:0], 1'b0} : -{lfsr[7:0], 1'b0});
                    else
                        // Normalizing pitch: 512 is 1:1 speed (2^9)
                        //p_fixed[k] <= p_fixed[k] + pitch_control;
                        p_fixed[k] <= p_fixed[k] + pitch_quantized;

                end
                win_pipe[0][k] <= win_now;
            end
            // Push everything down the pipe
            for (s = 1; s <= PIPE_STAGES; s = s + 1) begin : stages
                always @(posedge clk) begin
                    grain_pipe[s][k] <= grain_pipe[s-1][k];
                    win_pipe[s][k]   <= win_pipe[s-1][k];
                end
            end
        end
    endgenerate

    // Take advantage of significantly faster system clock to populate a grain every cycle
    // Audio clock much slower by comparison
    always @(posedge clk) begin
        last_mix <= mix_data;
        tdm_idx_d1 <= tdm_idx;
        tdm_idx_d2 <= tdm_idx_d1;

        if (rst) begin
            tdm_busy <= 0; w_ptr <= 0; grain_timer <= 0; lfsr <= 32'hACE1;
            v_pipe <= 0;
        end else begin
            w_ptr_final <= w_ptr;
            // Pipe is valid once index is maxed and audio clock edge is triggered
            v_pipe <= {v_pipe[46:0], (tdm_busy && tdm_idx == NUM_GRAINS)};

            if (mix_data && !last_mix) begin
                // Increment the write pointer and reset the grain indexes on a audio clock edge
                tdm_busy <= 1; tdm_idx <= 0;
                w_ptr <= w_ptr + 1'b1; grain_timer <= grain_timer + 1'b1;
                // Update randomization register
                lfsr <= {lfsr[30:0], lfsr[31] ^ lfsr[21] ^ lfsr[1] ^ lfsr[0]};
            end else if (tdm_busy) begin
                // Keep updating grain positions if its not an audio clock edge  
                if (tdm_idx < NUM_GRAINS) begin
                    p_tdm_final <= p_fixed[tdm_idx][24:9]; 
                    tdm_idx <= tdm_idx + 1'b1;
                end else tdm_busy <= 0;
            end
            
            // Push audio buffer into the processing pipeline
            if (tdm_idx_d2 < NUM_GRAINS) begin
                grain_pipe[0][tdm_idx_d2] <= ram_out_reg;
            end
        end
    end

    // DSP multiplication results
    reg signed [47:0] m_outL [0:NUM_GRAINS-1];
    reg signed [47:0] m_outR [0:NUM_GRAINS-1];
    
    genvar i;
    generate
        for (i = 0; i < NUM_GRAINS; i = i + 1) begin : dsp_gen
            always @(posedge clk) begin
                // Each grain is multiplied with the windowing function to determine the grains individual amplitude within the final audio signal
                // Windowing function ensures the total is "1" and the constituting grains do not overlap with the write head
                m_outL[i] <= $signed(grain_pipe[PIPE_STAGES][i][47:24]) * $signed({1'b0, win_pipe[PIPE_STAGES][i]});
                m_outR[i] <= $signed(grain_pipe[PIPE_STAGES][i][23:0])  * $signed({1'b0, win_pipe[PIPE_STAGES][i]});
            end
        end
    endgenerate

    // Accumulate all the audio grains and other processing
    reg signed [63:0] accL, accR, accL_1, accR_1, accL_2, accR_2, accL_3, accR_3, accL_4, accR_4, accL_5, accR_5, accL_6, accR_6, temp_accL, temp_accR;
    reg [5:0] acc_idx;
    wire signed [23:0] bass_filtered_L, bass_filtered_R;
    reg filter_trigger;
    
    
    always @(posedge clk) begin
        filter_trigger <= 0;
        if (v_pipe[PIPE_STAGES + 2]) begin 
            // Adjusted for multiplier latency
            accL <= 0; accR <= 0; acc_idx <= 0; filter_trigger <= 0;
        end else if (acc_idx < NUM_GRAINS) begin
            accL <= accL + m_outL[acc_idx];
            accR <= accR + m_outR[acc_idx];
            acc_idx <= acc_idx + 1'b1;
        end else if (acc_idx == NUM_GRAINS) begin
            // Downshift by 22 (Window Gain) then apply Stereo (11-bit)
            accL_1 <= (accL >>> 22); 
            accR_1 <= (accR >>> 22);
            acc_idx <= acc_idx + 1'b1;
        end else if (acc_idx == NUM_GRAINS + 1) begin
            // Apply Volume (11-bit)
            accL_2 <= accL_1 * $signed({1'b0, (11'd1023 - stereo_control)});
            accR_2 <= accR_1 * $signed({1'b0, (stereo_control)}); 
            acc_idx <= acc_idx + 1'b1;
        end else if (acc_idx == NUM_GRAINS + 2) begin
            accL_3 <= accL_2 >>> 10;
            accR_3 <= accR_2 >>> 10;
            // Final shift to 24-bit for filter input
            acc_idx <= acc_idx + 1'b1;
        end else if (acc_idx == NUM_GRAINS + 3) begin
            accL_5 <= accL_3 * $signed({1'b0, volume_control});
            accR_5 <= accR_3 * $signed({1'b0, volume_control});
            acc_idx <= acc_idx + 1'b1;
        end else if (acc_idx === NUM_GRAINS + 4) begin
            temp_accL <= accL_5 >>> 10;
            temp_accR <= accR_5 >>> 10;
            filter_trigger <= 1;
            acc_idx <= acc_idx + 1'b1;
        end else begin
            filter_trigger <= 0;
        end
    end

    // Equalization filters
    bass_module bass_inst_L (
        .clk(clk),  .sample_in(temp_accL[23:0]), 
        .bass_control(bass_control), .treble_control(treble_control), .sample_out(bass_filtered_L)
        ,.rst(rst),
        .en(filter_trigger)
    );

    bass_module bass_inst_R (
        .clk(clk), .sample_in(temp_accR[23:0]), 
        .bass_control(bass_control), .treble_control(treble_control), .sample_out(bass_filtered_R)
        ,.rst(rst),
        .en(filter_trigger)
    );

    always @(posedge clk) begin
        data_outL <= bass_filtered_L;
        data_outR <= bass_filtered_R;
    end
endmodule

module bass_module (
    input clk,
    input rst,
    input en,
    input signed [23:0] sample_in,
    input [10:0] bass_control,
    input [10:0] treble_control,

    output reg signed [23:0] sample_out
);


    reg signed [23:0] gain_bass, gain_treble;
    
    
    // GAIN CONTROL: bass gain goes from +2 to -2, treble gain goes from -1 to +1
    always @(*) begin
        if (bass_control < 11'd114) begin
            gain_bass = 24'sd8388608; 
        end else if (bass_control < 11'd228) begin
            gain_bass = 24'sd6525673; 
        end else if (bass_control < 11'd342) begin
            gain_bass = 24'sd4662738;
        end else if (bass_control < 11'd456) begin
            gain_bass = 24'sd2799803;  
        end else if (bass_control < 11'd570) begin
            gain_bass = 24'sd936868;
        end else if (bass_control < 11'd684) begin
            gain_bass = -24'sd936868;
        end else if (bass_control < 11'd798) begin
            gain_bass = -24'sd2799803;
        end else if (bass_control < 11'd912) begin
            gain_bass = -24'sd4662738;
        end else if (bass_control < 11'd1023) begin
            gain_bass = -24'sd6525673;
        end else begin
            gain_bass = -24'sd8388608;      
        end
    end
    always @(*) begin
        if (treble_control < 11'd114) begin
            gain_treble = -24'sd4194304;       
        end else if (treble_control < 11'd228) begin
            gain_treble = -24'sd3262836; 
        end else if (treble_control < 11'd342) begin
            gain_treble = -24'sd2331372; 
        end else if (treble_control < 11'd456) begin
            gain_treble = -24'sd1399804;
        end else if (treble_control < 11'd570) begin
            gain_treble = -24'sd467734;
        end else if (treble_control < 11'd684) begin
            gain_treble = 24'sd467734;
        end else if (treble_control < 11'd798) begin
            gain_treble = 24'sd1399804;
        end else if (treble_control < 11'd912) begin
            gain_treble = 24'sd2331372;
        end else if (treble_control < 11'd1023) begin
            gain_treble = 24'sd3262836;
        end else begin
            gain_treble = 24'sd4194304;        
        end
    end
    
    // Low-Pass / High-Pass registers
    reg signed [23:0] y_lp, y_hp, lp_1, hp_1, lp_3, hp_3;      
    reg signed [23:0] y_lp_prev, y_hp_prev;    

    // Alpha values (control cutoff of filters
    parameter signed [23:0] ALPHA_LP = 24'h040000; // ~0.03 (Q2.22)
    parameter signed [23:0] ALPHA_HP =24'h3A5F20;

    
    // Intermediate calculation signals
    reg signed [47:0] lp_acc, hp_acc, lp_2, hp_2;
    reg signed [47:0] bass_mult, treble_mult;
    reg signed [47:0] final_acc;
    
    // Saturation function (prevents audio distortion)
    function signed [23:0] sat24;
    input signed [47:0] val;
    begin
        if (val > 48'sd8388607)
            sat24 = 24'sh7FFFFF;
        else if (val < -48'sd8388608)
            sat24 = -24'sh800000;
        else
            sat24 = val[23:0];
        end
    endfunction
    
    // Filter Pipeline
    always @(posedge clk) begin
        if (rst) begin
            y_lp       <= 0;
            y_lp_prev     <= 0;
            sample_out <= 0;
            y_hp <= 0;
            y_hp_prev <= 0;
            lp_1 <= 0;
            hp_1 <= 0;
        end else if (en) begin

            // Stage 1: Apply Filter
            lp_1 <= sample_in - y_lp_prev;
            lp_2 <= ALPHA_LP * lp_1;
            lp_3 <= lp_2 >>> 22;
            lp_acc <= y_lp_prev + lp_3;
            y_lp   <= lp_acc[23:0];
            
            hp_1 <= sample_in - y_hp_prev;
            hp_2 <= ALPHA_HP * hp_1;
            hp_3 <= hp_2 >>> 22;
            hp_acc <= y_hp_prev + hp_3;
            y_hp <= hp_acc[23:0];

            // Stage 2: Apply gain accordingly
            bass_mult <= (gain_bass * y_lp) >>> 22;
            treble_mult <= (gain_treble * y_hp) >>> 22;

            // Stage 3: Combine all 
            final_acc <= sample_in + bass_mult + treble_mult;

            // Stage 4: apply saturation
            sample_out <= sat24(final_acc);

            // Last: Update state
            y_lp_prev <= y_lp;
            y_hp_prev <= y_hp;
        end
    end

endmodule
