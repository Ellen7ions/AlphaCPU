`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 19:56:53
// Design Name: 
// Module Name: SIM_ALU
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


module SIM_ALU();

    reg [31:0] a;
    reg [31:0] b;
    reg [2:0] alu_sel;
    wire [31:0] res;
    wire ZERO;
    integer i;

    ALU alu(a, b, alu_sel, res, ZERO);

    initial begin
        a = 32'h0000_0030;
        b = 32'h0000_003e;
        #10 begin
            for (i = 0; i <= 3'b111; i = i + 1'b1) begin
                #10 alu_sel = i;
            end
        end
    end

endmodule
