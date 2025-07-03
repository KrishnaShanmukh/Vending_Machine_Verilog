`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2025 15:49:40
// Design Name: 
// Module Name: Vending_machine
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


module vending_machine (
  input clk,
  input [1:0] in,
  input rst,
  output reg out,
  output reg [1:0] change
);

  parameter s0 = 2'b00;
  parameter s1 = 2'b01;
  parameter s2 = 2'b10;

  reg [1:0] c_state, n_state;

  // Sequential state update
  always @(posedge clk or posedge rst) begin
    if (rst)
      c_state <= s0;
    else
      c_state <= n_state;
  end

  // Combinational next state and outputs
  always @(*) begin
    out = 0;
    change = 2'b00;
    case (c_state)
      s0: begin
        case (in)
          2'b00: begin n_state = s0; end
          2'b01: begin n_state = s1; end
          2'b10: begin n_state = s2; end
          default: n_state = s0;
        endcase
      end

      s1: begin
        case (in)
          2'b00: begin n_state = s0; change = 2'b01; end
          2'b01: begin n_state = s2; end
          2'b10: begin n_state = s0; out = 1; end
          default: n_state = s0;
        endcase
      end

      s2: begin
        case (in)
          2'b00: begin n_state = s0; change = 2'b10; end
          2'b01: begin n_state = s0; out = 1; end
          2'b10: begin n_state = s0; out = 1; change = 2'b01; end
          default: n_state = s0;
        endcase
      end

      default: n_state = s0;
    endcase
  end

endmodule

