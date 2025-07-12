`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 11.07.2025 12:50:15
// Module Name: lut_ram_32
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////

module lut_ram_32 #(
                    parameter width = 32,// woed addresable memory of size 32 kb
                               depth = 16384
)( input clk_i, rst_i, w_en_i,  
input [width -1 :0]data_in, 
input [$clog2(depth) -1 : 0]address_i,
    output reg [width-1 :0]data_out 
    );
    
    reg [width -1: 0] register [depth -1: 0];
    
     //////////////////////////////////// MEMORY INITIALIZATION ////////////////////////////
    initial begin
        $readmemh("register.mem", register);  // Load memory contents from file
    end
    ////////////////////////////////////  condition for read ////////////////////////////
    always@(posedge clk_i) begin
     
    if(rst_i) begin
    data_out <= 0 ;
    end
    
    else begin
    if(!w_en_i) begin
    data_out <= register[address_i];
    end
    else begin 
    register[address_i] <= data_in;
    end
    end
    end
    
//    /////////////////////////////////////////// CONDITION FOR WRITE ////////////////////////////////
//    always @(posedge clk_i) begin
//    if(w_en_i) begin
//    register[address_i] <= data_in;
//    end
//    end
    
    
endmodule
