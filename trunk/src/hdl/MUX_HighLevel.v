`timescale 1ns/1ns
module Multiplexer2to1HL(input in0, in1, input sel, output out);
  assign #2  out = sel ? in1 : in0;
endmodule

module Multiplexer4to1HL(input in0, in1, in2, in3, input [1:0] sel, output reg out);
  always @(in0, in1, in2, sel)begin
    #4
    case(sel)
      2'b00: out = in0;
      2'b01: out = in1;
      2'b10: out = in2;
      2'b11: out = in3;
    endcase
  end 
endmodule
