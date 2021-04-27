`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 20:51:14
// Design Name: 
// Module Name: AlphaCPU
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


module AlphaCPU(
        input wire clk, rst
    );

    wire W_regfile_wea;
    wire [2:0] W_alu_sel;
    wire [3:0] W_mem_wea;
    wire W_wb_regsrc_sel;
    wire W_ex_rt_sel;
    wire W_write_src_sel;
    wire [1:0] W_branch;
    wire [1:0] W_j_branch;
    wire W_imme_sign_extend;
    wire W_jal_en;

    wire [5:0] W_instr_op;
    wire [5:0] W_instr_funct;
    wire [1:0] W_shift;

    DataPath datapath(
        clk, rst,
        W_regfile_wea,
        W_alu_sel,
        W_mem_wea,
        W_wb_regsrc_sel,
        W_ex_rt_sel,
        W_write_src_sel,
        W_branch,
        W_j_branch,
        W_imme_sign_extend,
        W_shift,
        W_jal_en,
        W_instr_op,
        W_instr_funct
    );

    Controller controller(
        W_instr_op,
        W_instr_funct,
        W_regfile_wea,
        W_alu_sel,
        W_mem_wea,
        W_wb_regsrc_sel,
        W_ex_rt_sel,
        W_write_src_sel,
        W_branch,
        W_j_branch,
        W_imme_sign_extend,
        W_shift,
        W_jal_en
    );

endmodule
