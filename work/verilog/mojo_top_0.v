/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    input [5:0] user_buttons,
    input solve_button,
    input start_button,
    output reg [6:0] array_seg,
    output reg [5:0] array_sel,
    output reg [6:0] data_seg,
    output reg [3:0] data_sel,
    output reg [7:0] led,
    output reg [17:0] array_led,
    output reg [2:0] user_solvable
  );
  
  
  
  localparam ONESECOND = 26'h2faf080;
  
  localparam STEPS = 6'h32;
  
  wire [16-1:0] M_alu_out;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu16_1 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .out(M_alu_out)
  );
  
  reg rst;
  
  reg game_rst;
  
  reg eliminateSig;
  
  reg [3:0] eliminatePosition;
  
  reg [3:0] shiwei;
  
  reg [3:0] gewei;
  
  wire [10-1:0] M_problem_set_problem_out;
  reg [4-1:0] M_problem_set_problem_count;
  problems_2 problem_set (
    .problem_count(M_problem_set_problem_count),
    .problem_out(M_problem_set_problem_out)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_3 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_solve_button_cond_out;
  reg [1-1:0] M_solve_button_cond_in;
  button_4 solve_button_cond (
    .clk(clk),
    .in(M_solve_button_cond_in),
    .out(M_solve_button_cond_out)
  );
  wire [1-1:0] M_start_button_cond_out;
  reg [1-1:0] M_start_button_cond_in;
  button_4 start_button_cond (
    .clk(clk),
    .in(M_start_button_cond_in),
    .out(M_start_button_cond_out)
  );
  wire [1-1:0] M_button0_out;
  reg [1-1:0] M_button0_in;
  button_4 button0 (
    .clk(clk),
    .in(M_button0_in),
    .out(M_button0_out)
  );
  wire [1-1:0] M_button1_out;
  reg [1-1:0] M_button1_in;
  button_4 button1 (
    .clk(clk),
    .in(M_button1_in),
    .out(M_button1_out)
  );
  wire [1-1:0] M_button2_out;
  reg [1-1:0] M_button2_in;
  button_4 button2 (
    .clk(clk),
    .in(M_button2_in),
    .out(M_button2_out)
  );
  wire [1-1:0] M_button3_out;
  reg [1-1:0] M_button3_in;
  button_4 button3 (
    .clk(clk),
    .in(M_button3_in),
    .out(M_button3_out)
  );
  wire [1-1:0] M_button4_out;
  reg [1-1:0] M_button4_in;
  button_4 button4 (
    .clk(clk),
    .in(M_button4_in),
    .out(M_button4_out)
  );
  wire [1-1:0] M_button5_out;
  reg [1-1:0] M_button5_in;
  button_4 button5 (
    .clk(clk),
    .in(M_button5_in),
    .out(M_button5_out)
  );
  wire [54-1:0] M_game_array;
  wire [1-1:0] M_game_sound;
  reg [1-1:0] M_game_eliminate;
  reg [4-1:0] M_game_eliminatePosition;
  reg [1-1:0] M_game_solve1;
  reg [1-1:0] M_game_solve0;
  gameSelf_12 game (
    .clk(clk),
    .rst(game_rst),
    .eliminate(M_game_eliminate),
    .eliminatePosition(M_game_eliminatePosition),
    .solve1(M_game_solve1),
    .solve0(M_game_solve0),
    .array(M_game_array),
    .sound(M_game_sound)
  );
  localparam INIT_state = 4'd0;
  localparam PREPARE_state = 4'd1;
  localparam START1_state = 4'd2;
  localparam START2_state = 4'd3;
  localparam START3_state = 4'd4;
  localparam START4_state = 4'd5;
  localparam SOLVE_state = 4'd6;
  localparam CHECK_state = 4'd7;
  localparam NEXTPROBLEM_state = 4'd8;
  localparam WIN_state = 4'd9;
  localparam LOSE_state = 4'd10;
  localparam END_state = 4'd11;
  
  reg [3:0] M_state_d, M_state_q = INIT_state;
  reg [31:0] M_slow_clk_d, M_slow_clk_q = 1'h0;
  wire [7-1:0] M_numbers_seg;
  wire [6-1:0] M_numbers_sel;
  reg [24-1:0] M_numbers_values;
  multi_seven_segment_13 numbers (
    .clk(clk),
    .rst(rst),
    .values(M_numbers_values),
    .seg(M_numbers_seg),
    .sel(M_numbers_sel)
  );
  wire [7-1:0] M_data_segments_seg;
  wire [4-1:0] M_data_segments_sel;
  reg [16-1:0] M_data_segments_values;
  multi_seven_segment_14 data_segments (
    .clk(clk),
    .rst(rst),
    .values(M_data_segments_values),
    .seg(M_data_segments_seg),
    .sel(M_data_segments_sel)
  );
  wire [18-1:0] M_array_led_controller_led_pulse;
  reg [24-1:0] M_array_led_controller_colors;
  multi_led_15 array_led_controller (
    .clk(clk),
    .rst(rst),
    .colors(M_array_led_controller_colors),
    .led_pulse(M_array_led_controller_led_pulse)
  );
  reg [5:0] M_count_down_d, M_count_down_q = 1'h0;
  reg [25:0] M_one_second_d, M_one_second_q = 1'h0;
  reg [9:0] M_problem_d, M_problem_q = 1'h0;
  reg M_start_button_dff_d, M_start_button_dff_q = 1'h0;
  reg M_solve_button_dff_d, M_solve_button_dff_q = 1'h0;
  reg M_first_ball_solvable_d, M_first_ball_solvable_q = 1'h0;
  reg M_second_ball_solvable_d, M_second_ball_solvable_q = 1'h0;
  reg M_problem_solvable_d, M_problem_solvable_q = 1'h0;
  reg [3:0] M_problem_counter_d, M_problem_counter_q = 1'h0;
  
  always @* begin
    M_state_d = M_state_q;
    M_second_ball_solvable_d = M_second_ball_solvable_q;
    M_start_button_dff_d = M_start_button_dff_q;
    M_problem_counter_d = M_problem_counter_q;
    M_problem_d = M_problem_q;
    M_count_down_d = M_count_down_q;
    M_slow_clk_d = M_slow_clk_q;
    M_problem_solvable_d = M_problem_solvable_q;
    M_first_ball_solvable_d = M_first_ball_solvable_q;
    M_solve_button_dff_d = M_solve_button_dff_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    led[0+5-:6] = user_buttons;
    M_alu_a = 1'h0;
    M_alu_b = 1'h0;
    M_alu_alufn = 1'h0;
    M_game_solve1 = 1'h0;
    M_game_solve0 = 1'h0;
    game_rst = 1'h0 | rst;
    M_problem_set_problem_count = M_problem_counter_q;
    M_button0_in = user_buttons[5+0-:1];
    M_button1_in = user_buttons[4+0-:1];
    M_button2_in = user_buttons[3+0-:1];
    M_button3_in = user_buttons[2+0-:1];
    M_button4_in = user_buttons[1+0-:1];
    M_button5_in = user_buttons[0+0-:1];
    eliminateSig = M_button0_out | M_button1_out | M_button2_out | M_button3_out | M_button4_out | M_button5_out;
    M_array_led_controller_colors = {M_game_array[0+4+3-:4], M_game_array[9+4+3-:4], M_game_array[18+4+3-:4], M_game_array[27+4+3-:4], M_game_array[36+4+3-:4], M_game_array[45+4+3-:4]};
    array_led = M_array_led_controller_led_pulse;
    M_game_eliminate = eliminateSig;
    M_solve_button_cond_in = solve_button;
    M_start_button_cond_in = start_button;
    M_solve_button_dff_d = M_solve_button_cond_out;
    M_start_button_dff_d = M_start_button_cond_out;
    user_solvable[0+0-:1] = ~M_problem_solvable_q;
    user_solvable[1+0-:1] = M_problem_solvable_q;
    user_solvable[2+0-:1] = 1'h0;
    M_numbers_values = {M_game_array[0+0+3-:4], M_game_array[9+0+3-:4], M_game_array[18+0+3-:4], M_game_array[27+0+3-:4], M_game_array[36+0+3-:4], M_game_array[45+0+3-:4]};
    array_seg = M_numbers_seg;
    array_sel = ~M_numbers_sel;
    shiwei = M_count_down_q / 4'ha;
    gewei = M_count_down_q - (M_count_down_q / 4'ha * 4'ha);
    M_data_segments_values = {gewei, shiwei, M_problem_q[0+0+3-:4], M_problem_q[5+0+3-:4]};
    data_seg = M_data_segments_seg;
    data_sel = ~M_data_segments_sel;
    eliminatePosition = 1'h0;
    if (M_button0_out) begin
      eliminatePosition = 1'h0;
    end
    if (M_button1_out) begin
      eliminatePosition = 1'h1;
    end
    if (M_button2_out) begin
      eliminatePosition = 2'h2;
    end
    if (M_button3_out) begin
      eliminatePosition = 2'h3;
    end
    if (M_button4_out) begin
      eliminatePosition = 3'h4;
    end
    if (M_button5_out) begin
      eliminatePosition = 3'h5;
    end
    M_game_eliminatePosition = eliminatePosition;
    M_slow_clk_d = M_slow_clk_q + 1'h1;
    if (eliminateSig) begin
      if (M_count_down_q > 1'h0) begin
        M_count_down_d = M_count_down_q - 1'h1;
      end
    end
    
    case (M_state_q)
      INIT_state: begin
        M_array_led_controller_colors = 24'h012301;
        M_numbers_values = 24'hffffff;
        M_data_segments_values = 16'hffff;
        user_solvable = 1'h0;
        if (eliminateSig) begin
          M_state_d = PREPARE_state;
        end
      end
      PREPARE_state: begin
        M_array_led_controller_colors = 24'h222111;
        M_numbers_values = 24'h0ccbaf;
        M_data_segments_values = 16'hffff;
        user_solvable = 1'h0;
        game_rst = 1'h1;
        if (M_solve_button_cond_out) begin
          M_state_d = START1_state;
          M_count_down_d = 6'h32;
          M_start_button_dff_d = 1'h0;
          M_solve_button_dff_d = 1'h0;
        end
      end
      START1_state: begin
        M_alu_a = M_game_array[45+0+3-:4];
        M_alu_b = M_problem_q[5+0+3-:4];
        M_alu_alufn = 6'h32;
        M_first_ball_solvable_d = M_alu_out;
        if ((M_problem_q[5+4+0-:1] == 1'h0) | (M_problem_q[5+0+3-:4] == 1'h0)) begin
          M_first_ball_solvable_d = 1'h1;
        end
        M_state_d = START2_state;
      end
      START2_state: begin
        M_alu_a = M_game_array[36+0+3-:4];
        M_alu_b = M_problem_q[0+0+3-:4];
        M_alu_alufn = 6'h32;
        M_second_ball_solvable_d = M_alu_out;
        if ((M_problem_q[0+4+0-:1] == 1'h0) | (M_problem_q[0+0+3-:4] == 1'h0)) begin
          M_second_ball_solvable_d = 1'h1;
        end
        M_state_d = START3_state;
      end
      START3_state: begin
        M_alu_a = M_first_ball_solvable_q;
        M_alu_b = M_second_ball_solvable_q;
        M_alu_alufn = 6'h18;
        M_problem_solvable_d = M_alu_out;
        M_state_d = START4_state;
      end
      START4_state: begin
        M_alu_a = M_solve_button_dff_q;
        M_alu_b = M_problem_solvable_q;
        M_alu_alufn = 6'h18;
        M_solve_button_dff_d = 1'h0;
        if (M_alu_out) begin
          M_state_d = SOLVE_state;
        end else begin
          M_state_d = CHECK_state;
        end
      end
      SOLVE_state: begin
        if (M_problem_q[5+4+0-:1] == 1'h1) begin
          M_game_solve1 = 1'h1;
        end
        if (M_problem_q[0+4+0-:1] == 1'h1) begin
          M_game_solve0 = 1'h1;
        end
        M_problem_d = M_problem_set_problem_out;
        M_count_down_d = 6'h32;
        M_state_d = NEXTPROBLEM_state;
      end
      NEXTPROBLEM_state: begin
        M_alu_a = M_problem_counter_q;
        M_alu_b = 1'h1;
        M_alu_alufn = 6'h00;
        M_problem_counter_d = M_alu_out;
        M_state_d = CHECK_state;
      end
      CHECK_state: begin
        if (M_count_down_q == 1'h0) begin
          M_state_d = LOSE_state;
        end else begin
          if (M_problem_counter_q == 2'h3) begin
            M_state_d = WIN_state;
          end else begin
            if (M_start_button_dff_q) begin
              M_state_d = INIT_state;
            end else begin
              M_state_d = START1_state;
            end
          end
        end
      end
      LOSE_state: begin
        M_array_led_controller_colors = 24'h333333;
        M_numbers_values = 24'hfb50cf;
        M_data_segments_values = 16'hffff;
        user_solvable = 1'h0;
        if (eliminateSig) begin
          M_state_d = PREPARE_state;
        end
      end
      WIN_state: begin
        M_array_led_controller_colors = 24'h111111;
        M_numbers_values = 24'hfbe1df;
        M_data_segments_values = 16'hffff;
        user_solvable = 1'h0;
        if (eliminateSig) begin
          M_state_d = PREPARE_state;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_slow_clk_q <= 1'h0;
      M_count_down_q <= 1'h0;
      M_one_second_q <= 1'h0;
      M_problem_q <= 1'h0;
      M_start_button_dff_q <= 1'h0;
      M_solve_button_dff_q <= 1'h0;
      M_first_ball_solvable_q <= 1'h0;
      M_second_ball_solvable_q <= 1'h0;
      M_problem_solvable_q <= 1'h0;
      M_problem_counter_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_slow_clk_q <= M_slow_clk_d;
      M_count_down_q <= M_count_down_d;
      M_one_second_q <= M_one_second_d;
      M_problem_q <= M_problem_d;
      M_start_button_dff_q <= M_start_button_dff_d;
      M_solve_button_dff_q <= M_solve_button_dff_d;
      M_first_ball_solvable_q <= M_first_ball_solvable_d;
      M_second_ball_solvable_q <= M_second_ball_solvable_d;
      M_problem_solvable_q <= M_problem_solvable_d;
      M_problem_counter_q <= M_problem_counter_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
