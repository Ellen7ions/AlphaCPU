`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 20:39:13
// Design Name: 
// Module Name: MEM
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


module MEM(
        input wire clk,
        input wire [31:0] W_addr,
        input wire [31:0] W_write_data,
        input wire [3:0] W_wea,
        output wire [31:0] MEM_read_data
    );

    Dis_Memory your_instance_name (
        .a(W_addr),      // input wire [9 : 0] a
        .d(W_write_data),      // input wire [31 : 0] d
        .clk(clk),  // input wire clk
        .we(W_wea),    // input wire we
        .spo(MEM_read_data)  // output wire [31 : 0] spo
    );

    // Memory mem (
    //     .clka(clk),             // input wire clka
    //     .wea(W_wea),            // input wire [3 : 0] wea
    //     .addra(W_addr),         // input wire [31 : 0] addra
    //     .dina(W_write_data),    // input wire [31 : 0] dina
    //     .douta(MEM_read_data)     // output wire [31 : 0] douta
    // );

endmodule
