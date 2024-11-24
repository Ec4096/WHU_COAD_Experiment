`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/10 17:08:47
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rstn,
    output [7:0] disp_seg_o,
    output [7:0] disp_an_o
    );
    reg [31:0] i_data;
    initial begin
        i_data = 32'b0000_0110_0101_0100_0011_0010_0001_0000;
    end
    seg7to16 x1(clk,rstn,i_data,disp_seg_o,disp_an_o);
    
endmodule
