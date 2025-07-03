`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2025 15:55:29
// Design Name: 
// Module Name: Vending_machine_tb
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

module vending_machine_tb;
  reg clk;
  reg [1:0] in;
  reg rst;

  wire out;
  wire [1:0] change;

  vending_machine uut (
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out),
    .change(change)
  );

  initial begin
    $dumpfile("vending_machine.vcd");
    $dumpvars(0, vending_machine_tb);

    clk = 0;
    rst = 1;
    in = 2'b00;

    #6 rst = 0;
    #2 in = 2'b01;  // insert 1 rupee
    #10 in = 2'b01; // insert 1 rupee
    #10 in = 2'b10; // insert 2 rupees
    #10 in = 2'b00; // no coin
    #10 $finish;
  end

  always #5 clk = ~clk; // Clock toggles every 5 time units (10 units period)

endmodule

