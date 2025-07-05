`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Aditya
// Engineer: SVNIt 
// 
// Create Date: 04.07.2025 07:42:18
// 
//////////////////////////////////////////////////////////////////////////////////

module lift_tb();
reg [2:0] current_floor, desired_floor;
reg clk_i, rst_i;
wire com;
wire [2:0]out_floor;

lift_design uut (
.clk_i(clk_i),
.rst_i(rst_i),
.current_floor(current_floor),
.desired_floor(desired_floor),
.com(com),
.out_floor(out_floor)
);

always #5 clk_i = ~clk_i;

initial begin
clk_i = 1'b0;
rst_i = 1'b1;

current_floor = 3'b001;
desired_floor = 3'b100;
  
rst_i = 1'b0;
repeat(5) @(posedge clk_i);
 current_floor = 3'b010;
 desired_floor = 3'b001;
 
 repeat(5) @(posedge clk_i);
 current_floor = 3'b100;
 desired_floor = 3'b001;
 
 repeat(5) @(posedge clk_i);
 current_floor = 3'b010;
 desired_floor = 3'b010;
 
 repeat(7)@(posedge clk_i);
 $finish;

end

endmodule
