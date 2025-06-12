// Code your design here
// making 32bit booth multiplier
// M is the multiplicant and Q is the multiplier
module booth_mult_32(input signed [31:0]M, input signed [31:0]Q, output reg [63:0]Y);
  reg [31:0]A;// this is the accumulator
  reg Q_1;
  reg signed [64:0]X;
  integer i;
       always@(*)begin
         A = 32'b0;
         Q_1 = 1'b0;
         X[64:33] = A;
         X[32:1] = Q;
         X[0] = Q_1;
         
         for( i = 0; i<32; i++) begin
           if((X[1:0]==2'b00) || (X[1:0] == 2'b11))begin
             // right shift operation
             X = X>>>1;
           end 
           else if(X[1:0] == 2'b01) begin
             // A = A+M
             X[64:33] = X[64:33] + M;
             X = X>>>1;
           end
           
           else begin
             X[64:33] = X[64:33] - M;
             X = X>>>1;
           end
         end
         
         Y = X[64:1];
       end
endmodule
       
// for testbench
// Code your testbench here
// or browse Examples
module booth_tb();
  reg signed [31:0]M, Q;
  wire [63:0]Y;
  
  booth_mult_32 uut(
    .M(M),
    .Q(Q),
    .Y(Y)
  );
  
  initial begin
    $monitor("Time = %0t | M = %b, Q = %b => Y = %b", $time, M, Q, Y);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, booth_tb);
  end 
  
  initial begin
    // Test case 1: 5 * 3 = 15
    M = 32'd5; Q = 32'd3; #10;

    // Test case 2: -4 * 6 = -24
    M = -32'd4; Q = 32'd6; #10;

    // Test case 3: -7 * -2 = 14
    M = -32'd7; Q = -32'd2; #10;

    // Test case 4: 0 * 10 = 0
    M = 32'd0; Q = 32'd10; #10;

    // Test case 5: 15 * -1 = -15
    M = 32'd15; Q = -32'd1; #10;

    // End simulation
    $finish;
  end

endmodule 
