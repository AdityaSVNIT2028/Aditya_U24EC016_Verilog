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
