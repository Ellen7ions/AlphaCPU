`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/05 16:15:22
// Design Name: 
// Module Name: DFlipFlop
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


module DFlipFlop #(parameter WIDTH = 32)(
        input wire clk,
        input wire rst,
        input wire[WIDTH-1:0] W_in,
        output reg[WIDTH-1:0] R_out
    );
    always @(posedge clk or negedge rst) begin
        if (rst == 1'b1) R_out <= {WIDTH{1'b0}};
        else begin
            R_out <= W_in;
        end
    end
endmodule
