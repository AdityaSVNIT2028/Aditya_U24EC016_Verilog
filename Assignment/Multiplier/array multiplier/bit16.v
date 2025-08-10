// Code your design here

`timescale 1ns / 1ps

module arr_mul_16(
  input  [15:0] A,
  input  [15:0] B,
  output [31:0] Y
);

    
  wire [15:0] P[15:0];
  wire  [14:0] S[0:15];
  wire [14:0]C[0:15];
  
  // making variable for partial sum
    genvar i,j;
    generate
      for (i=0; i<16; i=i+1) begin 
        for (j=0; j<16; j=j+1) begin
                assign P[i][j] = A[j] & B[i];
            end
        end
    endgenerate

  assign Y[0] = P[0][0];
  
  // now for halfadder adder taking P[0][1] to P[0][7]
  genvar i1;
  generate 
    for(i1 = 1; i1 <=15; i1 ++)begin
      half_adder ha1(.A(P[0][i1]), .B(P[1][i1 -1]), .S(S[0][i1 -1]), .Cout(C[0][i1 -1]));
    end
  endgenerate 
  
  // 
  assign Y[1] = S[0][0];
  
// for 
  genvar i2, j2;
generate 
  for(i2 = 0; i2 <=13; i2 ++)begin 
    for(j2 = 1; j2 <= 14-i2; j2 ++) begin
      full_adder fa1(.A(S[i2][j2]), .B(P[i2 +2][j2 -1]), .Cin(C[i2][j2 -1]), .S(S[i2 +1][j2 -1]), .Cout(C[i2 +1][j2 -1]) );
    end
  end
endgenerate
                                                     
// now assigning y2 to y15
  genvar i3;
generate 
  for(i3 = 2; i3 <=15; i3 ++) begin
    assign Y[i3] = S[i3 -1][0];
  end
endgenerate

                                                     
// now next adders
  genvar i4;
generate 
  for(i4 = 1; i4 <= 14; i4 ++) begin
    full_adder fa2(
      .A(P[i4][15]), .B(P[i4 +1][14]), .Cin(C[i4 -1][14]),   .S(S[i4][14]), .Cout(C[i4][14])
    );
  end
  
endgenerate
  
 genvar i5, j5;                     
generate 
  for(i5 = 1; i5 <=13; i5 ++) begin 
    for(j5 = 14; j5 >= 2; j5 --) begin 
      full_adder fa3(
        .A(S[i5][j5]), .B(P[i5 +2][j5 -1]), .Cin(C[i5][j5 -1]), .S(S[i5 +1][j5 -1]), .Cout(C[i5 +1][j5 -1])
      );
    end
  end
endgenerate
        
        half_adder ha3(
          .A(S[14][1]), .B(C[14][0]), .S(S[15][0]), .Cout(C[15][0])
        );
  assign Y[16] = S[15][0];
    
  genvar i6;
generate
  for(i6 = 2; i6 <= 14; i6 ++)begin
    full_adder fa4(
      .A(S[14][i6]), .B(C[14][i6 -1]), .Cin(C[15][i6 -2]), .S(S[15][i6 -1]), .Cout(C[15][i6 -1])
                   );
  end
endgenerate
 
  genvar i7;
generate
  for(i7 = 1; i7 <=13; i7 ++) begin
    assign Y[16+i7] = S[15][i7];
  end
endgenerate
        
        full_adder fa5(
          .A(P[15][15]), .B(C[14][14]), .Cin(C[15][13]), .S(S[15][14]), .Cout(C[15][14])
        );
  assign Y[30] = S[15][14];
  assign Y[31] = C[15][14];
                                                     
endmodule

module half_adder(input A, input B, output S, output Cout);
    assign S = A ^ B;
    assign Cout = A & B;
endmodule

module full_adder(input A, input B, input Cin, output S, output Cout);
    assign S = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule

// now for tb
// Code your testbench here
// or browse Examples
// now for testbench
`timescale 1ns / 1ps
module array_mult_tb();
  reg [15:0] A, B;
   wire [31:0] Y;  

  // Instantiate the multiplier
  arr_mul_16 uut(
    .A(A),
    .B(B),
    .Y(Y)   
  );

  initial begin
    $monitor("Time = %0t | A = %d, B = %d => Y = %d", $time, A, B, Y);
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, array_mult_tb);
  end 

  initial begin 
    // Apply test cases
    A = 16'd30; B = 16'd11; #10;  // 143
    A = 16'd15; B = 16'd15; #10;  // 225
    A =16'd1;  B = 16'd255; #10; // 255
    A = 16'd0;  B = 16'd100; #10; // 0
    A = 16'd255; B = 16'd255; #10; // 65025
    $finish;
  end
endmodule

