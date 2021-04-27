`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/05 16:40:25
// Design Name: 
// Module Name: Top_PC_Instr_Display
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


module Top_PC_Instr_Display(
        input wire W_clk, W_rst_clk,
        output [31:0] W_instr
    );

    wire W_dived_clk;
    wire[31:0] W_pc, W_next_pc;

    // don't div clk when simulating...
    // ClkDiv clkdiv(
    //     .clk(W_clk),
    //     .rst(W_rst_clk),
    //     .R_dived_clk(W_dived_clk)
    // );

    assign W_dived_clk = W_clk;

    PCAdd4 pcadd4(
        .W_pc(W_pc), 
        .W_next_pc(W_next_pc)
    );

    PC pc(
        .clk(W_dived_clk),
        .rst(W_rst_clk),
        .W_next_pc(W_next_pc), 
        .W_pc(W_pc)
    );

    Instr_ROM instr_rom (
        .clka(W_dived_clk),    // input wire clka
        .addra(W_pc),  // input wire [9 : 0] addra
        .douta(W_instr)  // output wire [31 : 0] douta
    );

    // DisplayLED disLED(
    //     .clk(W_dived_clk),
    //     .rst(W_rst_display),
    //     .s(W_instr),
    //     .seg(W_seg),
    //     .sel(W_sel_slice)
    // );

endmodule
