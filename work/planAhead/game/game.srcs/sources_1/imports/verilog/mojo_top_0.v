/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    input [5:0] user_buttons,
    input beep_button,
    input [0:0] user_solve_button,
    output reg [6:0] user_seg,
    output reg [5:0] user_sel,
    output reg [7:0] led,
    output reg [17:0] user_led,
    output reg [0:0] user_solvable,
    output reg beep
  );
  
  
  
  reg rst;
  
  reg game_rst;
  
  reg eliminateSig;
  
  reg [3:0] eliminatePosition;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  reg [26:0] M_slow_clk_d, M_slow_clk_q = 1'h0;
  wire [1-1:0] M_twitter_wave;
  reg [1-1:0] M_twitter_in;
  reg [1-1:0] M_twitter_frequency;
  beeper_2 twitter (
    .clk(clk),
    .rst(rst),
    .in(M_twitter_in),
    .frequency(M_twitter_frequency),
    .wave(M_twitter_wave)
  );
  wire [7-1:0] M_numbers_seg;
  wire [6-1:0] M_numbers_sel;
  reg [24-1:0] M_numbers_values;
  multi_seven_segment_3 numbers (
    .clk(clk),
    .rst(rst),
    .values(M_numbers_values),
    .seg(M_numbers_seg),
    .sel(M_numbers_sel)
  );
  wire [18-1:0] M_led_controller_led_pulse;
  reg [24-1:0] M_led_controller_colors;
  multi_led_4 led_controller (
    .clk(clk),
    .rst(rst),
    .colors(M_led_controller_colors),
    .led_pulse(M_led_controller_led_pulse)
  );
  
  wire [1-1:0] M_button0_out;
  reg [1-1:0] M_button0_in;
  button_5 button0 (
    .clk(M_slow_clk_q[3+0-:1]),
    .in(M_button0_in),
    .out(M_button0_out)
  );
  wire [1-1:0] M_button1_out;
  reg [1-1:0] M_button1_in;
  button_5 button1 (
    .clk(M_slow_clk_q[3+0-:1]),
    .in(M_button1_in),
    .out(M_button1_out)
  );
  wire [1-1:0] M_button2_out;
  reg [1-1:0] M_button2_in;
  button_5 button2 (
    .clk(M_slow_clk_q[3+0-:1]),
    .in(M_button2_in),
    .out(M_button2_out)
  );
  wire [1-1:0] M_button3_out;
  reg [1-1:0] M_button3_in;
  button_5 button3 (
    .clk(M_slow_clk_q[3+0-:1]),
    .in(M_button3_in),
    .out(M_button3_out)
  );
  wire [1-1:0] M_button4_out;
  reg [1-1:0] M_button4_in;
  button_5 button4 (
    .clk(M_slow_clk_q[3+0-:1]),
    .in(M_button4_in),
    .out(M_button4_out)
  );
  wire [1-1:0] M_button5_out;
  reg [1-1:0] M_button5_in;
  button_5 button5 (
    .clk(M_slow_clk_q[3+0-:1]),
    .in(M_button5_in),
    .out(M_button5_out)
  );
  wire [1-1:0] M_solve_button1_out;
  reg [1-1:0] M_solve_button1_in;
  button_5 solve_button1 (
    .clk(M_slow_clk_q[3+0-:1]),
    .in(M_solve_button1_in),
    .out(M_solve_button1_out)
  );
  wire [1-1:0] M_solve_button2_out;
  reg [1-1:0] M_solve_button2_in;
  button_5 solve_button2 (
    .clk(M_slow_clk_q[3+0-:1]),
    .in(M_solve_button2_in),
    .out(M_solve_button2_out)
  );
  wire [1-1:0] M_solve_button3_out;
  reg [1-1:0] M_solve_button3_in;
  button_5 solve_button3 (
    .clk(M_slow_clk_q[3+0-:1]),
    .in(M_solve_button3_in),
    .out(M_solve_button3_out)
  );
  wire [1-1:0] M_game_reset_out;
  reg [1-1:0] M_game_reset_in;
  edge_detector_14 game_reset (
    .clk(M_slow_clk_q[3+0-:1]),
    .in(M_game_reset_in),
    .out(M_game_reset_out)
  );
  wire [3-1:0] M_game_solvable;
  wire [54-1:0] M_game_array;
  wire [6-1:0] M_game_leds;
  wire [1-1:0] M_game_sound;
  reg [1-1:0] M_game_eliminate;
  reg [4-1:0] M_game_eliminatePosition;
  reg [3-1:0] M_game_solve;
  gameSelf_15 game (
    .clk(M_slow_clk_q[3+0-:1]),
    .rst(game_rst),
    .eliminate(M_game_eliminate),
    .eliminatePosition(M_game_eliminatePosition),
    .solve(M_game_solve),
    .solvable(M_game_solvable),
    .array(M_game_array),
    .leds(M_game_leds),
    .sound(M_game_sound)
  );
  
  always @* begin
    M_slow_clk_d = M_slow_clk_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    M_game_reset_in = 1'h0;
    game_rst = M_game_reset_out;
    M_button0_in = user_buttons[5+0-:1];
    M_button1_in = user_buttons[4+0-:1];
    M_button2_in = user_buttons[3+0-:1];
    M_button3_in = user_buttons[2+0-:1];
    M_button4_in = user_buttons[1+0-:1];
    M_button5_in = user_buttons[0+0-:1];
    eliminateSig = M_button0_out | M_button1_out | M_button2_out | M_button3_out | M_button4_out | M_button5_out;
    M_game_eliminate = eliminateSig;
    M_solve_button1_in = user_solve_button[0+0-:1];
    M_solve_button2_in = 1'h0;
    M_solve_button3_in = 1'h0;
    M_game_solve = {M_solve_button1_out, M_solve_button2_out, M_solve_button3_out};
    user_solvable[0+0-:1] = M_solve_button1_out;
    M_led_controller_colors = {M_game_array[45+4+3-:4], M_game_array[36+4+3-:4], M_game_array[27+4+3-:4], M_game_array[18+4+3-:4], M_game_array[9+4+3-:4], M_game_array[0+4+3-:4]};
    user_led = M_led_controller_led_pulse;
    led = 8'h00;
    led[0+5-:6] = user_buttons;
    M_numbers_values = {M_game_array[0+0+3-:4], M_game_array[9+0+3-:4], M_game_array[18+0+3-:4], M_game_array[27+0+3-:4], M_game_array[36+0+3-:4], M_game_array[45+0+3-:4]};
    user_seg = M_numbers_seg;
    user_sel = ~M_numbers_sel;
    M_twitter_in = beep_button;
    M_twitter_frequency = 11'h7d0;
    beep = M_twitter_wave;
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
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_slow_clk_q <= 1'h0;
    end else begin
      M_slow_clk_q <= M_slow_clk_d;
    end
  end
  
endmodule