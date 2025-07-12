`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aditya 
// Create Date: 28.06.2025 11:02:46
//////////////////////////////////////////////////////////////////////////////////

module register_tb();
reg  write_en_i, clk_i, rst_i;
reg [3:0] in_address_i, out1_address_i, out2_address_i;
reg [15:0] In_i;
wire  [15:0] out1_o, out2_o;

register_design uut(
.write_en_i(write_en_i),
.clk_i(clk_i),
.rst_i(rst_i),
.in_address_i   (in_address_i  ),
.out1_address_i (out1_address_i),
.out2_address_i (out2_address_i),
.In_i(In_i),
.out1_o(out1_o),
.out2_o(out2_o)
);

always #5 clk_i = ~clk_i;

initial begin
In_i = 16'd25;
clk_i = 1'b0;
rst_i = 1'b1;
write_en_i = 1'b0;
out1_address_i = 4'd6;
out2_address_i = 4'b0;

repeat(10)
@(posedge clk_i) ;
rst_i = 1'b0;
write_en_i = 1'b1;
in_address_i = 4'd6;

 @(posedge clk_i)
 In_i = 16'd64;
 rst_i = 1'b0;
write_en_i = 1'b1;
in_address_i = 4'd0;


 @(posedge clk_i) 
rst_i = 1'b1;
@(posedge clk_i)

$finish;

end

endmodule
