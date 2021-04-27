`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 20:18:05
// Design Name: 
// Module Name: ID
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


module ID(
        input wire clk, rst,
        input wire [31:0] W_instr,
        input wire [31:0] W_write_data,
        input wire W_write_ena,
        input wire W_write_src_sel,
        input wire W_jal_en,
        output wire [5:0] ID_instr_op,
        output wire [5:0] ID_instr_funct,
        output wire [31:0] ID_read_rs_data,
        output wire [31:0] ID_read_rt_data,
        output wire [15:0] ID_imme,
        output wire [25:0] ID_j_imme
        // output wire [4:0] ID_shamt
    );

    wire [4:0] W_instr_read_rs;
    wire [4:0] W_instr_read_rt;
    wire [4:0] W_instr_write_rd;
    wire [4:0] W_instr_shamt;
    wire [4:0] W_reg_write_addr;
    
    assign ID_instr_op = W_instr[31:26];
    assign W_instr_read_rs = W_instr[25:21];
    assign W_instr_read_rt = W_instr[20:16];
    assign W_instr_write_rd = W_instr[15:11];
    assign ID_shamt = W_instr[10:6];        // not used
    assign ID_instr_funct = W_instr[5:0];

    assign ID_imme = W_instr[15:0];
    assign ID_j_imme = W_instr[25:0];

    assign W_reg_write_addr = (W_jal_en == 1'b1) ? 5'b111_11 : (W_write_src_sel == 1'b0) ? W_instr_write_rd : W_instr_read_rt;

    RegFile regfile(
        .clk(clk),
        .rst(rst),
        .W_read_rs(W_instr_read_rs),
        .W_read_rt(W_instr_read_rt),
        .W_write_rd(W_reg_write_addr),
        .W_write_data(W_write_data),
        .W_en(W_write_ena),
        .R_read_rs_data(ID_read_rs_data),
        .R_read_rt_data(ID_read_rt_data)
    );

endmodule
