`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 20:51:51
// Design Name: 
// Module Name: DataPath
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


module DataPath(
        input wire clk, rst,
        input wire W_regfile_wea,
        input wire[2:0] W_alu_sel,
        input wire[3:0] W_mem_wea,
        input wire W_wb_regsrc_sel,
        input wire W_ex_rt_sel,
        input wire W_write_src_sel,
        input wire [1:0] W_branch,
        input wire [1:0] W_j_branch,
        input wire W_imme_sign_extend,
        input wire [1:0] W_shift,
        input wire W_jal_en,
        output wire [5:0] W_instr_op,
        output wire [5:0] W_instr_funct
    );
    
    wire [31:0] W_next_pc, W_pc;
    wire [31:0] IF_instr;

    wire EX_ZERO;
    wire [31:0] ID_read_rs_data;
    wire [31:0] ID_read_rt_data;
    wire [4:0] ID_shamt;
    wire [15:0] ID_imme;
    wire [25:0] ID_j_imme;
    
    wire [31:0] EX_alu_res;
    wire [31:0] EX_rt_src;

    wire [4:0] W_shamt;
    // assign W_shamt = ID_j_imme[10:6];

    wire [31:0] WB_wb_res_data;
    wire [31:0] WB_wb_data;

    wire [31:0] MEM_read_data;

    PCAdd4 pcadd4(
        .W_j_branch(W_j_branch),
        .W_branch(W_branch),
        .W_EX_ZERO(EX_ZERO),
        .W_pc(W_pc),
        .ID_imme(ID_imme),
        .ID_j_imme(ID_j_imme),
        .W_rs_to_pc(ID_read_rs_data),
        .W_next_pc(W_next_pc)
    );

    PC pc(
        .clk(clk),
        .rst(rst),
        .W_next_pc(W_next_pc),
        .W_pc(W_pc)
    );

    // IF

    IF iff(
        .clk(clk),
        .W_pc(W_pc),
        .IF_instr(IF_instr)
    );

    // ID

    assign WB_wb_data = (W_jal_en == 1'b1) ? W_pc + 32'h0000_0008 : WB_wb_res_data;

    ID id(
        .clk(clk), .rst(rst),
        .W_instr(IF_instr),
        .W_write_data(WB_wb_data),
        .W_write_ena(W_regfile_wea),
        .W_write_src_sel(W_write_src_sel),
        .W_jal_en(W_jal_en),
        .ID_instr_op(W_instr_op),
        .ID_instr_funct(W_instr_funct),
        .ID_read_rs_data(ID_read_rs_data),
        .ID_read_rt_data(ID_read_rt_data),
        .ID_imme(ID_imme),
        .ID_j_imme(ID_j_imme)
        // .ID_shamt(ID_shamt)
    );

    // EX

    assign EX_rt_src = 
    (W_ex_rt_sel == 1'b0) ? 
        ID_read_rt_data :( 
            (W_imme_sign_extend == 1'b1) ? 
            {{16{ID_imme[15]}}, ID_imme} :
            {{16{1'b0}}, ID_imme}
        );

    EX ex(
        .W_alu_sel(W_alu_sel),
        .W_shift(W_shift),
        .W_shamt(W_shamt),
        .W_rs(ID_read_rs_data),
        .W_rt(EX_rt_src),
        .EX_alu_res(EX_alu_res),
        .EX_ZERO(EX_ZERO)
    );

    MEM mem(
        .clk(clk),
        .W_addr(EX_alu_res),
        .W_write_data(ID_read_rt_data),
        .W_wea(W_mem_wea),
        .MEM_read_data(MEM_read_data)
    );

    // WB

    WB wb(
        .W_alu_res(EX_alu_res),
        .W_mem_data(MEM_read_data),
        .W_regsrc_sel(W_wb_regsrc_sel),
        .WB_wb_data(WB_wb_res_data)
    );

endmodule
