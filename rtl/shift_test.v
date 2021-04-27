`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/11 23:57:09
// Design Name: 
// Module Name: shift_test
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


module shift_test(
        input wire [31:0] a,
        input wire [4:0] b,
        output wire [31:0] ans
    );
    assign ans = (a << b);
endmodule
