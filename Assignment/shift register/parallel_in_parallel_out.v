`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 24.06.2025 12:55:56
//////////////////////////////////////////////////////////////////////////////////

module parallel_in_design(input [3:0]i_d, 
input i_clk, i_rst,
output [3:0]o_q
    );
    d_ff ff1(.D(i_d[0]), .clk(i_clk), .rst(i_rst), .Q(o_q[0]));
    d_ff ff2(.D(i_d[1]), .clk(i_clk), .rst(i_rst), .Q(o_q[1]));
    d_ff ff3(.D(i_d[2]), .clk(i_clk), .rst(i_rst), .Q(o_q[2]));
    d_ff ff4(.D(i_d[3]), .clk(i_clk), .rst(i_rst), .Q(o_q[3]));
endmodule
`timescale 1ns / 1ps
module d_ff(
input clk, D, rst,
output reg Q
    );
    
    always@(negedge clk) begin
    if(rst)
    Q <= 1'b0;
    else
    Q <= D;
    end
endmodule

// now for tb
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
