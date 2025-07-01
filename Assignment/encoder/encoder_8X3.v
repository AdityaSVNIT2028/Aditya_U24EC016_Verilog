// design
// Code your design here
module encoder_8X3(input [7:0]I, output reg [2:0]Y, output reg valid);
  always @(I) begin
    case(I)
      8'b00000000: begin Y = 000; valid = 0; end
      8'b00000001: begin Y = 000; valid = 1; end 
      8'b00000010: begin Y = 001; valid = 1; end
      8'b00000100: begin Y = 010; valid = 1; end
      8'b00001000: begin Y = 011; valid = 1; end
      8'b00010000: begin Y = 100; valid = 1; end
      8'b00100000: begin Y = 101; valid = 1; end
      8'b01000000: begin Y = 110; valid = 1; end
      8'b10000000: begin Y = 111; valid = 1; end
      default: 
        begin Y = 000; valid = 1; end 
    endcase 
  end
endmodule

// for test bench
// Code your testbench here
// or browse Examples
module encoder_tb;
  reg [7:0]I;
  wire valid;
  wire [2:0]Y;
  
  encoder_8X3 uut (
    .I(I), 
    .valid(valid), 
    .Y(Y)
  );
  
  initial begin
    $monitor("Time = %0t | I = %b => valid = %b, Y = %b", $time, I, valid, Y);
  end 
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, encoder_tb);
  end 
  
  initial begin 
    I = 8'b00000000; #10;
    I = 8'b00000001; #10;
    I = 8'b00000010; #10;
    I = 8'b00000100; #10;
    I = 8'b00001000; #10;
    I = 8'b00010000; #10;
    I = 8'b00100000; #10;
    I = 8'b01000000; #10;
    I = 8'b10000000; #10;
  $finish;
  end
  endmodule 
