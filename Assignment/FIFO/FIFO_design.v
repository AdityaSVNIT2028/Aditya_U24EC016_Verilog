`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 28.06.2025 17:16:03// 
//////////////////////////////////////////////////////////////////////////////////


module FIFO_design #(parameter FIFO_d = 8,
                      parameter FIFO_w = 8)
( input clk_i, rst_i, 
  input [FIFO_w -1 : 0] data_in,
  input write_en, read_en,                      
  output empty, full,
  output reg [FIFO_w -1 :0] data_out
    );
    
    reg [$clog2(FIFO_d) -1 : 0] write_ptr, read_ptr;
    reg [FIFO_w -1:0] register [0 : FIFO_d -1];
    ////////////////////////////    FOR IMPROVING THE CODE WE USE FIFO COUNT SO THAT THE EMPTY //////////////////////////////////
    ///////////////////////////////////     AND FULL CONDITION IS BETTERLY CHECK    /////////////////////////////////////////////
    reg [$clog2(FIFO_d) : 0] FIFO_count;
    
    /////////////////////////////////////////   MENTIONING THE CONDITION FOR FULL AND EMPTY ////////////////////////////////////
    assign empty = (FIFO_count == 0);
    assign full = (FIFO_count == FIFO_d);
    
    ///////////////////////////////////////// NoW OPERATING THE FIFO OPERATION//////////////////////////
    //////////////////////////////////////////  RESETING CONDITION  //////////////////////////////////////////
     integer i;
    always@(posedge clk_i) begin
    if(rst_i) begin
    write_ptr <= 1'b0;
    read_ptr <= 1'b0;
    data_out <= 8'b0;
    FIFO_count <= 3'b0;
        for (i = 0; i < FIFO_d; i = i + 1) begin
            register[i] <= 1'b0;
        end
    
    end
    end
    
    /////////////////////////////////////////   READING CONDITION   //////////////////////////////////////////////////////
     always@(posedge clk_i) begin
     if( !empty && read_en && !rst_i) begin
     data_out <= register[read_ptr];
     read_ptr <= (read_ptr +1) % FIFO_d ;
     FIFO_count <= FIFO_count -1;
     end
     end
     
     ////////////////////////////////////////   WRITING CONDITION   //////////////////////////////////////////////////////
     always@(posedge clk_i) begin
     if(!full && write_en && !rst_i) begin
     register[write_ptr] <= data_in;
     write_ptr <= (write_ptr +1) % FIFO_d ;
     FIFO_count <= FIFO_count +1;
     end
     end


endmodule
