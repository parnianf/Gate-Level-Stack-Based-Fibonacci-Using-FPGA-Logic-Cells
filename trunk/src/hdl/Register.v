`timescale 1ns/1ns
module Register1bit(input clk, clr, in, ld, output out);
  S2 s2(clk, clr, out, in, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, ld, out);
endmodule

module Register(input clk, clr, ld, input [2:0] in, output [2:0] out);
  genvar i;
  generate
    for(i = 2; i > -1; i = i - 1)begin
      Register1bit register1b(clk, clr, in[i], ld, out[i]);
    end
  endgenerate
endmodule

