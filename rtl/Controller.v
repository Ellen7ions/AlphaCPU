`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 20:52:06
// Design Name: 
// Module Name: Controller
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


module Controller(
        input wire [5:0] ID_instr_op,
        input wire [5:0] ID_instr_funct,
        output reg R_regfile_wea,
        output reg[2:0] R_alu_sel,
        output reg[3:0] R_mem_wea,
        output reg R_wb_regsrc_sel,
        output reg W_ex_rt_sel,
        output reg W_write_src_sel,
        output reg[1:0] R_branch,                // [1:0] 00 not beq/bne; 01 beq; 10 bne
        output reg[1:0] R_j_branch,              // [1:0] 00 not j / j 01 / jr 10 / jal 11
        output reg R_imme_sign_extend,
        output reg [1:0] R_shift,
        output reg R_jal_en
    );

    always @(*) begin
        case(ID_instr_op)
        6'b000_000: begin
            case(ID_instr_funct)
            
            // sll
            6'b000_000: begin
                R_regfile_wea = 1'b1;
                R_alu_sel = 3'b000;
                R_mem_wea = 4'b0000;
                R_wb_regsrc_sel = 1'b0;
                W_ex_rt_sel = 1'b0;
                W_write_src_sel = 1'b0;
                R_branch = 2'b0;
                R_j_branch = 2'b00;
                R_imme_sign_extend = 1'b0;
                R_shift = 2'b10;
                R_jal_en = 1'b0;
            end

            // srl
            6'b000_010: begin
                R_regfile_wea = 1'b1;
                R_alu_sel = 3'b000;
                R_mem_wea = 4'b0000;
                R_wb_regsrc_sel = 1'b0;
                W_ex_rt_sel = 1'b0;
                W_write_src_sel = 1'b0;
                R_branch = 2'b0;
                R_j_branch = 2'b00;
                R_imme_sign_extend = 1'b0;
                R_shift = 2'b01;
                R_jal_en = 1'b0;
            end



            // add
            6'b100_000: begin
                R_regfile_wea = 1'b1;
                R_alu_sel = 3'b000;
                R_mem_wea = 4'b0000;
                R_wb_regsrc_sel = 1'b0;
                W_ex_rt_sel = 1'b0;
                W_write_src_sel = 1'b0;
                R_branch = 2'b0;
                R_j_branch = 2'b00;
                R_imme_sign_extend = 1'b0;
                R_shift = 2'b00;
                R_jal_en = 1'b0;
            end

            // addu
            6'b100_001: begin
                R_regfile_wea = 1'b1;
                R_alu_sel = 3'b000;
                R_mem_wea = 4'b0000;
                R_wb_regsrc_sel = 1'b0;
                W_ex_rt_sel = 1'b0;
                W_write_src_sel = 1'b0;
                R_branch = 2'b0;
                R_j_branch = 2'b00;
                R_imme_sign_extend = 1'b0;
                R_shift = 2'b00;
                R_jal_en = 1'b0;
            end

            // sub
            6'b100_010: begin
                R_regfile_wea = 1'b1;
                R_alu_sel = 3'b001;
                R_mem_wea = 4'b0000;
                R_wb_regsrc_sel = 1'b0;
                W_ex_rt_sel = 1'b0;
                W_write_src_sel = 1'b0;
                R_branch = 2'b0;
                R_j_branch = 2'b00;
                R_imme_sign_extend = 1'b0;
                R_shift = 2'b00;
                R_jal_en = 1'b0;
            end
            
            // and
            6'b100_100: begin
                R_regfile_wea = 1'b1;
                R_alu_sel = 3'b010;
                R_mem_wea = 4'b0000;
                R_wb_regsrc_sel = 1'b0;
                W_ex_rt_sel = 1'b0;
                W_write_src_sel = 1'b0;
                R_branch = 2'b0;
                R_j_branch = 2'b00;
                R_imme_sign_extend = 1'b0;
                R_shift = 2'b00;
                R_jal_en = 1'b0;
            end

            // or
            6'b100_101: begin
                R_regfile_wea = 1'b1;
                R_alu_sel = 3'b011;
                R_mem_wea = 4'b0000;
                R_wb_regsrc_sel = 1'b0;
                W_ex_rt_sel = 1'b0;
                W_write_src_sel = 1'b0;
                R_branch = 2'b0;
                R_j_branch = 2'b00;
                R_imme_sign_extend = 1'b0;
                R_shift = 2'b00;
                R_jal_en = 1'b0;
            end

            // nor
            6'b100_111: begin
                R_regfile_wea = 1'b1;
                R_alu_sel = 3'b100;
                R_mem_wea = 4'b0000;
                R_wb_regsrc_sel = 1'b0;
                W_ex_rt_sel = 1'b0;
                W_write_src_sel = 1'b0;
                R_branch = 2'b0;
                R_j_branch = 2'b00;
                R_imme_sign_extend = 1'b0;
                R_shift = 2'b00;
                R_jal_en = 1'b0;
            end

            // xor
            6'b100_110: begin
                R_regfile_wea = 1'b1;
                R_alu_sel = 3'b101;
                R_mem_wea = 4'b0000;
                R_wb_regsrc_sel = 1'b0;
                W_ex_rt_sel = 1'b0;
                W_write_src_sel = 1'b0;
                R_branch = 2'b0;
                R_j_branch = 2'b00;
                R_imme_sign_extend = 1'b0;
                R_shift = 2'b00;
                R_jal_en = 1'b0;
            end

            // slt
            6'b101_010: begin
                R_regfile_wea = 1'b1;
                R_alu_sel = 3'b110;
                R_mem_wea = 4'b0000;
                R_wb_regsrc_sel = 1'b0;
                W_ex_rt_sel = 1'b0;
                W_write_src_sel = 1'b0;
                R_branch = 2'b0;
                R_j_branch = 2'b00;
                R_imme_sign_extend = 1'b0;
                R_shift = 2'b00;
                R_jal_en = 1'b0;
            end

            // jr
            6'b001_000: begin
                R_regfile_wea = 1'b0;
                R_alu_sel = 3'b000;
                R_mem_wea = 4'b0000;
                R_wb_regsrc_sel = 1'b0;
                W_ex_rt_sel = 1'b0;
                W_write_src_sel = 1'b0;         // write dst is rt
                R_branch = 2'b0;
                R_j_branch = 2'b10;
                R_imme_sign_extend = 1'b0;
                R_shift = 2'b00;
                R_jal_en = 1'b0;
            end

            default: begin
                R_regfile_wea = 1'b0;
                R_alu_sel = 3'b111;
                R_mem_wea = 4'b0000;
                R_wb_regsrc_sel = 1'b0;
                W_ex_rt_sel = 1'b0;
                W_write_src_sel = 1'b0;
                R_branch = 2'b0;
                R_j_branch = 2'b00;
                R_imme_sign_extend = 1'b0;
                R_shift = 2'b00;
                R_jal_en = 1'b0;
            end

            endcase
        end
        
        // lw
        6'b100_011: begin
            R_regfile_wea = 1'b1;
            R_alu_sel = 3'b000;
            R_mem_wea = 4'b0000;
            R_wb_regsrc_sel = 1'b1;
            W_ex_rt_sel = 1'b1;
            W_write_src_sel = 1'b1;
            R_branch = 2'b0;
            R_j_branch = 2'b00;
            R_imme_sign_extend = 1'b1;
            R_shift = 2'b00;
            R_jal_en = 1'b0;
        end

        // sw
        6'b101_011: begin
            R_regfile_wea = 1'b0;
            R_alu_sel = 3'b000;
            R_mem_wea = 4'b1111;
            R_wb_regsrc_sel = 1'b0;
            W_ex_rt_sel = 1'b1;
            W_write_src_sel = 1'b0;
            R_branch = 2'b0;
            R_j_branch = 2'b00;
            R_imme_sign_extend = 1'b1;
            R_shift = 2'b00;
            R_jal_en = 1'b0;
        end

        // addi
        6'b001_000: begin
            R_regfile_wea = 1'b1;
            R_alu_sel = 3'b000;
            R_mem_wea = 4'b0000;
            R_wb_regsrc_sel = 1'b0;
            W_ex_rt_sel = 1'b1;
            W_write_src_sel = 1'b1;         // write dst is rt
            R_branch = 2'b0;
            R_j_branch = 2'b00;
            R_imme_sign_extend = 1'b1;
            R_shift = 2'b00;
            R_jal_en = 1'b0;
        end

        // addiu
        6'b001_001: begin
            R_regfile_wea = 1'b1;
            R_alu_sel = 3'b000;
            R_mem_wea = 4'b0000;
            R_wb_regsrc_sel = 1'b0;
            W_ex_rt_sel = 1'b1;             // imme is rt
            W_write_src_sel = 1'b1;         // write dst is rt
            R_branch = 2'b0;
            R_j_branch = 2'b00;
            R_imme_sign_extend = 1'b1;
            R_shift = 2'b00;
            R_jal_en = 1'b0;
        end

        // slti
        6'b001_010: begin
            R_regfile_wea = 1'b1;
            R_alu_sel = 3'b110;
            R_mem_wea = 4'b0000;
            R_wb_regsrc_sel = 1'b0;
            W_ex_rt_sel = 1'b1;
            W_write_src_sel = 1'b1;         // write dst is rt
            R_branch = 2'b0;
            R_j_branch = 2'b00;
            R_imme_sign_extend = 1'b1;
            R_shift = 2'b00;
            R_jal_en = 1'b0;
        end

        // ori
        6'b001_101: begin
            R_regfile_wea = 1'b1;
            R_alu_sel = 3'b011;
            R_mem_wea = 4'b0000;
            R_wb_regsrc_sel = 1'b0;
            W_ex_rt_sel = 1'b1;
            W_write_src_sel = 1'b1;         // write dst is rt
            R_branch = 2'b0;
            R_j_branch = 2'b00;
            R_imme_sign_extend = 1'b0;
            R_shift = 2'b00;
            R_jal_en = 1'b0;
        end

        // andi
        6'b001_100: begin
            R_regfile_wea = 1'b1;
            R_alu_sel = 3'b010;
            R_mem_wea = 4'b0000;
            R_wb_regsrc_sel = 1'b0;
            W_ex_rt_sel = 1'b1;
            W_write_src_sel = 1'b1;         // write dst is rt
            R_branch = 2'b0;
            R_j_branch = 2'b00;
            R_imme_sign_extend = 1'b0;
            R_shift = 2'b00;
            R_jal_en = 1'b0;
        end

        // j
        6'b000_010: begin
            R_regfile_wea = 1'b0;
            R_alu_sel = 3'b000;
            R_mem_wea = 4'b0000;
            R_wb_regsrc_sel = 1'b0;
            W_ex_rt_sel = 1'b0;
            W_write_src_sel = 1'b0;         // write dst is rt
            R_branch = 2'b0;
            R_j_branch = 2'b01;
            R_imme_sign_extend = 1'b0;
            R_shift = 2'b00;
            R_jal_en = 1'b0;
        end

        // jal
        6'b000_011: begin
            R_regfile_wea = 1'b1;
            R_alu_sel = 3'b000;
            R_mem_wea = 4'b0000;
            R_wb_regsrc_sel = 1'b0;
            W_ex_rt_sel = 1'b0;
            W_write_src_sel = 1'b0;         // write dst is rt
            R_branch = 2'b0;
            R_j_branch = 2'b11;
            R_imme_sign_extend = 1'b0;
            R_shift = 2'b00;
            R_jal_en = 1'b1;
        end

        // beq
        6'b000_100: begin
            R_regfile_wea = 1'b0;
            R_alu_sel = 3'b001;
            R_mem_wea = 4'b0000;
            R_wb_regsrc_sel = 1'b0;
            W_ex_rt_sel = 1'b0;
            W_write_src_sel = 1'b0;
            R_branch = 2'b01;
            R_j_branch = 2'b00;
            R_imme_sign_extend = 1'b1;
            R_shift = 2'b00;
            R_jal_en = 1'b0;
        end

        // bne
        6'b000_101: begin
            R_regfile_wea = 1'b0;
            R_alu_sel = 3'b001;
            R_mem_wea = 4'b0000;
            R_wb_regsrc_sel = 1'b0;
            W_ex_rt_sel = 1'b0;
            W_write_src_sel = 1'b0;
            R_branch = 2'b10;
            R_j_branch = 2'b00;
            R_imme_sign_extend = 1'b1;
            R_shift = 2'b00;
            R_jal_en = 1'b0;
        end

        default: begin
            R_regfile_wea = 1'b0;
            R_alu_sel = 3'b111;
            R_mem_wea = 4'b0000;
            R_wb_regsrc_sel = 1'b0;
            W_ex_rt_sel = 1'b0;
            W_write_src_sel = 1'b0;
            R_branch = 1'b0;
            R_j_branch = 2'b00;
            R_imme_sign_extend = 1'b0;
            R_shift = 2'b00;
            R_jal_en = 1'b0;
        end
        endcase
    end

endmodule
