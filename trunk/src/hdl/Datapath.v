`timescale 1ns/1ns

module Datapath(input clk, clr, sel_reg, ld, sel_cmp, sel_sub, push, pop, en, input[2:0] N, output gt, is_empty, output[4:0] result);
  wire [2:0] stack_in, stack_out, mux_sel_reg_out, stack_reg_out, mux_sel_sub_out, mux_sel_cmp_out;
  wire eq;
  Stack stack(clk, clr,  push, pop, stack_in, is_empty, stack_out);
  Multiplexer2to1 mux2to1_reg(stack_out, N, sel_reg, mux_sel_reg_out);
  Register register(clk, clr, ld, mux_sel_reg_out, stack_reg_out);
  Multiplexer2to1 mux2to1_sub(3'd1, 3'd2, sel_sub, mux_sel_sub_out);
  Subtractor subtractor(stack_reg_out, mux_sel_sub_out, stack_in);
  Multiplexer2to1 mux2to1_cmp(stack_reg_out, N, sel_cmp, mux_sel_cmp_out);
  Comparator cmp(mux_sel_cmp_out, 3'd1, gt, eq);
  Accumulator acc(clk, clr, en, result);
endmodule