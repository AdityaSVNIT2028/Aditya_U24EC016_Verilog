`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Aditya 
// Create Date: 22.06.2025 20:11:34
// Design Name: johnson counter 
// Module Name: johnson
// Target Devices: johnson counter
// Description: we are usign a D flip flop and have to make johnson counter using structural 
// modelling 
//////////////////////////////////////////////////////////////////////////////////

module johnson(input i_clk, i_rst,
output [2:0]o_q
    );
    wire [2:0]o_qbar;
    
    D_ff ff1 (.i_d(o_qbar[0]), .i_clk(i_clk), .i_rst(i_rst), .o_q(o_q[2]), .o_qbar(o_qbar[2]));
    D_ff ff2(.i_d(o_q[2]), .i_clk(i_clk), .i_rst(i_rst), .o_q(o_q[1]), .o_qbar(o_qbar[1]));
    D_ff ff3(.i_d(o_q[1]), .i_clk(i_clk), .i_rst(i_rst), .o_q(o_q[0]), .o_qbar(o_qbar[0]));
    
endmodule

module D_ff(input i_d, i_clk, i_rst,
output reg o_q, o_qbar);
always @(negedge i_clk) begin
if(i_rst)begin
o_q <= 1'b0;
o_qbar <= 1'b1;
end
else begin
o_q <= i_d;
o_qbar <= ~i_d;
end
end 
endmodule  