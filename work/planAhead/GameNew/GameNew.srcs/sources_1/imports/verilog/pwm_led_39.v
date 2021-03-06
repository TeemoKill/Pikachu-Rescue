/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     WIDTH = 8
*/
module pwm_led_39 (
    input clk,
    input rst,
    input [23:0] color,
    output reg [2:0] rgb_pulse
  );
  
  localparam WIDTH = 4'h8;
  
  
  localparam MUL = 4'hf;
  
  reg [23:0] colors;
  
  reg [7:0] M_ctr_d, M_ctr_q = 1'h0;
  
  always @* begin
    M_ctr_d = M_ctr_q;
    
    colors[16+7-:8] = color[16+7-:8] / 4'hf;
    colors[8+7-:8] = color[8+7-:8] / 4'hf;
    colors[0+7-:8] = color[0+7-:8] / 4'hf;
    rgb_pulse[0+0-:1] = M_ctr_q < colors[16+7-:8];
    rgb_pulse[1+0-:1] = M_ctr_q < colors[8+7-:8];
    rgb_pulse[2+0-:1] = M_ctr_q < colors[0+7-:8];
    M_ctr_d = M_ctr_q + 1'h1;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ctr_q <= 1'h0;
    end else begin
      M_ctr_q <= M_ctr_d;
    end
  end
  
endmodule
