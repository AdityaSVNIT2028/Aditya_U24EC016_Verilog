`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 27.06.2025 20:48:41
//////////////////////////////////////////////////////////////////////////////////

module barrel_shifter_multifunction( 
input [31:0] data_i,
input [4:0] s_i,
input right_i,
output [31:0]o_y
);
parameter left_r = 1'b0,
          right_r = 1'b1;
          
    wire [31:0] o_y1, o_y2;
    
    barrel_shift_right r1(.data_i(data_i), .s_i(s_i), .o_y(o_y1));
    barrel_shift_left l1 (.data_i(data_i), .s_i(s_i), .o_y(o_y2));

    assign o_y = right_i ? o_y1 : o_y2;
    
endmodule
////////////////////right shift barrel shifter////////////////////////

module barrel_shift_right( input [31:0] data_i,
input [4:0] s_i,
output [31:0]o_y
);
wire [31:0] s0, s1, s2 ,s3;

//////////////// for stage 1 //////////
assign s0 = s_i[0] ? {data_i[0], data_i[31:1]} : data_i;

//////////////////// For stage 2 ////////////////
assign s1 = s_i[1] ? {s0[1:0], s0[31:2]} : s0;

//////////////////// for stage 3///////////////
assign s2 = s_i[2] ? {s1[3:0], s1[31:4]} : s1;

//////////////////////// for stage 4 /////////////////////
assign s3 = s_i[3] ? {s2[7:0], s2[31:8]} : s2;

//////////////////////// for last stage //////////////////////
assign o_y = s_i[4] ? {s3[15:0], s3[31:16]} : s3;
endmodule

///////////////////////// left shift module//////////////////////
module barrel_shift_left(input [31:0]data_i,
input [4:0]s_i, 
output [31:0]o_y
);
wire [31:0] s0, s1, s2, s3;

assign s0 = s_i[0] ? {data_i[30:0] , data_i[31]} : data_i;
assign s1 = s_i[1] ? {s0[29:0] , s0[31:30]} : s0;
assign s2 = s_i[2] ? {s1[27:0], s1[31:28]} : s1;
assign s3 = s_i[3] ? {s2[23:0], s2[31:24]} : s2;
assign o_y = s_i[4] ? {s3[15:0], s3[31:16]} : s3;
endmodule
// for tb
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aditya
// Create Date: 28.06.2025
// Module Name: tb
// Description: Testbench for barrel_shifter_multifunction
//////////////////////////////////////////////////////////////////////////////////

module tb();
    reg [31:0] data_i;
    reg [4:0] s_i;
    reg right_i;
    wire [31:0] o_y;

    // DUT instantiation
    barrel_shifter_multifunction uut (
        .data_i(data_i), 
        .s_i(s_i),
        .right_i(right_i),
        .o_y(o_y)
    );

    initial begin
        // Monitor changes
        $monitor("Time=%0t | right_i=%b | s_i=%d | data_i=%b | o_y=%b", 
                 $time, right_i, s_i, data_i, o_y);
        
        // Test 1: Right shift by 0
        data_i = 32'hA5A5A5A5;  // 10100101...
        s_i = 5'd0;
        right_i = 1'b1; // Right shift
        #10;

        // Test 2: Right shift by 4
        s_i = 5'd4;
        #10;

        // Test 3: Left shift by 4
        right_i = 1'b0;
        s_i = 5'd4;
        #10;

        // Test 4: Left shift by 8
        s_i = 5'd8;
        #10;

        // Test 5: Right shift by 8
        right_i = 1'b1;
        s_i = 5'd8;
        #10;

        // Test 6: Right shift by 31
        s_i = 5'd31;
        #10;

        // Test 7: Random input
        data_i = 32'h12345678;
        s_i = 5'd5;
        right_i = 1'b0; // Left shift
        #10;

        s_i = 5'd5;
        right_i = 1'b1; // Right shift
        #10;

        $finish;
    end
endmodule
