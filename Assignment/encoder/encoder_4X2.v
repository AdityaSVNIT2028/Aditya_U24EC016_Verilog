// for design
// Code your design here
module encoder_4X2(input [3:0]I, output reg valid, output reg [1:0]Y);
  always @(I)
    begin
      case(I)
        4'b0000 :begin Y = 2'b00; valid = 0;end 
        4'b0001 :begin Y = 2'b00; valid = 1;end
        4'b0010 :begin Y = 2'b01; valid = 1;end
        4'b0100 :begin Y = 2'b10; valid = 1;end
        4'b1000 :begin Y = 2'b11; valid = 1;end
        default: begin 
          Y = 2'b00; valid = 0; 
        end
        endcase  
    end 
endmodule

// for test bench
// Code your testbench here
// or browse Examples
module encoder_tb;
  reg [3:0]I;
  wire valid;
  wire [1:0]Y;
  
  encoder_4X2 uut (
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
    I = 4'b0000; #10;
    I = 4'b0001; #10;
    I = 4'b0010; #10;
    I = 4'b0100; #10;
    I = 4'b1000; #10;
  $finish;
  end
  endmodule 
