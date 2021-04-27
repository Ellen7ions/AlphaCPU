`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 20:36:09
// Design Name: 
// Module Name: EX
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


module EX(
        input wire [2:0] W_alu_sel,
        input wire [1:0] W_shift,
        input wire [4:0] W_shamt,
        input wire [31:0] W_rs,
        input wire [31:0] W_rt,
        output wire [31:0] EX_alu_res,
        output wire EX_ZERO
    );

    ALU alu(
        .a(W_rs),
        .b(W_rt),
        .W_alu_op(W_alu_sel),
        .W_shift(W_shift),
        .W_shamt(W_shamt),
        .alu_res(EX_alu_res),
        .ZERO(EX_ZERO)
    );

endmodule
