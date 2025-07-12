`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya
// Create Date: 11.07.2025 16:22:16
// Module Name: lut_ram_tb
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module lut_ram_tb #(
                    parameter width = 8,// woed addresable memory of size 32 kb
                               depth = 65536   
);

reg clk_i, rst_i, w_en_i;  
reg [width -1 :0]data_in;
reg [$clog2(depth) -1 : 0]address_i;
wire [width-1 :0]data_out ;

lut_ram_8 uut (
.clk_i(clk_i),
.rst_i(rst_i),
.w_en_i(w_en_i),
.data_in(data_in),
.address_i(address_i),
.data_out(data_out)
);

always #5 clk_i = ~clk_i;



initial begin
clk_i = 1'b0;
rst_i = 1'b0;
rst_i = 1'b1;
@(posedge clk_i);
rst_i = 1'b0;
w_en_i = 1'b1;
address_i = 16'b0;
data_in = 8'hab;
@(posedge clk_i); 
w_en_i = 1'b0;
@(posedge clk_i);
 

$finish;

end

endmodule
