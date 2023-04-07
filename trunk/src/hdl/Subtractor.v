`timescale 1ns/1ns

module Not1bit(input a, output out);
  C1 c1_not(1'b1, 1'b0, a, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, out);
endmodule

module Carry1bit(input a,b,ci, output c);
  C1 c1_carry(1'b0, b, a, a, 1'b1, b, ci, 1'b0, c);
endmodule

module Sum1bit(input a,b,c, output s);
  wire cbar;
  Not1bit not_sum(c, cbar);
  C2 c2_sum(c, cbar, cbar, c, a, 1'b0, b, 1'b1, s);
endmodule

module FullAdder1bit(input a, b, ci, output s, c);
  Carry1bit c1b(a,b,ci, c);
  Sum1bit s1b(a,b,ci, s);
endmodule

module Subtractor(input[2:0] A, B, output[2:0] S);
  wire[3:0] C;
  wire[2:0] Bnot;
  assign C[0] = 1'b1;
  genvar i;
  generate
    for(i = 0; i < 3; i = i + 1)begin
      Not1bit not_sub(B[i], Bnot[i]);
      FullAdder1bit FA(A[i], Bnot[i], C[i], S[i], C[i+1]);
    end
  endgenerate
endmodule
