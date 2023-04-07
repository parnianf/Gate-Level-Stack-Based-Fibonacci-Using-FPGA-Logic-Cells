`timescale 1ns/1ns
module Fib(input[2:0] N, input clk, clr, start, output done, output[4:0] result);
  wire sel_reg, ld, sel_cmp, sel_sub, push, pop, en, gt, is_empty;
  Datapath dp(clk, clr, sel_reg, ld, sel_cmp, sel_sub, push, pop, en, N, gt, is_empty, result);
  Controller cu(clk, clr, gt, is_empty, start, sel_reg, ld, sel_cmp, sel_sub, push, pop, en, done);
endmodule
