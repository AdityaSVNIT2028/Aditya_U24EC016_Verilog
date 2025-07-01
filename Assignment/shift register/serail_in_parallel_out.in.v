`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya
// Create Date: 24.06.2025 12:24:34 
//////////////////////////////////////////////////////////////////////////////////


module serial_in_design( input i_d, i_rst, i_clk,
output [3:0]o_q
    );
    
    d_ff ff1(.D(i_d), .rst(i_rst), .clk(i_clk), .Q(o_q[0]));
    d_ff ff2(.D(o_q[0]), .rst(i_rst), .clk(i_clk), .Q(o_q[1]));
    d_ff ff3(.D(o_q[1]), .rst(i_rst), .clk(i_clk), .Q(o_q[2]));
    d_ff ff4(.D(o_q[2]), .rst(i_rst), .clk(i_clk), .Q(o_q[3]));
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

// for test bench
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SvNIT
// Engineer: Aditya 
// Create Date: 24.06.2025 10:33:33
//////////////////////////////////////////////////////////////////////////////////

module serial_shift_tb();
reg i_d, i_clk, i_rst;
wire[3:0] o_q;

serial_in_design uut(
.i_d(i_d),
.i_clk(i_clk), 
.i_rst(i_rst), 
. o_q(o_q)      
);

always #5 i_clk = ~i_clk;

initial begin
i_clk  = 1'b0;
i_rst = 1'b1;  
i_d = 1'b0;
#15 i_rst = 1'b0;
i_d = 1'b1;
#10 i_d = 1'b0;
#10 i_d = 1'b1;
#10 i_d = 1'b1;
#10 i_d = 1'b0;
#100$finish; 
end

endmodule

