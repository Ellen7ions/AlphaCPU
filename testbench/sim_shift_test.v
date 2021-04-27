`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/11 23:58:12
// Design Name: 
// Module Name: sim_shift_test
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


module sim_shift_test();
    reg [31:0] a;
    reg [4:0] b;
    wire [4:0] ans;
    shift_test st(a, b, ans);
    initial begin
        #10 begin
            a = 32'h0000_0001;
            b = 4'd2;
        end 
    end
endmodule
