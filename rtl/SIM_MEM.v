`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/14 19:21:12
// Design Name: 
// Module Name: SIM_MEM
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


module SIM_MEM();
    reg clk;
    reg [3:0] W_wea;
    reg [31:0] W_addr;
    reg [31:0] W_write_data;
    wire [31:0] MEM_read_data;

    Dis_Memory your_instance_name (
        .a(W_addr),      // input wire [9 : 0] a
        .d(W_write_data),      // input wire [31 : 0] d
        .clk(clk),  // input wire clk
        .we(W_wea),    // input wire we
        .spo(MEM_read_data)  // output wire [31 : 0] spo
    );

    initial begin
        clk = 1'b1;
        forever begin
            #100 clk = ~clk;
        end
    end

    initial begin
        W_wea = 4'b1111;
        #150 begin
            W_addr = 32'h0000_0000;
            W_write_data = 32'b1;
        end

        #150 begin
            W_addr = 32'h0000_0001;
            W_write_data = 32'h2;
        end

        #150 begin
            W_wea = 4'b0000;
        end
        #130 begin
            W_addr = 32'h0000_0002;
        end

        #130 begin
            W_addr = 32'h0000_0001;
        end

        #130 begin
            W_addr = 32'h0000_0002;
        end

    end

endmodule
