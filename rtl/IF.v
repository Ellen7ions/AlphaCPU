`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 20:15:45
// Design Name: 
// Module Name: IF
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


module IF(
        input wire clk,
        input wire [31:0] W_pc,
        output wire [31:0] IF_instr
    );

    Instr_ROM instr_rom (
        .clka(~clk),    // input wire clka
        .addra(W_pc),  // input wire [9 : 0] addra
        .douta(IF_instr)  // output wire [31 : 0] douta
    );
endmodule
