// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Sat Jul  5 10:47:12 2025
// Host        : LAPTOP-EI88UINF running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file {F:/Sillycon/Code/RTL/FSM/lift controller using case
//               statement/lift controller using case statement.sim/sim_1/impl/func/xsim/lift_tb_func_impl.v}
// Design      : lift_design
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "db4acbbf" *) 
(* NotValidForBitStream *)
module lift_design
   (current_floor,
    desired_floor,
    clk_i,
    rst_i,
    out_floor,
    com);
  input [2:0]current_floor;
  input [2:0]desired_floor;
  input clk_i;
  input rst_i;
  output [2:0]out_floor;
  output com;

  wire clk_i;
  wire clk_i_IBUF;
  wire clk_i_IBUF_BUFG;
  wire com;
  wire com0;
  wire com_OBUF;
  wire com_i_1_n_0;
  wire com_i_2_n_0;
  wire [2:0]current_floor;
  wire [2:0]current_floor_IBUF;
  wire [2:0]desired_floor;
  wire [2:0]desired_floor_IBUF;
  wire [2:0]out_floor;
  wire out_floor1;
  wire \out_floor[0]_i_1_n_0 ;
  wire \out_floor[0]_i_2_n_0 ;
  wire \out_floor[0]_i_3_n_0 ;
  wire \out_floor[0]_i_4_n_0 ;
  wire \out_floor[1]_i_1_n_0 ;
  wire \out_floor[1]_i_3_n_0 ;
  wire \out_floor[1]_i_4_n_0 ;
  wire \out_floor[2]_i_1_n_0 ;
  wire \out_floor[2]_i_2_n_0 ;
  wire \out_floor[2]_i_3_n_0 ;
  wire \out_floor[2]_i_4_n_0 ;
  wire \out_floor[2]_i_5_n_0 ;
  wire [2:0]out_floor_OBUF;
  wire [1:1]p_1_in;
  wire rst_i;
  wire rst_i_IBUF;

  BUFG clk_i_IBUF_BUFG_inst
       (.I(clk_i_IBUF),
        .O(clk_i_IBUF_BUFG));
  IBUF clk_i_IBUF_inst
       (.I(clk_i),
        .O(clk_i_IBUF));
  OBUF com_OBUF_inst
       (.I(com_OBUF),
        .O(com));
  LUT2 #(
    .INIT(4'h2)) 
    com_i_1
       (.I0(out_floor1),
        .I1(rst_i_IBUF),
        .O(com_i_1_n_0));
  LUT4 #(
    .INIT(16'h0016)) 
    com_i_2
       (.I0(desired_floor_IBUF[2]),
        .I1(desired_floor_IBUF[1]),
        .I2(desired_floor_IBUF[0]),
        .I3(rst_i_IBUF),
        .O(com_i_2_n_0));
  LUT5 #(
    .INIT(32'h00221004)) 
    com_i_3
       (.I0(out_floor_OBUF[1]),
        .I1(out_floor_OBUF[2]),
        .I2(desired_floor_IBUF[0]),
        .I3(out_floor_OBUF[0]),
        .I4(desired_floor_IBUF[1]),
        .O(com0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    com_i_4
       (.I0(desired_floor_IBUF[0]),
        .I1(out_floor_OBUF[0]),
        .I2(out_floor_OBUF[2]),
        .I3(desired_floor_IBUF[2]),
        .I4(out_floor_OBUF[1]),
        .I5(desired_floor_IBUF[1]),
        .O(out_floor1));
  FDSE #(
    .INIT(1'b1)) 
    com_reg
       (.C(clk_i_IBUF_BUFG),
        .CE(com_i_2_n_0),
        .D(com0),
        .Q(com_OBUF),
        .S(com_i_1_n_0));
  IBUF \current_floor_IBUF[0]_inst 
       (.I(current_floor[0]),
        .O(current_floor_IBUF[0]));
  IBUF \current_floor_IBUF[1]_inst 
       (.I(current_floor[1]),
        .O(current_floor_IBUF[1]));
  IBUF \current_floor_IBUF[2]_inst 
       (.I(current_floor[2]),
        .O(current_floor_IBUF[2]));
  IBUF \desired_floor_IBUF[0]_inst 
       (.I(desired_floor[0]),
        .O(desired_floor_IBUF[0]));
  IBUF \desired_floor_IBUF[1]_inst 
       (.I(desired_floor[1]),
        .O(desired_floor_IBUF[1]));
  IBUF \desired_floor_IBUF[2]_inst 
       (.I(desired_floor[2]),
        .O(desired_floor_IBUF[2]));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \out_floor[0]_i_1 
       (.I0(current_floor_IBUF[0]),
        .I1(rst_i_IBUF),
        .I2(\out_floor[0]_i_2_n_0 ),
        .I3(\out_floor[2]_i_3_n_0 ),
        .I4(out_floor_OBUF[0]),
        .O(\out_floor[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBBBBB888)) 
    \out_floor[0]_i_2 
       (.I0(desired_floor_IBUF[0]),
        .I1(out_floor1),
        .I2(\out_floor[0]_i_3_n_0 ),
        .I3(desired_floor_IBUF[1]),
        .I4(\out_floor[0]_i_4_n_0 ),
        .O(\out_floor[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hA882)) 
    \out_floor[0]_i_3 
       (.I0(current_floor_IBUF[0]),
        .I1(out_floor_OBUF[2]),
        .I2(out_floor_OBUF[1]),
        .I3(out_floor_OBUF[0]),
        .O(\out_floor[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFF30330A8820000)) 
    \out_floor[0]_i_4 
       (.I0(desired_floor_IBUF[2]),
        .I1(out_floor_OBUF[2]),
        .I2(out_floor_OBUF[0]),
        .I3(out_floor_OBUF[1]),
        .I4(current_floor_IBUF[0]),
        .I5(desired_floor_IBUF[0]),
        .O(\out_floor[0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \out_floor[1]_i_1 
       (.I0(p_1_in),
        .I1(\out_floor[2]_i_3_n_0 ),
        .I2(out_floor_OBUF[1]),
        .O(\out_floor[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB8BBB8BBB8BBB888)) 
    \out_floor[1]_i_2 
       (.I0(current_floor_IBUF[1]),
        .I1(rst_i_IBUF),
        .I2(desired_floor_IBUF[1]),
        .I3(out_floor1),
        .I4(\out_floor[1]_i_3_n_0 ),
        .I5(\out_floor[1]_i_4_n_0 ),
        .O(p_1_in));
  LUT5 #(
    .INIT(32'hAAAA0228)) 
    \out_floor[1]_i_3 
       (.I0(desired_floor_IBUF[1]),
        .I1(out_floor_OBUF[0]),
        .I2(out_floor_OBUF[2]),
        .I3(out_floor_OBUF[1]),
        .I4(current_floor_IBUF[1]),
        .O(\out_floor[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFCB0308A88A0008)) 
    \out_floor[1]_i_4 
       (.I0(desired_floor_IBUF[2]),
        .I1(out_floor_OBUF[0]),
        .I2(out_floor_OBUF[1]),
        .I3(out_floor_OBUF[2]),
        .I4(current_floor_IBUF[1]),
        .I5(desired_floor_IBUF[0]),
        .O(\out_floor[1]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \out_floor[2]_i_1 
       (.I0(current_floor_IBUF[2]),
        .I1(rst_i_IBUF),
        .I2(\out_floor[2]_i_2_n_0 ),
        .I3(\out_floor[2]_i_3_n_0 ),
        .I4(out_floor_OBUF[2]),
        .O(\out_floor[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBBBBB888)) 
    \out_floor[2]_i_2 
       (.I0(desired_floor_IBUF[2]),
        .I1(out_floor1),
        .I2(\out_floor[2]_i_4_n_0 ),
        .I3(desired_floor_IBUF[1]),
        .I4(\out_floor[2]_i_5_n_0 ),
        .O(\out_floor[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFABBE)) 
    \out_floor[2]_i_3 
       (.I0(rst_i_IBUF),
        .I1(desired_floor_IBUF[0]),
        .I2(desired_floor_IBUF[1]),
        .I3(desired_floor_IBUF[2]),
        .I4(out_floor1),
        .O(\out_floor[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hA882)) 
    \out_floor[2]_i_4 
       (.I0(current_floor_IBUF[2]),
        .I1(out_floor_OBUF[2]),
        .I2(out_floor_OBUF[1]),
        .I3(out_floor_OBUF[0]),
        .O(\out_floor[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hCCC0CAAC88808AA8)) 
    \out_floor[2]_i_5 
       (.I0(desired_floor_IBUF[2]),
        .I1(current_floor_IBUF[2]),
        .I2(out_floor_OBUF[2]),
        .I3(out_floor_OBUF[1]),
        .I4(out_floor_OBUF[0]),
        .I5(desired_floor_IBUF[0]),
        .O(\out_floor[2]_i_5_n_0 ));
  OBUF \out_floor_OBUF[0]_inst 
       (.I(out_floor_OBUF[0]),
        .O(out_floor[0]));
  OBUF \out_floor_OBUF[1]_inst 
       (.I(out_floor_OBUF[1]),
        .O(out_floor[1]));
  OBUF \out_floor_OBUF[2]_inst 
       (.I(out_floor_OBUF[2]),
        .O(out_floor[2]));
  FDRE #(
    .INIT(1'b0)) 
    \out_floor_reg[0] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\out_floor[0]_i_1_n_0 ),
        .Q(out_floor_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_floor_reg[1] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\out_floor[1]_i_1_n_0 ),
        .Q(out_floor_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_floor_reg[2] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\out_floor[2]_i_1_n_0 ),
        .Q(out_floor_OBUF[2]),
        .R(1'b0));
  IBUF rst_i_IBUF_inst
       (.I(rst_i),
        .O(rst_i_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
