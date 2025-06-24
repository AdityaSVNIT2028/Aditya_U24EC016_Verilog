`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer:Aditya  
////////////////////////////////////////////////////////////////////////////////
module parallel_in_tb();
reg [3:0]i_d;
reg i_clk, i_rst;
wire [3:0] o_q;

parallel_in_design uut(
.i_d(i_d),
.i_clk(i_clk),
.i_rst(i_rst),
.o_q(o_q)
);

always #5 i_clk = ~i_clk;

initial begin
i_clk = 1'b0;
i_rst = 1;
#10 i_rst = 0; i_d = 4'b1011;
#10 $finish;
end

endmodule
