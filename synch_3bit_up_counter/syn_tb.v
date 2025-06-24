`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2025 20:00:46
// Design Name: 
// Module Name: syn_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module syn_tb();
reg clk;
wire [2:0] Q;

sync_cou uut(
.clk(clk),
.Q(Q)
);
always #5 clk = ~clk;

initial begin
clk = 1'b0;
#100
$finish;
end

endmodule
