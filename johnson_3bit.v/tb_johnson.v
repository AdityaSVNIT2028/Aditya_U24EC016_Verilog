`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Aditya
// Create Date: 23.06.2025 10:35:18
// Design Name: test bench for johnson counter
// Module Name: tb_johnson
// Target Devices: Johnson counter 
//////////////////////////////////////////////////////////////////////////////////

module tb_johnson();
reg i_clk, i_rst;
wire [2:0]o_q;

johnson dut(
.i_clk(i_clk),
.i_rst(i_rst),
.o_q(o_q)
);

initial  begin
$monitor("Time = %0t | i_clk = %b, i_rst = %b => o_q = %b", $time, i_clk, i_rst, o_q);
end

always #5 i_clk = ~i_clk;
initial begin
i_clk = 0;
i_rst = 1; 
#10 i_rst = 0;
#200
$finish;
end

endmodule
