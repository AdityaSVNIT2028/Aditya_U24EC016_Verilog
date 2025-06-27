`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya 
// Create Date: 27.06.2025 12:01:29
//////////////////////////////////////////////////////////////////////////////////

module barrel_left_design(input [31:0]i_a,
input clk_i,
input  [4:0]num_right_i,
output reg [31:0]o_y
    );
    wire [31:0]P5, P4, P3, P2, P1;
    
    ////////////////////////////////// Generating mux for column : 5///////////////////////////////////////////
    genvar  j;
    generate 
    
    for(j = 0; j <= 15; j = j+1) begin 
    
    mux_2X1 m1(.i0(i_a[j]), .i1(i_a[j+16]), .i_s(num_right_i[4]), .Y(P5[j])); 
   
    mux_2X1 m2(.i0(i_a[j+16]), .i1(i_a[j]), .i_s(num_right_i[4]), .Y(P5[j+16]));
    
    end 
    endgenerate
    ////////////////////////////////// genereating mux for column 4 //////////////////////////////////////////////////
    
    genvar i;
    generate 
    for ( i = 31; i >= 0; i= i-1) begin
    if (i>=8) begin
    mux_2X1 m3(.i0(P5[i]), .i1(P5[i-8]) , .i_s(num_right_i[3]), .Y(P4[i]));
    end
    else begin
    mux_2X1 m4(.i0(P5[i]), .i1(P5[i+24]), .i_s(num_right_i[3]), .Y(P4[i]));
    end
    end 
    endgenerate
    
    ////////////////////////////////////// Generating for column 3/////////////////////////////////////////////////////////
    
    genvar il;
    generate 
    for (il = 31; il >= 0; il = il-1) begin
    if( il >= 4) begin
    mux_2X1 m5(.i0(P4[il]), .i1(P4[il - 4]), .i_s(num_right_i[2]), .Y(P3[il]));
    end
    
    else begin
    mux_2X1 m6(.i0(P4[il]), .i1(P4[il +28]), .i_s(num_right_i[2]), .Y(P3[il]));
    end
    end
    endgenerate
    
    /////////////////////////////////////// For column 4 /////////////////////////////////////////////////////////
    genvar i2;
    generate
    for ( i2 = 31; i2 >= 0; i2 = i2 -1) begin
    if(i2 >=2) begin
    mux_2X1 m7(.i0(P3[i2]), .i1(P3[i2 -2]), .i_s(num_right_i[1]), .Y(P2[i2]));
    end
    
    else begin
    mux_2X1 m8(.i0(P3[i2]), .i1(P3[i2+30]), .i_s(num_right_i[1]), .Y(P2[i2]));
    end
    end
    endgenerate 
    
    ////////////////////////////////// /////For column 5/////////////////////////////////////////////////////////////
    
    genvar i3;
    generate
    for (i3 = 31; i3 >= 0 ; i3 = i3 -1) begin
    if(i3 >= 1) begin
    mux_2X1 m9(.i0(P2[i3]), .i1(P2[i3 -1]), .i_s(num_right_i[0]), .Y(P1[i3]));
    end
    
    else begin
    mux_2X1 m10(.i0(P2[i3]), .i1(P2[i3 +31]), .i_s(num_right_i[0]), .Y(P1[i3]));
    end 
    
    end
    endgenerate
    
    /////////////////////////////// now determining the output /////////////////////////////////////
    always@(negedge clk_i) begin
    o_y = P1;
    end
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya
//////////////////////////////////////////////////////////////////////////////////

module mux_2X1(input i0, i1, i_s,
output reg Y
    );
    always @(*) begin
    if(!i_s)
    Y = i0;
    else
    Y = i1;
    end
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SVNIT
// Engineer: Aditya
//////////////////////////////////////////////////////////////////////////////////

module mux_2X1(input i0, i1, i_s,
output reg Y
    );
    always @(*) begin
    if(!i_s)
    Y = i0;
    else
    Y = i1;
    end
endmodule
// tb
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2025 14:41:37 
//////////////////////////////////////////////////////////////////////////////////

module barallel_shift_right_tb();

reg [31:0] i_a;
reg clk_i;
reg [4:0] num_right_i;
wire [31:0] o_y;

// Instantiate the Unit Under Test (UUT)
barrel_left_design uut (
    .i_a(i_a),
    .clk_i(clk_i),
    .num_right_i(num_right_i),
    .o_y(o_y)
);

// Clock generation
always #5 clk_i = ~clk_i;

// Monitor output
initial begin
    $monitor("Time = %0t | i_a = %b, clk_i = %b, num_right_i = %b => o_y = %b", 
              $time, i_a, clk_i, num_right_i, o_y);
end

// Test stimulus
initial begin
    // Initialize inputs
    clk_i = 0;
      i_a = 32'b11110000111100001111000011110000;  
    num_right_i = 5'd0;

    // Wait for global reset
    @(negedge clk_i);

    num_right_i = 5'd1; 
    repeat(1) @(negedge clk_i
    );
    num_right_i = 5'd4; repeat(2) @(negedge clk_i
    );
//    num_right_i = 5'd8; #10;
//    num_right_i = 5'd16; #10;
//    num_right_i = 5'd31; #10;

    // Change input and shift again
//    i_a = 32'b11110000111100001111000011110000; #10;
//    num_right_i = 5'd2; #10;
//    num_right_i = 5'd10; #10;

    // End simulation
    $finish;
end

endmodule
