`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya
// Create Date: 28.06.2025 10:31:10
//////////////////////////////////////////////////////////////////////////////////

////////////////////////// 16X16 register file with 2 read and 1 write port ////////////////////////////////////// 
module register_design(input write_en_i, clk_i, rst_i,
input [3:0] in_address_i, out1_address_i, out2_address_i,
input [15:0] In_i,
output reg [15:0] out1_o, out2_o
    );
    
    reg [15:0] register[15:0];
    
    ////////////////////////////////////// FOR READING OPERATION THE CIRCUIT IS ASYNCHRONUS//////////////////////////////
    
    always @(*) begin
    #1
    out1_o <= register[out1_address_i];
    out2_o <= register[out2_address_i];
    end
    
    //////////////////////////////// RESET AND DATA INPUT FEEDING IS ALWAYS SYNCHRONUS////////////////////////////////
    integer i;
    always @(posedge clk_i) begin
    if(rst_i ==1'b1)begin
    
    for(i = 0; i<= 15; i = i+1) 
    register[i] <= 16'b0;
    end
    
    else begin
    
    if(write_en_i) 
    register[in_address_i] <= In_i;
    
    end
    end
    
    
endmodule
