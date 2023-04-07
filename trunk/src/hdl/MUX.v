`timescale 1ns/1ns

module Multiplexer2to11bit(input A, B, sel, output out);
  C1 c1(1'b0,1'b1,A,1'b0, 1'b1, B, sel,1'b0, out);
endmodule

module Multiplexer2to1(input[2:0] A, B, input sel, output[2:0] out);
  genvar i;
  generate
    for(i = 2; i > -1; i = i - 1)begin
      Multiplexer2to11bit multiplexer2to11bit(A[i], B[i], sel, out[i]);
    end
  endgenerate
  
endmodule