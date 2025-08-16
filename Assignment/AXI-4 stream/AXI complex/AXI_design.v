`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2025 13:54:45
// Design Name: 
// Module Name: AXI_design
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// taking an assumtion that we are only dealing with the data that has only 4 differnt data stream
module AXI_design #(parameter n = 2,
parameter i = 4,
parameter d = 4
)
(input Aclk, Arst, Tvlaid,
input [(8*n)-1:0] Tdata,
input [(n-1) :0] Tstrb,
input [(n-1):0]Tkeep,
input Tlast,
input [(i-1):0] Tid,// this is for the transfer that belongs to the same data stream
input [(d-1):0] Tdest,// this is for the transfer that goes to same position
output reg Tready
 );
 reg [(i-1):0][127:0] mem_block;
 integer j;
 reg [(n-1):0][1:0] Tid_value;
// reg data_buffer_1_A, data_buffer_2_A, data_buffer_3_A, data_buffer_4_A;
 reg [127:0] data_buffer_1_A, data_buffer_1_B, data_buffer_1_C, data_buffer_1_D;
  reg [127:0] data_buffer_2_A, data_buffer_2_B, data_buffer_2_C, data_buffer_2_D;
  reg [127:0] data_buffer_3_A, data_buffer_3_B, data_buffer_3_C, data_buffer_3_D;
  reg [127:0] data_buffer_4_A, data_buffer_4_B, data_buffer_4_C, data_buffer_4_D;
  
 reg data_count_1_A, data_count_2_A, data_count_3_A, data_count_4_A;
 reg full_A, full_B, full_C, full_D;// as we have 4 memory block 
 
 // now reseting the condition
 always @(*) begin
 if(Arst) begin
 Tvalid <= 1'b0;
 data_count_1_A <= 1'b0; data_count_1_B <= 1'b0; data_count_1_C <= 1'b0; data_count_1_D <= 1'b0;
 data_count_2_A <= 1'b0; data_count_2_B <= 1'b0; data_count_2_C <= 1'b0; data_count_2_D <= 1'b0;
 data_count_3_A <= 1'b0; data_count_3_B <= 1'b0; data_count_3_C <= 1'b0; data_count_3_D <= 1'b0;
 data_count_4_A <= 1'b0; data_count_4_B <= 1'b0; data_count_4_C <= 1'b0; data_count_4_D <= 1'b0;

 full_A = 1'b0; full_B = 1'b0; full_C = 1'b0; full_D = 1'b0;
 end
 end
 
 integer m;
 

 
 //////////////////////////////////////// 2nd main block ///////////////////////////////////////////
 // as the reseting condition for the Arst to be deasserted is at synchronous side
 always @(posedge Aclk) begin
 
// 1st condition block 
 // the conditon for the both the master and slave is ready for data transfer 
 if( (!Arst) && Tvalid && Tready ) begin
 ///////////////////////////////////////    MAIN CONDITION TO BE INSERTED IN THIS /////////////////////////////////
 
 // 1st condition that transfer is only data byte 
 if(Tstrb && Tkeep) beign
 // now in this we have pick up the conditon in which the transfer is belong to the same data stream 
 case(Tid) 
 2'b0: begin
 case(Tdest)
 2'd0: begin data_buffer_1_A <= {data_buffer_1_A[95:0], Tdata};
 data_count_1_A = data_count_1_A + 1;
  end 
 2'd1:begin  data_buffer_2_A <= {data_buffer_2_A[95:0], Tdata};
 data_count_2_A = data_count_2_A + 1;
  end
 2'd2: begin data_buffer_3_A <= {data_buffer_3_A[95:0], Tdata};
 data_count_3_A = data_count_3_a + 1;
 end
 2'd3: begin data_buffer_4_A <= {data_buffer_4_A[95:0], Tdata};
 data_count_4_A <= data_count_4_A + 1;
 full_A <= 1'b1;
 end
 endcase 
 end
 //
 2'd1: begin 
 case (Tdest) begin
  2'd0: begin data_buffer_1_B <= {data_buffer_1_B[95:0], Tdata};
 data_count_1_B = data_count_1_B + 1;
  end 
 2'd1:begin  data_buffer_2_B <= {data_buffer_2_B[95:0], Tdata};
 data_count_2_B = data_count_2_B + 1;
  end
 2'd2: begin data_buffer_3_B <= {data_buffer_3_B[95:0], Tdata};
 data_count_3_B = data_count_3_B + 1;
 end
 2'd3: begin data_buffer_4_B <= {data_buffer_4_B[95:0], Tdata};
 data_count_4_B <= data_count_4_B + 1;
 full_b <= 1'b1;
 end
 endcase
 end
 //
 2'd2: begin
 case(Tdest) 
  2'd0: begin data_buffer_1_C <= {data_buffer_1_C[95:0], Tdata};
 data_count_1_C = data_count_1_C + 1;
  end 
 2'd1:begin  data_buffer_2_C <= {data_buffer_2_C[95:0], Tdata};
 data_count_2_C = data_count_2_C + 1;
  end
 2'd2: begin data_buffer_3_C <= {data_buffer_3_C[95:0], Tdata};
 data_count_3_C = data_count_3_C + 1;
 end
 2'd3: begin data_buffer_4_C <= {data_buffer_4_C[95:0], Tdata};
 data_count_4_C <= data_count_4_C + 1;
 full_C <= 1'b1;
 end
 endcase
 end
 //
  2'd3: begin
 case(Tdest) 
  2'd0: begin data_buffer_1_D <= {data_buffer_1_D[95:0], Tdata};
 data_count_1_D = data_count_1_D + 1;
  end 
 2'd1:begin  data_buffer_2_D <= {data_buffer_2_D[95:0], Tdata};
 data_count_2_D = data_count_2_D + 1;
  end
 2'd2: begin data_buffer_3_D <= {data_buffer_3_D[95:0], Tdata};
 data_count_3_D = data_count_3_D + 1;
 end
 2'd3: begin data_buffer_4_D <= {data_buffer_4_D[95:0], Tdata};
 data_count_4_D <= data_count_4_D + 1;
 full_D <= 1'b1;
 end
 endcase
 end
 //
 endcase
 // THE CONDITTON FOR THE DATA TO BE WRITTEN IS COMPLETED NOW THE
 
 end
 

   
 end
 
 end 
 
 // another always block
 always@(*)begin
  // now the condition that transfer byte is position byte and null byte 
 for (m = 0; m <= n; m = m+1) begin
 if ((Tkeep  & (!Tstrb)) || ((!Tkeep)&(!Tstrb))) begin
 Tready <= 1'b1;
 end
 
 else if (Tkeep & Tstrb) begin
 Tready = 1'b0;
 end 
 
 // we are not using the remaning conditon as it must nor be used 
 
 end 
 // this is the ending condtion for this
 
 end
 
 
 
 FIFO_design mem_block(.clk_i(Aclk), .rst_i(Arst), .data_in(), .write_en((data_count ==  2'd3) && (TREADY)), .read_en(1'b0), .full(full_fifo)
 
endmodule
