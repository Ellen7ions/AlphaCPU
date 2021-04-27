`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/05 16:22:11
// Design Name: 
// Module Name: ClkDiv
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


module ClkDiv(
        input wire clk,
        input wire rst,
        output reg R_dived_clk
    );

    reg[20:0] R_count;

    always @(posedge clk) begin
        if (rst == 1'b1) begin
            R_count = 21'b0;
            R_dived_clk = 1'b0;
        end else begin
            if (R_count == 21'd100_0000) begin
                R_count = 21'b0;
                R_dived_clk = ~R_dived_clk;
            end else begin
                R_count = R_count + 21'd1;
            end
        end
    end

endmodule
