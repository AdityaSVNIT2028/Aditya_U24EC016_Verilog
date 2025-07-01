`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer:Aditya 
// 
// Create Date: 26.06.2025 00:51:14
//////////////////////////////////////////////////////////////////////////////////


module traffic_light_tb();
reg i_clk, i_rst;
wire [5:0]o_light;

traffic_light_design uut(
.i_clk(i_clk),
.i_rst(i_rst),
.o_light(o_light)
);

always #5 i_clk = ~i_clk;

initial begin
i_rst = 1'b1;
i_clk = 1'b0;
#10 i_rst = 1'b0;
#200;
$finish;
end

endmodule
