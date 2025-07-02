`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 24.06.2025 09:16:51
//////////////////////////////////////////////////////////////////////////////////

module button_tb();
reg button, clk;
wire pulse;

button_design uut(
.button(button),
.clk(clk),
.pulse(pulse)
);

always #5 clk = ~clk;

initial begin
clk = 1'b0;
button = 1'b0;
#15 button = 1'b1;
#10 button = 1'b0;
#10 button = 1'b1;
#25 button = 1'b0;
#45 button = 1'b1;
#200;
$finish;  
end
endmodule
