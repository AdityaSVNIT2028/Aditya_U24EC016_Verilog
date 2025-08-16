`timescale 1ns/1ps


module AXI_simple #(parameter n = 3)// here n is representing the bytes in 
(input clk_i, rst_i, TVALID,
input [((8*n)-1):0]TDATA,
output reg TREADY
);
reg [127:0]data_buffer;
reg full;
reg [1:0]data_count;
wire full_fifo ;


// First seting the reseting condition
always @( posedge clk_i) begin
if(rst_i) begin
 data_buffer <= 128'b0;
 TREADY <= 1'b0;
 full <= 1'b0;
 data_count <= 2'b0;
// full_fifo <= 1'b0;
end 

// now the condition for the reset to be deasserted synchronusly

else begin
if(!full && TVALID && TREADY) begin
case(data_count)
    2'b00: begin data_buffer[31:0] <= TDATA;
                data_count <= data_count + 1;
          end
    2'b01: begin data_buffer[63:32] <= TDATA;
                data_count <= data_count + 1;
          end 
    2'b10: begin data_buffer[95:64] <= TDATA;
                data_count <= data_count + 1;
           end
    2'b11: begin data_buffer[127:96] <= TDATA;
                
                full  <= 1'b1;
           end 
    default: ;
endcase 
end

else if(full && TVALID && TREADY) begin
 data_buffer <= 128'b0;
 data_count <= 2'b0;
 full <= 1'b0;
end

TREADY <= !full_fifo;
end
end


FIFO_design mem(.clk_i(clk_i), .rst_i(rst_i), .data_in(data_buffer), .write_en((data_count ==  2'd3) && (TREADY)), .read_en(1'b0), .full(full_fifo));

endmodule 