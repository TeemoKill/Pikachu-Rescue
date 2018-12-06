/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu16_1 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] out
  );
  
  
  
  always @* begin
    
    case (alufn[4+1-:2])
      2'h0: begin
        
        case (alufn[0+1-:2])
          2'h0: begin
            out = a + b;
          end
          2'h1: begin
            out = a - b;
          end
          2'h2: begin
            out = a * b;
          end
          2'h3: begin
            out = a / b;
          end
          default: begin
            out = 1'h0;
          end
        endcase
      end
      2'h1: begin
        
        case (alufn[0+3-:4])
          4'h8: begin
            out = a & b;
          end
          4'he: begin
            out = a | b;
          end
          4'h6: begin
            out = a ^ b;
          end
          4'ha: begin
            out = a;
          end
          4'h1: begin
            out = ~(a | b);
          end
          4'h7: begin
            out = ~(a & b);
          end
          4'h9: begin
            out = ~(a ^ b);
          end
          default: begin
            out = 1'h0;
          end
        endcase
      end
      2'h2: begin
        
        case (alufn[0+1-:2])
          2'h0: begin
            out = a << b;
          end
          2'h1: begin
            out = a >> b;
          end
          2'h3: begin
            out = $signed(a) >>> b;
          end
          default: begin
            out = a;
          end
        endcase
      end
      2'h3: begin
        
        case (alufn[1+1-:2])
          2'h0: begin
            out = 1'h0;
          end
          2'h1: begin
            out = (a == b);
          end
          2'h2: begin
            out = (a < b);
          end
          2'h3: begin
            out = (a <= b);
          end
          default: begin
            out = 1'h0;
          end
        endcase
      end
      default: begin
        out = 1'h0;
      end
    endcase
  end
endmodule
