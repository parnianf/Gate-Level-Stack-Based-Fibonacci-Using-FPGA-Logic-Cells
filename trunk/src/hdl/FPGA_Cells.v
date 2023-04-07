`timescale 1ns/1ns
module C2(input D00, D01, D10, D11, A1, B1, A0, B0, output out);
  wire S1, S0;
  assign #1 S1 = A1 || B1;
  assign #1 S0 = A0 && B0;
  Multiplexer4to1HL mux(D00, D01, D10, D11, {S1, S0}, out);
endmodule

module C1(input A0, A1, SA, B0, B1, SB, S0, S1, output F);
  wire F1, F2, S2;
  assign #1 S2 = S0 || S1;
  Multiplexer2to1HL mux1(A0, A1, SA, F1);
  Multiplexer2to1HL mux2(B0, B1, SB, F2);
  Multiplexer2to1HL mux3(F1, F2, S2, F);
endmodule

module S2(input clk, clr, D00, D01, D10, D11, A1, B1, A0, B0, output reg out);
  wire S1, S0, D;
  assign #1 S1 = A1 || B1;
  assign #1 S0 = A0 && B0;
  Multiplexer4to1HL mux(D00, D01, D10, D11, {S1, S0}, D);
  always @(posedge clk, posedge clr)begin
    if(clr)
      out <= 1'b0;
    else
      out <= D;
  end
endmodule
