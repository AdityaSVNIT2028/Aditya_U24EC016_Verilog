module full_adder(
  input i_a, i_b, i_c
  output o_s, o_c
);
  assign {o_c, o_s} = i_a + i_b + i_c;
endmodule
