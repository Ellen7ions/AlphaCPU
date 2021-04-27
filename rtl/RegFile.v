`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/07 15:07:02
// Design Name: 
// Module Name: RegFile
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


module RegFile(
        input wire clk, rst,
        input wire [4:0] W_read_rs,
        input wire [4:0] W_read_rt,
        input wire [4:0] W_write_rd,
        input wire [31:0] W_write_data,
        input wire W_en,
        output reg [31:0] R_read_rs_data,
        output reg [31:0] R_read_rt_data
    );

    reg[31:0] regfile[0:31];

    initial begin
        $readmemh("F:/University/LoogSonSrc/CPULabs/Lab2_PC/Lab2_PC.srcs/sources_1/new/regfile_ram.dat", regfile);
    end

    // write
    always @(posedge clk) begin
        if (W_en == 1'b1) begin
            regfile[W_write_rd] <= W_write_data;
        end else begin
        end
    end

    // read_1
    always @(*) begin
        if (rst) begin
            R_read_rs_data = 32'h0000_0000;
        end else begin
        // end else if ((W_en == 1'b1) && (W_write_rd == W_read_rs)) begin
        //     R_read_rs_data = W_write_data;
        // end else begin
            R_read_rs_data = regfile[W_read_rs];
        end
    end

    // read_2

    always @(*) begin
        if (rst) begin
            R_read_rt_data = 32'h0000_0000;
        end else begin
        // end else if ((W_en == 1'b1) && (W_write_rd == W_read_rt)) begin
        //     R_read_rt_data = W_write_data;
        // end else begin
            R_read_rt_data = regfile[W_read_rt];
        end
    end

endmodule
