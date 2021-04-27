`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 19:42:39
// Design Name: 
// Module Name: ALU
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


module ALU #(parameter WIDTH = 32)(
        input wire [WIDTH-1:0] a,
        input wire [WIDTH-1:0] b,
        input wire [2:0] W_alu_op,
        input wire [1:0] W_shift,
        input wire [4:0] W_shamt,
        output reg [WIDTH-1:0] alu_res,
        output wire ZERO
    );

    always @(*) begin
        if (W_shift == 2'b00) begin
            case(W_alu_op)
            3'b000: begin
                alu_res = a + b;
            end
            3'b001: begin
                alu_res = a - b;
            end
            3'b010: begin
                alu_res = a & b;
            end
            3'b011: begin
                alu_res = a | b;
            end
            3'b100: begin
                alu_res = ~(a | b);
            end
            3'b101: begin
                alu_res = a ^ b;
            end
            3'b110: begin
                alu_res = (a < b) ? ({WIDTH{1'b0}} + 1'b1) : ({WIDTH{1'b0}});
            end
            default: begin
                alu_res = {WIDTH{1'b0}};
            end
            endcase
        end else if (W_shift == 2'b01) begin
            alu_res = b >> 5;
        end else if (W_shift == 2'b10) begin
            alu_res = b << 5;
        end
    end

    assign ZERO = (alu_res == {WIDTH{1'b0}}) ? 1 : 0;

endmodule
