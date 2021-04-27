`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 08:15:13
// Design Name: 
// Module Name: SIM_RegFile
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


module SIM_RegFile();
    reg clk, rst;
    reg [4:0] W_read_rs;
    reg [4:0] W_read_rt;
    reg [4:0] W_write_rd;
    reg [31:0] W_write_data;
    reg W_en;
    wire [31:0] R_read_rs_data;
    wire [31:0] R_read_rt_data;

    RegFile rg(
        clk, rst, W_read_rs, W_read_rt, W_write_rd, W_write_data,
        W_en, R_read_rs_data, R_read_rt_data            
    );

    initial begin
        clk = 1'b1;
        repeat (100) begin
            #10 clk = ~clk;
        end
    end

    integer i;

    initial begin
        #15 rst = 1'b1;
        #15 rst = 1'b0;

        #15 begin
            W_read_rs = 5'b000_00;
            W_read_rt = 5'b000_00;
        end

        #15 begin
            W_write_rd = 5'b000_00;
            W_en = 1'b1;
            W_write_data = 32'h1234_1234;
        end

        // #15 begin
        //     for (i = 1; i <= 32'hffff_ffff; i = i + 1) begin
        //         #15 begin
        //             W_read_rs = i;
        //         end
        //     end
        // end

    end

endmodule
