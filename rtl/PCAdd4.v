`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/05 16:42:48
// Design Name: 
// Module Name: PCAdd4
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


module PCAdd4(
        input wire [1:0] W_j_branch,
        input wire[1:0] W_branch,
        input wire W_EX_ZERO,
        input wire [31:0] W_pc,
        input wire [15:0] ID_imme,
        input wire [25:0] ID_j_imme,
        input wire [31:0] W_rs_to_pc,
        output reg [31:0] W_next_pc
    );

    wire [31:0] W_add4_pc;
    assign W_add4_pc = W_pc + 32'd4;

    always @(*) begin
        case ({W_j_branch, W_branch})
            4'b00_00: begin 
                // add4
                W_next_pc <= W_add4_pc;
            end

            4'b00_01: begin
                // beq
                W_next_pc <= (W_EX_ZERO == 1'b1) ? W_add4_pc + {{14{ID_imme[15]}}, (ID_imme << 2)} : W_add4_pc;
            end

            4'b00_10: begin
               // bne
                W_next_pc <= (W_EX_ZERO != 1'b1) ?  W_add4_pc + {{14{ID_imme[15]}}, (ID_imme << 2)} : W_add4_pc;
            end

            4'b01_00: begin
                // j
                W_next_pc <= {W_add4_pc[31:28], (ID_j_imme << 2)};
            end

            4'b10_00: begin
                // jr
                W_next_pc <= W_rs_to_pc;
            end

            4'b11_00: begin
                // jal
                W_next_pc <= {W_add4_pc[31:28], (ID_j_imme << 2)};
            end

            default: begin
                W_next_pc <= W_pc;
            end
        endcase
    end

endmodule
