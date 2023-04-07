`timescale 1ns/1ns

module HalfAdder(input a, b, en, clr, output res, c);
  C1 c1_ha(1'b0, a, b, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, c);
  S2 s2_ha(en, clr, 1'b0, 1'b1, 1'b1, 1'b0, a, 1'b0, b, 1'b1, res);
endmodule

module Accumulator(input clk, clr, en, output[4:0] out);
  wire [6:0] C;
  assign C[0] = 1'b1;
  genvar i;
  generate
    for(i = 0; i < 5; i = i + 1)begin
      HalfAdder HA(out[i], C[i], en, clr, out[i],C[i+1]);
    end
  endgenerate
endmodule

