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

integer i1;


initial begin
clk_i = 1'b0; 
rst_i = 1'b1;
write_en  = 1'b0;
read_en = 1'b0;
data_in = 0;

repeat(2) @(posedge clk_i) ;
rst_i = 1'b0;


for( i1 = 0; i1< FIFO_d -2; i1 = i1 +1) begin
@(posedge clk_i) ;
data_in = 23+i1;
write_en = 1;

end
write_en = 1'b0;
@(posedge clk_i); 

read_en = 1'b1;

repeat (8) @(posedge clk_i);

read_en = 1'b0;
write_en = 1'b1; 
for(i1 =0; i1<6; i1 = i1 +1) begin
@(posedge clk_i) 
data_in = i1+ 2;
end

#20 
write_en = 1'b0;
read_en = 1'b1;


#70 $finish;
end

endmodule
