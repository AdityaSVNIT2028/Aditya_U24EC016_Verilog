// Code your design here
// creating a 4 bit array multiplier 
module array_mult_4_bit (input logic [3:0] A, input logic [3:0]B, output logic [7:0]Z);
  
  logic [3:0][3:0]P;
  logic [5:0]S;
  logic [10:0]C;
  
  
   assign Z[0] = P[0][0];
   assign P = and_value(A, B);
    
    half_adder h1(
      .A(P[1][0]), 
      .B(P[0][1]),
      .S(Z[1]),
      .Cout(C[0])
    );
    
    half_adder h2(
      .A(P[2][0]),
      .B(P[1][1]),
      .S(S[0]),
      .Cout(C[1])
    );
    
    full_adder f1(
      .A(P[0][2]),
      .B(S[0]),
      .Cin(C[0]),
      .S(Z[2]),
      .Cout(C[3])
    );
  
  half_adder h3(
    .A(P[2][1]),
    .B(P[3][0]),
    .S(S[1]),
    .Cout(C[2])
  );
  
  full_adder f2(
    .A(S[1]),
    .B(P[1][2]),
    .Cin(C[1]),
    .S(S[2]),
    .Cout(C[4])
  );
  
  full_adder f3(
    .A(P[0][3]),
    .B(S[2]),
    .Cin(C[3]),
    .S(Z[3]),
    .Cout(C[6])
  );
  
  full_adder f4(
    .A(P[3][1]),
    .B(P[2][2]),
    .Cin(C[2]),
    .S(S[3]),
    .Cout(C[5])
  );
  
  full_adder f5(
    .A(S[3]),
    .B(P[1][3]),
    .Cin(C[4]),
    .S(S[4]),
    .Cout(C[7])
  );
  
  half_adder h4(
    .A(S[4]),
    .B(C[6]),
    .S(Z[4]),
    .Cout(C[9])
  );
  
  full_adder f6(
    .A(P[2][3]),
    .B(P[3][2]),
    .Cin(C[5]),
    .S(S[5]),
    .Cout(C[8])
  );
  
  full_adder f7(
    .A(S[5]),
    .B(C[7]),
    .Cin(C[9]),
    .S(Z[5]),
    .Cout(C[10])
  );
  
  full_adder f8(
    .A(P[3][3]),
    .B(C[8]),
    .Cin(C[10]),
    .S(Z[6]),
    .Cout(Z[7])
  );
    


  
  
  function logic [3:0][3:0]and_value;
    input logic [3:0] A, B;
    logic [3:0][3:0]value;
    integer i, j;
    begin 
      for(i = 0; i<4; i++)
        begin
          for(j = 0; j<4; j++)
            begin
              value[i][j] = A[i]&B[j];
            end
        end
      return value;
    end
  endfunction
endmodule

module full_adder(A, B, Cin, S, Cout);
  input logic A, B, Cin;
  output logic S, Cout;
  always_comb begin
  S = A^B^Cin;
  Cout = (Cin & ( A^B )) + (A&B);
  end
endmodule

module half_adder(A, B, S, Cout);
  input logic A, B;
  output logic S, Cout;
  always_comb begin
  S = A^B;
  Cout = A&B ;
  end
endmodule

// for test bench
// Code your testbench here
// or browse Examples
module array_mult_tb();
  logic [3:0] A, B;
  logic [7:0]Z;
  
  array_mult_4_bit uut(
    .A(A),
    .B(B),
    .Z(Z)
  );
  
  initial begin
    $monitor("Time = %0t | A = %b, B = %b => Z = %b", $time, A, B, Z);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, array_mult_tb);
  end 
  
  initial begin 
      
    A = 4'd13; B = 4'd11; #10;
    $display("A = %d, B = %d, Z = %d", A, B, Z);  // Expect 143

    A = 4'd15; B = 4'd15; #10;
    $display("A = %d, B = %d, Z = %d", A, B, Z);  // Expect 225
  end
  
endmodule 
