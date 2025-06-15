// Code your design here
// creating an 8 bit multiplier using half adder and full adder
module arr_mul_8(input 	[7:0]A, input 	[7:0]B, output 	[15:0] Y);
//  reg [63:0]P2;
wire [7:0]P[7:0];
//   integer a,b;
  wire [5:0]k;
wire  [6:0] S[0:6];
wire  [6:0] C[0:7];
  wire  Y14, Y15;
  
//    function [63:0]and_value;
//    input [7:0] A, B;
//     reg [63:0]P1;
//   integer i, j;
//   begin
//     for(i = 0; i<8; i++) begin
//       for(j = 0; j<8; j++)begin
//         P1[(8*i) +j]= A[j]&B[i];
//       end
//     end
//     and_value = P1;
//   end
//  endfunction

  
//   always@(*) begin 
//     P2 = and_value( A, B);
    
    
 	 assign   Y[0] = P[0][0];
genvar a;
  generate
    for(a = 0; a<7; a++) begin
assign	Y[a+1] = S[a][0];
    end
    
    for(a = 0; a<6;a++) begin
assign	Y[9+a] = k[a];
    end
  endgenerate
//   end
  
  genvar i,j; 
  generate 
    for (i =0; i<8; i++) begin
    for(j = 0; j<8;j++) begin
        assign P[i][j] =  A[j] & B[i];
      end
    end
    
  endgenerate
  

  
//       half_adder h1(.A(P[0][1]), .B(P[1][0]), .S(S[0]), .Cout(C[0]));
//     half_adder h2(.A(P[0][2]), .B(P[1][1]), .S(S[1]), Cout(C[1]));
      // now by generate block
     
      generate 
        
        for (i = 0; i<7; i++) begin
          half_adder ha(
            .A(P[0][i+1]), .B(P[1][i]), .S(S[0][i]), .Cout(C[0][i])
          );
        end
      endgenerate
  
           // creating some extra full adder that is not included bu the previous generate loop
generate 

  for (i = 1; i<7; i++)begin
    full_adder fa2(
      .A(P[i][7]), .B(P[i+1][6]), .Cin(C[i-1][6]), .S(S[i][6]), .Cout(C[i][6])
    );
  end
endgenerate
  
  // now generating last full adder
           generate 
             
             for( i = 2; i<7; i++) begin
               full_adder fa9(
                 .A(S[6][i]),.B(C[6][i-1]),.Cin(C[7][i-2]),.S(k[i-2]),.Cout(C[7][i-1])
               );
             end
           endgenerate
  
  // for full adder
  generate 

    for(i = 0; i<6; i++)begin
      for(j = 1; j < 7; j++) begin 
      full_adder fa1(
        .A(S[i][j]),.B(P[i+2][j-1]),.Cin(C[i][j]), .S(S[i+1][j-1]), .Cout(C[i+1][j-1])
      );
           end
    end
  endgenerate   
           

// now generating fa14 and fa15
                              full_adder fa14(
                                .A(P[7][7]), .B(C[7][5]), .Cin(C[6][6]),.S(Y14), .Cout(Y15)
                              );
             assign Y[14]  = Y14;
  assign Y[15] = Y15;           
  
  half_adder h8(.A(S[6][1]),.B(C[6][0]),.S(Y[8]), .Cout(C[7][0]));
//         full_adder(.A(P[1][7], .B(P[2][6]), Cin(C[0][6]), .S([1][6]), Cout(C[1][6]
//            );
                      
endmodule            
  
 
           
           module half_adder(input A, input B, output Cout, output S);
               assign S = A ^ B;
  assign Cout = A & B;
endmodule
           
           module full_adder(input A, input B, input Cin, output S, output Cout);
             assign S = A ^ B ^ Cin;
  assign Cout = (A & B) | (A & Cin) | (B & Cin);
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
