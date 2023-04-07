`timescale 1ns/1ns
module S2plus_cu(input clk, clr, s2, s1, s0, start, gt, is_empty, output splus);
  wire d01, d10, d11;
  S2 s2_s2p(clk, clr, 1'b0, d01, d10, d11, s2, 1'b0, s0, 1'b1, splus);
  C1 c1_s2p_1(1'b1, 1'b0, 1'b0, s1, 1'b0, 1'b0, gt, 1'b0, d01);
  C1 c1_s2p_2(1'b1, 1'b0, 1'b0, 1'b1, 1'b0, s1, gt, 1'b0, d10);
  C1 c1_s2p_3(1'b1, 1'b0, 1'b0, 1'b1, 1'b0, is_empty, s1, 1'b0, d11);
endmodule

module S1plus_cu(input clk, clr, s2, s1, s0, start, gt, is_empty, output splus);
  S2 s2_s1p_cu(clk, clr, 1'b0, 1'b1, 1'b1, 1'b0, s1, 1'b0, s0, 1'b1, splus);
endmodule

module S0plus_cu(input clk, clr, s2, s1, s0, start, gt, is_empty, output splus);
  wire d00, d01, d10;
  S2 s2_s0p(clk, clr, d00, d01, d10, 1'b0, s2, 1'b0, s0, 1'b1, splus);
  C1 c1_s0p_1(s1, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, start, 1'b0, d00);
  C1 c1_s0p_2(1'b1, 1'b0, gt, 1'b0, 1'b0, 1'b0, s1, 1'b0, d01);
  C1 c1_s0p_3(1'b1, 1'b0, 1'b0, 1'b1, 1'b0, gt, s1, 1'b0, d10);
endmodule

module Sel_reg_cu(input clk, clr, s2, s1, s0, start, gt, is_empty, output selreg);
  wire s0bar;
  C1 c1_reg_1(s0bar, 1'b0, s1, 1'b0, 1'b0, s1, s2, 1'b0, selreg);
  C1 c1_reg_2(1'b1, 1'b0, s0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, s0bar);
endmodule

module Sel_cmp_cu(input clk, clr, s2, s1, s0, start, gt, is_empty, output selcmp);
  C1 c1_sel_cmp(s0, 1'b0, s1, 1'b0, 1'b0, 1'b0, s2, 1'b0, selcmp);
endmodule

module Ld_cu(input clk, clr, s2, s1, s0, start, gt, is_empty, output ldout);
  wire s0bar;
  C2 c2_ld(s0bar, 1'b0, s0, 1'b0, s2, 1'b0, s1, 1'b1, ldout);
  C1 c1_ld(1'b1, 1'b0, s0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, s0bar);
endmodule

module Sel_sub_cu(input clk, clr, s2, s1, s0, start, gt, is_empty, output sel_sub_out);
  C1 c1_sel_sub(1'b0, s0, s1, 1'b0, 1'b0, 1'b0, s2, 1'b0, sel_sub_out);
endmodule

module Push_cu(input clk, clr, s2, s1, s0, start, gt, is_empty, output push_out);
  C1 c1_push(s1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, s2, 1'b0, push_out);
endmodule

module Pop_cu(input clk, clr, s2, s1, s0, start, gt, is_empty, output pop_out);
  C1 c1_pop(s2, 1'b0, s0, 1'b0, 1'b0, 1'b0, s1, 1'b0, pop_out);
endmodule

module En_cu(input clk, clr, s2, s1, s0, start, gt, is_empty, output en_out);
  C1 c1_en(1'b0, 1'b0, 1'b0, 1'b0, s0, s1, s2, 1'b0, en_out);
endmodule

module Done_cu(input clk, clr, s2, s1, s0, start, gt, is_empty, output done_out);
  wire s0bar;
  C1 c1_reg_1(s0bar, 1'b0, s1, 1'b0, 1'b0, s1, s2, 1'b0, done_out);
  C1 c1_reg_2(1'b1, 1'b0, s0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, s0bar);
endmodule

module Controller(input clk, clr, gt, is_empty, start, output sel_reg, ld, sel_cmp, sel_sub, push, pop, en, done);
  wire s2, s1, s0, s2p, s1p, s0p, clr_out, sel_reg_out, sel_cmp_out, ld_out, sel_sub_out, push_out, pop_out, en_out, done_out;
  wire [2:0] ps;
  S2plus_cu s2p_cu(clk, clr, ps[2], ps[1], ps[0], start, gt, is_empty, ps[2]);
  S1plus_cu s1p_cu(clk, clr, ps[2], ps[1], ps[0], start, gt, is_empty, ps[1]);
  S0plus_cu s0p_cu(clk, clr, ps[2], ps[1], ps[0], start, gt, is_empty, ps[0]);
  Sel_reg_cu sel_reg_cu(clk, clr, ps[2], ps[1], ps[0], start, gt, is_empty, sel_reg);
  Sel_cmp_cu sel_cmp_cu(clk, clr, ps[2], ps[1], ps[0], start, gt, is_empty, sel_cmp);
  Ld_cu ld_cu(clk, clr, ps[2], ps[1], ps[0], start, gt, is_empty, ld);
  Sel_sub_cu sel_sub_cu(clk, clr, ps[2], ps[1], ps[0], start, gt, is_empty, sel_sub);
  Push_cu push_cu(clk, clr, ps[2], ps[1], ps[0], start, gt, is_empty, push);
  Pop_cu pop_cu(clk, clr, ps[2], ps[1], ps[0], start, gt, is_empty, pop);
  En_cu en_cu(clk, clr, ps[2], ps[1], ps[0], start, gt, is_empty, en);
  Done_cu done_cu(clk, clr, ps[2], ps[1], ps[0],start, gt, is_empty, done);
endmodule
