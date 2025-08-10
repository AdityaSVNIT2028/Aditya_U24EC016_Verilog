// Code your design here
// creating an 8bit array multiplier
module array_mult_8(input [7:0]A, input [7:0]B,output [15:0]Y);
  reg [7:0]P[7:0];
  reg [7:0]S[6:0];
  reg [6:0]Cout;
  reg [7:0]K[5:0];// we can use shift operation so that there is no need for k type memory block
             
             always@(*)begin
               P = and_value(A, B);
               // for Y0
               Y[0] = P[0][0];
               
               // for Y1
               K[0][7] = 0;
               K[0][6:0] = P[0][7:1];
               Y[1] = S[0][0];
               
//                //for Y2
//                K[1][7] = Cout[0];
//                K[1][6:0] = S[0][7:1];
//                Y[2] = S[1][0];
               
//                // for Y3
               for(i = 1; i<6; i++) begin
                 K[i][7] = Cout[i-1];
                 K[1][6:0] = S[i-1][7:1];
                 if(i< 6) begin
                   Y[i+1] = S[I][0];
                 end
                 else begin
                   Y[14:7]=S[6];
                   Y[15] = Cout[6];
                 end
                 
               end
               
             end
             
             //calling of the module
             cla_8_bit a0( .A(K[0]), .B(P[1]), .S(S[0]), .Cout(Cout[0]));
             cla_8_bit a1( .A(K[1], .B(P[2]), .S(S[1]), .Cout(Cout[1]));
             cla_8_bit a2( .A(K[2]), .B(P[3]), .S(S[2]), .Cout(Cout[2]));
             cla_8_bit a3( .A(K[3]), .B(P[4]), .S(S[3]), .Cout(Cout[3]));
             cla_8_bit a4( .A(K[4], .B(P[5]), .S(S[4]), .Cout(Cout[4]));
             cla_8_bit a5( .A(K[5]), .B(P[6]), .S(S[5]), .Cout(Cout[5]));
             cla_8_bit a6( .A(K[6]), .B(P[7]), .S(S[6]), .Cout(Cout[6]));

             
             function [7:0]and_value[7:0];
               input [7:0] A, B;
               reg [7:0]P1[7:0];
               integer i, j;
               begin
                 for(i = 0; i<8; i++) begin
                   for(j = 0; j<8; j++)begin
                     P1[i][j] = B[i]&A[j];
                   end
                 end
                 P1 = and_value;
               end
             endfunction
endmodule

module cla_8_bit(input [7:0]A, input [7:0]B, output reg [7:0]S, output Cout );
  integer i;
   reg [8:0]C
  reg [7:0]G;
  reg [7:0]P;
  always @(*)
    begin
      
      C[0] = 0;
      
      G = A & B;
      P = A ^ B;
      
       for(i = 0; i<8; i++)
        begin
         C[i+1] = G[i] | (P[i]&C[i]);
          S[i] = P[i]^C[i];
        end 
      
    end
  assign Cout = C[8];
endmodule 
