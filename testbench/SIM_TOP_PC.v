`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/05 16:54:15
// Design Name: 
// Module Name: SIM_TOP_PC
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


module SIM_TOP_PC();
    reg R_clk, R_rst_clk;
    wire[31:0] W_instr;

    Top_PC_Instr_Display tpc(
        R_clk, 
        R_rst_clk, 
        W_instr
    );

    initial begin
        R_clk = 1'b1;
        repeat(200) begin
            #10 R_clk = ~R_clk;
        end
    end

    initial begin

        #17 begin
            R_rst_clk = 1'b0;
        end

        #17 R_rst_clk = 1'b1;

        #17 begin
            R_rst_clk = 1'b0;
        end

    end

endmodule
