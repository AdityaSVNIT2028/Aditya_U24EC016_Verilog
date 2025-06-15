// Code your design here

`timescale 1ns / 1ps

module arr_mul_8(
    input  [7:0] A,
    input  [7:0] B,
    output [15:0] Y
);

    // Partial products P[i][j] = A[j] & B[i]
    wire [7:0] P[7:0];
  wire  [6:0] S[0:7];
  wire [6:0]C[0:7];
  
  // for P value
    genvar i,j;
    generate
      for (i=0; i<8; i=i+1) begin 
        for (j=0; j<8; j=j+1) begin
                assign P[i][j] = A[j] & B[i];
            end
        end
    endgenerate

  assign Y[0] = P[0][0];
  
  // now for halfadder adder taking P[0][1] to P[0][7]
  genvar i1;
  generate 
    for(i1 = 1; i1 <=7; i1 ++)begin
      half_adder ha1(.A(P[0][i1]), .B(P[1][i1 -1]), .S(S[0][i1 -1]), .Cout(C[0][i1 -1]));
    end
  endgenerate 
  
  // 
  assign Y[1] = S[0][0];
  
// for 
  genvar i2, j2;
generate 
  for(i2 = 0; i2 <=5; i2 ++)begin 
    for(j2 = 1; j2 <= 6-i2; j2 ++) begin
      full_adder fa1(.A(S[i2][j2]), .B(P[i2 +2][j2 -1]), .Cin(C[i2][j2 -1]), .S(S[i2 +1][j2 -1]), .Cout(C[i2 +1][j2 -1]) );
    end
  end
endgenerate
                                                     
// now assigning y2 to y7
  genvar i3;
generate 
  for(i3 = 2; i3 <=7; i3 ++) begin
    assign Y[i3] = S[i3 -1][0];
  end
endgenerate

                                                     
// now next adders
  genvar i4;
generate 
  for(i4 = 1; i4 <= 6; i4 ++) begin
    full_adder fa2(
      .A(P[i4][7]), .B(P[i4 +1][6]), .Cin(C[i4 -1][6]),   .S(S[i4][6]), .Cout(C[i4][6])
    );
  end
  
endgenerate
  
 genvar i5, j5;                     
generate 
  for(i5 = 1; i5 <=5; i5 ++) begin 
    for(j5 = 6; j5 >= 2; j5 --) begin 
      full_adder fa3(
        .A(S[i5][j5]), .B(P[i5 +2][j5 -1]), .Cin(C[i5][j5 -1]), .S(S[i5 +1][j5 -1]), .Cout(C[i5 +1][j5 -1])
      );
    end
  end
endgenerate
        
        half_adder ha3(
          .A(S[6][1]), .B(C[6][0]), .S(S[7][0]), .Cout(C[7][0])
        );
        assign Y[8] = S[7][0];
    
  genvar i6;
generate
  for(i6 = 2; i6 <= 6; i6 ++)begin
    full_adder fa4(
      .A(S[6][i6]), .B(C[6][i6 -1]), .Cin(C[7][i6 -2]), .S(S[7][i6 -1]), .Cout(C[7][i6 -1])
                   );
  end
endgenerate
 
  genvar i7;
generate
  for(i7 = 1; i7 <=5; i7 ++) begin
    assign Y[8+i7] = S[7][i7];
  end
endgenerate
        
        full_adder fa5(
          .A(P[7][7]), .B(C[6][6]), .Cin(C[7][5]), .S(S[7][6]), .Cout(C[7][6])
        );
        assign Y[14] = S[7][6];
        assign Y[15] = C[7][6];
                                                     
endmodule

module half_adder(input A, input B, output S, output Cout);
    assign S = A ^ B;
    assign Cout = A & B;
endmodule

module full_adder(input A, input B, input Cin, output S, output Cout);
    assign S = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule

// tb
module array_mult_tb();
  reg [7:0] A, B;
  wire [15:0] Y;  

  // Instantiate the multiplier
  arr_mul_8 uut(
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
    A = 8'd13; B = 8'd11; #10;  // 143
    A = 8'd15; B = 8'd15; #10;  // 225
    A = 8'd1;  B = 8'd255; #10; // 255
    A = 8'd0;  B = 8'd100; #10; // 0
    A = 8'd255; B = 8'd255; #10; // 65025
    $finish;
  end
endmodule
