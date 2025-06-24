`timescale 1ns / 1ps

module asyn_cunt( input clk, rst ,
output [2:0]Q, output [2:0]Qbar
    );
    wire T = 1'b1;
    wire rst_i, rst_c;
    wire [2:0]clk1;
    // assigning the clk value 
    // these can easilt assig usign buf which a buffer gate
    buf b1(clk1 [0], clk);
    buf b2( clk1[1], Q[0]);
    buf b3( clk1[2], Q[1]); 
    
    // now for initial reseting ther value so it does not create problem initially
    and a1(rst_i, Q[0], Q[1], Q[2]);
    or o1(rst_c, rst, rst_i);
    // now the same condition through structural modelling 
    genvar i;
    generate 
    for( i = 0; i<= 2; i = i+1) begin
T_ff_str ff1( .clk(clk1[i]), .J(T), .K(T), .rst(rst_c), .Q(Q[i]), .Qbar(Qbar[i]));
    end
    endgenerate
    /*
    by procedural block
    always @(*) beign
    if(Q == 3'b1) begin
    rst = 1'b1;
    end 
    else 
    rst = 1'b0;
    end
    */
     
    
endmodule


// making a t_ff

//module T_ff_str(
//    input J, K, clk, rst,
//    output Q, Qbar
//);
//    wire w1, w2, w3, w4, w5, w6;
//    wire Qa, Qabar;
//    wire clk_n, rst_n;
//    wire w7, w8;

//    // as direcltyn ~clk doesn't woek hence then we need to define anorher variale
//    not l1(clk_n, clk);
//    not l2(rst_n, rst);

//    // master
//    nand n1(w1, clk, J, Qabar);
//    nand n2(w2, clk, K, Qa);
//    nand n3(w3, w4, w1);
//    nand n4(w4, w2, w3);

//    // slave
//    nand n5(w5, w3, clk_n);
//    nand n6(w6, w4, clk_n);
//    // making reset as otherwise it creates problem 
//    or  (w7, w5, rst);     
//    and (w8, w6, rst_n);   

//    // using it 
//    nand n7(Qa, w7, Qabar);
//    nand n8(Qabar, w8, Qa);
//// as directly Q is not assign in place if Qa
//    assign Q = Qa;
//    assign Qbar = Qabar;
//endmodule

// now making t flip flop 
module t_ff(input T, clk,
output Q);
wire w1, w2;
wire Qbar;
nand n1(w1, clk, T, Qbar);
nand n2(w2, clk, T, Q);
nand n3(Q, w1, Qbar);
nand n4(Qbar, w2, Q);
endmodule 