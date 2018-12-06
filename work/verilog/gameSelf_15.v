/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module gameSelf_15 (
    input clk,
    input rst,
    input eliminate,
    input [3:0] eliminatePosition,
    input [2:0] solve,
    output reg [2:0] solvable,
    output reg [53:0] array,
    output reg [5:0] leds,
    output reg sound
  );
  
  
  
  localparam SOLVELENGTH = 3'h6;
  
  localparam SOLVELENGTHMINUSONE = 3'h5;
  
  localparam SOLVELENGTHMINUSTWO = 3'h4;
  
  localparam MERGELENGTH = 2'h2;
  
  reg [3:0] mergePosition;
  
  reg problem1_solvable;
  
  reg problem2_solvable;
  
  reg problem3_solvable;
  
  reg [53:0] M_solveArray_d, M_solveArray_q = 1'h0;
  reg [2:0] M_mergeCounter_d, M_mergeCounter_q = 1'h0;
  reg [17:0] M_problem1_d, M_problem1_q = 1'h0;
  reg [17:0] M_problem2_d, M_problem2_q = 1'h0;
  reg [17:0] M_problem3_d, M_problem3_q = 1'h0;
  wire [4-1:0] M_rg_out;
  randomGenerator_44 rg (
    .clk(clk),
    .rst(rst),
    .out(M_rg_out)
  );
  
  always @* begin
    M_solveArray_d = M_solveArray_q;
    M_mergeCounter_d = M_mergeCounter_q;
    M_problem1_d = M_problem1_q;
    
    M_problem1_d[9+8-:9] = 9'h101;
    array = M_solveArray_q;
    leds = {M_solveArray_q[45+8+0-:1], M_solveArray_q[36+8+0-:1], M_solveArray_q[27+8+0-:1], M_solveArray_q[18+8+0-:1], M_solveArray_q[9+8+0-:1], M_solveArray_q[0+8+0-:1]};
    mergePosition = 3'h5 - M_mergeCounter_q;
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
    problem1_solvable = 1'h1;
    if (M_problem1_q[9+8+0-:1]) begin
      if (M_solveArray_q[45+8-:9] != M_problem1_q[9+8-:9]) begin
        problem1_solvable = 1'h0;
      end
    end
    if (M_problem1_q[0+8+0-:1]) begin
      if (M_solveArray_q[36+8-:9] != M_problem1_q[0+8-:9]) begin
        problem1_solvable = 1'h0;
      end
    end
    problem2_solvable = 1'h1;
    if (M_problem2_q[9+8+0-:1]) begin
      if (M_solveArray_q[45+8-:9] != M_problem2_q[9+8-:9]) begin
        problem2_solvable = 1'h0;
      end
    end
    if (M_problem2_q[0+8+0-:1]) begin
      if (M_solveArray_q[36+8-:9] != M_problem2_q[0+8-:9]) begin
        problem2_solvable = 1'h0;
      end
    end
    problem3_solvable = 1'h1;
    if (M_problem3_q[9+8+0-:1]) begin
      if (M_solveArray_q[45+8-:9] != M_problem3_q[9+8-:9]) begin
        problem3_solvable = 1'h0;
      end
    end
    if (M_problem3_q[0+8+0-:1]) begin
      if (M_solveArray_q[36+8-:9] != M_problem3_q[0+8-:9]) begin
        problem3_solvable = 1'h0;
      end
    end
    solvable = {problem3_solvable, problem2_solvable, problem1_solvable};
    if (solve[0+0-:1] && problem1_solvable) begin
      if (M_problem1_q[9+8+0-:1]) begin
        M_solveArray_d[45+8-:9] = 1'h0;
      end
      if (M_problem1_q[0+8+0-:1]) begin
        M_solveArray_d[36+8-:9] = 1'h0;
      end
    end
    if (solve[1+0-:1] && problem2_solvable) begin
      if (M_problem2_q[9+8+0-:1]) begin
        M_solveArray_d[45+8-:9] = 1'h0;
      end
      if (M_problem2_q[0+8+0-:1]) begin
        M_solveArray_d[36+8-:9] = 1'h0;
      end
    end
    if (solve[2+0-:1] && problem3_solvable) begin
      if (M_problem3_q[9+8+0-:1]) begin
        M_solveArray_d[45+8-:9] = 1'h0;
      end
      if (M_problem3_q[0+8+0-:1]) begin
        M_solveArray_d[36+8-:9] = 1'h0;
      end
    end
    if (eliminate) begin
      M_solveArray_d[(eliminatePosition)*9+8-:9] = 1'h0;
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
      M_problem1_q <= 1'h0;
      M_problem2_q <= 1'h0;
      M_problem3_q <= 1'h0;
    end else begin
      M_solveArray_q <= M_solveArray_d;
      M_mergeCounter_q <= M_mergeCounter_d;
      M_problem1_q <= M_problem1_d;
      M_problem2_q <= M_problem2_d;
      M_problem3_q <= M_problem3_d;
    end
  end
  
endmodule
