`timescale 1ns/1ns
module Comparator1bit(input a, b, eq, gt, output EQ, GT);
  wire w;
  C2 c2_eq(eq,1'b0,1'b0, eq, b, 1'b0, a, 1'b1, EQ);
  C1 c1_1(1'b0, 1'b0, 1'b0, a,1'b0, b, eq, 1'b0, w);
  C1 c1_2(w, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, gt, 1'b0, GT);
endmodule

module Comparator(input [2:0] A,B,output GT,EQ);
  wire [3:0] gt,eq;
  assign GT = gt[0];
  assign EQ = eq[0];
  assign gt[3] = 1'b0;
  assign eq[3] = 1'b1;
  genvar i;
  generate
    for(i=2;i>-1;i=i-1) begin: comp1b
      Comparator1bit comparator1bit(A[i],B[i],eq[i+1],gt[i+1],eq[i],gt[i]);
    end
  endgenerate
endmodule
