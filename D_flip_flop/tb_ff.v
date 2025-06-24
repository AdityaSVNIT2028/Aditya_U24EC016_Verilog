`timescale 1ns / 1ps
module tb_ff();
reg clk, D, rst;
wire Q;
d_ff uut(
.clk(clk), 
.rst(rst),
.D(D),
.Q(Q));

initial begin
$monitor(" Time = %0t| clk = %b, rst = %b, D = %b, Q = %b", $time, clk, rst, D, Q);
end 

always begin 
 clk = ~clk; #5;
end

initial begin

clk = 0;
rst = 1; D = 1;#5

D = 0; #3
rst = 0; D = 1; #2
D = 1; #5
#5
$finish;

end

endmodule
