`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 24.06.2025 21:42:11
//////////////////////////////////////////////////////////////////////////////////

module bi_dire_tb();
reg i_d, i_clk, i_rst, i_right;
wire [3:0]o_q;

BI_shift_design uut(
.i_d(i_d),
.i_clk(i_clk),
.i_rst(i_rst),
.i_right(i_right),
.o_q(o_q)
);

always #5 i_clk = ~i_clk;

initial begin
i_rst = 1'b1;
i_right = 1'b1;
i_clk = 1'b0;
#10;// now for the right shift operation
i_rst = 1'b0;
i_d =1'b1;
#10 i_d = 1'b1;
#10 i_d = 1'b0;
#10 i_d = 1'b0;
#60 
i_rst = 1'b1;
#10 i_rst = 1'b0;
i_right = 1'b0;
 i_d = 1'b1;
#10 i_d = 1'b1;
#10 i_d = 1'b0;
#10 i_d = 1'b0;
#40 $finish ;

end
endmodule
