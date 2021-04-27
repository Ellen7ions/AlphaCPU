`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/05 16:14:39
// Design Name: 
// Module Name: PC
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

`define ADDR_WIDTH 32

module PC(
        input wire clk,
        input wire rst,
        input wire[`ADDR_WIDTH-1:0] W_next_pc,
        output reg[`ADDR_WIDTH-1:0] W_pc
    );

    // DFlipFlop dff(clk, rst, W_next_pc, W_pc);

    always @(posedge clk) begin
        if (rst == 1'b1) begin
            W_pc <= 32'h0000_0000;
        end else begin
            W_pc <= W_next_pc;
        end
    end

endmodule
