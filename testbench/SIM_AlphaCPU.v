`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 22:30:45
// Design Name: 
// Module Name: SIM_AlphaCPU
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


module SIM_AlphaCPU();
    reg clk, rst;

    AlphaCPU cpu(clk, rst);

    initial begin
        clk = 1'b1;
        forever begin
            #50 clk = ~clk;
        end
    end

    initial begin
        rst = 1'b0;
        #100 rst = 1'b1;
        #100 rst = 1'b0;
    end
endmodule
