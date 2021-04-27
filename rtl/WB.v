`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 20:46:47
// Design Name: 
// Module Name: WB
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


module WB(
        input wire [31:0] W_alu_res,
        input wire [31:0] W_mem_data,
        input wire W_regsrc_sel,
        output reg [31:0] WB_wb_data
    );

    always @(*) begin
        case(W_regsrc_sel)
        1'b0: WB_wb_data = W_alu_res;
        1'b1: WB_wb_data = W_mem_data;
        default: WB_wb_data = {32{1'b1}};
        endcase
    end

endmodule
