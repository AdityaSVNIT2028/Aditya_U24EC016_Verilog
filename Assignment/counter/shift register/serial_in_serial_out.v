`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 24.06.2025 10:05:54
// Module Name: Serail_shift_design
// Description: making a 4 bit shift register of type serial in erail out using D flip flop
//////////////////////////////////////////////////////////////////////////////////

module Serial_shift_design( input i_d, i_clk, i_rst,
output o_q
    );
    wire [2:0]Q;
    d_ff ff1(.D(i_d), .clk(i_clk), .rst(i_rst), .Q(Q[0]));
    d_ff ff2(.D(Q[0]), .clk(i_clk), .rst(i_rst), .Q(Q[1]));
    d_ff ff3(.D(Q[1]), .clk(i_clk), .rst(i_rst), .Q(Q[2]));
    d_ff ff4(.D(Q[2]), .clk(i_clk), .rst(i_rst), .Q(o_q));
endmodule

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
// Company: SvNIT
// Engineer: Aditya 
// Create Date: 24.06.2025 10:33:33
//////////////////////////////////////////////////////////////////////////////////

module serial_shift_tb();
reg i_d, i_clk, i_rst;
wire o_q;

Serial_shift_design uut(
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
