`timescale 1ns / 1ps

module tb_D_latch();
reg D, en;
wire Q;

d_latch dut(
.D(D),
.en(en),
.Q(Q)
);

//initial begin
//$monitor("Time = %0t | D = %b, en = %b => Q = %b", $time , D, en, Q);
//end

initial begin
en = 0; D = 1; #10
en = 1; D = 0; #5
D = 1; #3
en = 0; D = 0;#5
$finish;
end

endmodule
