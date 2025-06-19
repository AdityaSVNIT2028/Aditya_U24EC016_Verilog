module demux(input  i_f,
             input [1:0]i_s,
            output reg a, b, c, d);
  always @(*) begin 
    a = (~(i_s[0]))&(~i_s[1]) & i_f;
    b = (~i_s[1]) & (i_s[0]) & i_f;
    ...
  end
endmodule
