`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2025 07:27:37
// Design Name: 
// Module Name: master_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module master_tb #(parameter n = 3)();  // n = bytes = 3 => 24-bit TDATA

// DUT Inputs
reg clk_i, rst_i, TVALID;
reg [(8*n)-1:0] TDATA;

// DUT Outputs
wire TREADY;

// Instantiate DUT
AXI_simple uut (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .TVALID(TVALID),
    .TDATA(TDATA),
    .TREADY(TREADY)
);

// Clock generation
always #5 clk_i = ~clk_i;  // 10ns period

// Stimulus
initial begin
    $display("Starting AXI testbench...");
    clk_i = 0;
    rst_i = 1;
    TVALID = 0;
    TDATA = 0;

    // Hold reset for some time
    #10;
    rst_i = 0;

    // Wait for 2 clocks
    #20;

    // Start data transmission
    repeat (8) begin
        @(posedge clk_i);
        if (TREADY) begin
            TVALID <= 1;
            TDATA <= $random % (1 << (8*n));  // Random 24-bit value
        end else begin
            TVALID <= 0;
            TDATA <= 0;
        end
    end

    // Deassert valid
    @(posedge clk_i);
    TVALID <= 0;
    TDATA <= 0;

    // Let system run for a few more cycles
    #50;

    $display("Testbench complete.");
    $finish;
end

endmodule

