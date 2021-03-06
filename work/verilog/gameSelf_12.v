/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module gameSelf_12 (
    input clk,
    input rst,
    input eliminate,
    input [3:0] eliminatePosition,
    input solve1,
    input solve0,
    output reg [53:0] array,
    output reg sound
  );
  
  
  
  localparam SOLVELENGTH = 3'h6;
  
  localparam SOLVELENGTHMINUSONE = 4'h5;
  
  localparam MERGELENGTH = 2'h2;
  
  reg [3:0] mergePosition;
  
  reg [53:0] M_solveArray_d, M_solveArray_q = 1'h0;
  reg [2:0] M_mergeCounter_d, M_mergeCounter_q = 1'h0;
  wire [4-1:0] M_rg_out;
  randomGenerator_32 rg (
    .clk(clk),
    .rst(rst),
    .out(M_rg_out)
  );
  
  always @* begin
    M_solveArray_d = M_solveArray_q;
    M_mergeCounter_d = M_mergeCounter_q;
    
    array = M_solveArray_q;
    mergePosition = 4'h5 - M_mergeCounter_q;
    sound = 1'h0;
    if (M_solveArray_q[(mergePosition)*9+8+0-:1] & M_solveArray_q[(mergePosition - 1'h1)*9+8+0-:1]) begin
      if (M_solveArray_q[(mergePosition)*9+8-:9] == M_solveArray_q[(mergePosition - 1'h1)*9+8-:9]) begin
        M_solveArray_d[(mergePosition)*9+0+3-:4] = M_solveArray_q[(mergePosition)*9+0+3-:4] + 1'h1;
        M_solveArray_d[(mergePosition - 1'h1)*9+8-:9] = 1'h0;
        sound = 1'h1;
      end
    end
    if (~M_solveArray_q[45+8+0-:1]) begin
      M_solveArray_d[9+44-:45] = M_solveArray_q[0+44-:45];
      M_solveArray_d[0+8-:9] = 1'h0;
    end
    if (~M_solveArray_q[36+8+0-:1]) begin
      M_solveArray_d[9+35-:36] = M_solveArray_q[0+35-:36];
      M_solveArray_d[0+8-:9] = 1'h0;
    end
    if (~M_solveArray_q[27+8+0-:1]) begin
      M_solveArray_d[9+26-:27] = M_solveArray_q[0+26-:27];
      M_solveArray_d[0+8-:9] = 1'h0;
    end
    if (~M_solveArray_q[18+8+0-:1]) begin
      M_solveArray_d[9+17-:18] = M_solveArray_q[0+17-:18];
      M_solveArray_d[0+8-:9] = 1'h0;
    end
    if (~M_solveArray_q[9+8+0-:1]) begin
      M_solveArray_d[9+8-:9] = M_solveArray_q[0+8-:9];
      M_solveArray_d[0+8-:9] = 1'h0;
    end
    if (~M_solveArray_q[0+8+0-:1]) begin
      M_solveArray_d[0+8+0-:1] = 1'h1;
      M_solveArray_d[0+4+3-:4] = M_rg_out;
      M_solveArray_d[0+0+3-:4] = 1'h1;
    end
    if (eliminate) begin
      M_solveArray_d[(eliminatePosition)*9+8-:9] = 1'h0;
    end
    if (solve1) begin
      M_solveArray_d[45+8-:9] = 1'h0;
    end
    if (solve0) begin
      M_solveArray_d[36+8-:9] = 1'h0;
    end
    M_mergeCounter_d = M_mergeCounter_q + 1'h1;
    if (M_mergeCounter_q == 5'h05) begin
      M_mergeCounter_d = 1'h0;
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_solveArray_q <= 1'h0;
      M_mergeCounter_q <= 1'h0;
    end else begin
      M_solveArray_q <= M_solveArray_d;
      M_mergeCounter_q <= M_mergeCounter_d;
    end
  end
  
endmodule
