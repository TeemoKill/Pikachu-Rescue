/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module multi_led_15 (
    input clk,
    input rst,
    input [23:0] colors,
    output reg [17:0] led_pulse
  );
  
  
  
  localparam RED = 24'hff0800;
  
  localparam YELLOW = 24'hff7700;
  
  localparam GREEN = 24'h00dd00;
  
  localparam PURPLE = 24'hff0099;
  
  reg [95:0] color_set;
  
  wire [3-1:0] M_led0_rgb_pulse;
  reg [24-1:0] M_led0_color;
  pwm_led_39 led0 (
    .clk(clk),
    .rst(rst),
    .color(M_led0_color),
    .rgb_pulse(M_led0_rgb_pulse)
  );
  wire [3-1:0] M_led1_rgb_pulse;
  reg [24-1:0] M_led1_color;
  pwm_led_39 led1 (
    .clk(clk),
    .rst(rst),
    .color(M_led1_color),
    .rgb_pulse(M_led1_rgb_pulse)
  );
  wire [3-1:0] M_led2_rgb_pulse;
  reg [24-1:0] M_led2_color;
  pwm_led2_41 led2 (
    .clk(clk),
    .rst(rst),
    .color(M_led2_color),
    .rgb_pulse(M_led2_rgb_pulse)
  );
  wire [3-1:0] M_led3_rgb_pulse;
  reg [24-1:0] M_led3_color;
  pwm_led_39 led3 (
    .clk(clk),
    .rst(rst),
    .color(M_led3_color),
    .rgb_pulse(M_led3_rgb_pulse)
  );
  wire [3-1:0] M_led4_rgb_pulse;
  reg [24-1:0] M_led4_color;
  pwm_led_39 led4 (
    .clk(clk),
    .rst(rst),
    .color(M_led4_color),
    .rgb_pulse(M_led4_rgb_pulse)
  );
  wire [3-1:0] M_led5_rgb_pulse;
  reg [24-1:0] M_led5_color;
  pwm_led_39 led5 (
    .clk(clk),
    .rst(rst),
    .color(M_led5_color),
    .rgb_pulse(M_led5_rgb_pulse)
  );
  
  always @* begin
    color_set = 96'hff0800ff770000dd00ff0099;
    M_led0_color = color_set[(colors[0+3-:4])*24+23-:24];
    M_led1_color = color_set[(colors[4+3-:4])*24+23-:24];
    M_led2_color = color_set[(colors[8+3-:4])*24+23-:24];
    M_led3_color = color_set[(colors[12+3-:4])*24+23-:24];
    M_led4_color = color_set[(colors[16+3-:4])*24+23-:24];
    M_led5_color = color_set[(colors[20+3-:4])*24+23-:24];
    led_pulse[0+2-:3] = M_led0_rgb_pulse;
    led_pulse[3+2-:3] = M_led1_rgb_pulse;
    led_pulse[6+2-:3] = M_led2_rgb_pulse;
    led_pulse[9+2-:3] = M_led3_rgb_pulse;
    led_pulse[12+2-:3] = M_led4_rgb_pulse;
    led_pulse[15+2-:3] = M_led5_rgb_pulse;
  end
endmodule
