`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/05 16:28:19
// Design Name: 
// Module Name: DisplayLED
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

module DecoderLED (
        input wire[3:0] W_in,
        output reg[6:0] R_seg
    );

    always@(*) begin
        case(W_in)
            4'h0:R_seg = 7'b000_0001;
            4'h1:R_seg = 7'b100_1111;
            4'h2:R_seg = 7'b001_0010;
            4'h3:R_seg = 7'b000_0110;
            4'h4:R_seg = 7'b100_1100;
            4'h5:R_seg = 7'b010_0100;
            4'h6:R_seg = 7'b010_0000;
            4'h7:R_seg = 7'b000_1111;
            4'h8:R_seg = 7'b000_0000;
            4'h9:R_seg = 7'b000_0100;
            4'ha:R_seg = 7'b000_1000;
            4'hb:R_seg = 7'b110_0000;
            4'hc:R_seg = 7'b011_0001;
            4'hd:R_seg = 7'b100_0010;
            4'he:R_seg = 7'b011_0000;
            4'hf:R_seg = 7'b011_1000;
            default:R_seg = 7'b111_1111;        
        endcase
    end
endmodule

module DisplayLED #(parameter INPUT_WIDTH = 32)(
        input wire clk, rst,
        input wire [INPUT_WIDTH-1:0] s,
        output wire [6:0]seg,
        output reg [7:0]sel
    );
    reg [20:0] R_count;
    reg [4:0] R_digit; 
    always@(posedge clk) begin
        if(rst)  
            R_count = 21'h0;
        else 
            R_count = R_count + 21'b1;
    end
       
    always @(posedge clk)
    case(R_count[20:18])
        3'd0:begin
            sel = 8'b11111110;
            R_digit = s[3:0];
        end
        
        3'd1:begin
            sel = 8'b11111101;
            R_digit = s[7:4];
        end

        3'd2:begin
            sel = 8'b11111011;
            R_digit =s[11:8];
        end
        
        3'd3:begin
            sel = 8'b11110111;
            R_digit = s[15:12];
        end
        
        3'd4:begin
            sel = 8'b11101111;
            R_digit = s[19:16];
        end
              
        3'd5:begin
            sel = 8'b11011111;
            R_digit = s[23:20];
        end
    
        3'd6:begin
            sel = 8'b10111111;
            R_digit =s[27:24];
        end
              
        3'd7:begin
            sel = 8'b01111111;
            R_digit = s[31:28];
        end
    endcase
    
    DecoderLED U4(
        .W_in(R_digit),
        .R_seg(seg)
    );

endmodule
