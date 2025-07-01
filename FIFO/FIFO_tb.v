`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 28.06.2025 23:32:26
//////////////////////////////////////////////////////////////////////////////////

module FIFO_tb #(parameter FIFO_d = 8, 
                 parameter FIFO_w = 8) ();
reg clk_i, rst_i;              
reg [FIFO_w -1 : 0] data_in;  
reg write_en, read_en;  
wire empty, full;                    
wire [FIFO_w -1 :0] data_out;

FIFO_design uut (
.clk_i(clk_i),
.rst_i(rst_i), 
.write_en(write_en),
.read_en(read_en),
.data_in(data_in),
.empty(empty),
.full(full), 
.data_out(data_out)
);

always #5 clk_i = ~clk_i;

initial begin

end

endmodule
