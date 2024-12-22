`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/21 22:30:32
// Design Name: 
// Module Name: RF
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

module RF(
    input clk,
    input rstn,
    input RFWr,
    input [4:0]A1,
    input [4:0]A2,
    input [4:0]A3,
    input [31:0]WD,
    output [31:0]RD1,RD2
);
reg [31:0]rf[31:0];
integer i;
always@(posedge clk or negedge rstn)
begin
    if(!rstn)
    begin
        for(i=0;i<32;i=i+1)
        begin
            rf[i]=0;
        end
    end
    else
    begin
        if(RFWr&&A3)
        begin
            rf[A3]<=WD;
        end
    end
end
assign RD1=(A1!=0)?rf[A1]:0;
assign RD2=(A2!=0)?rf[A2]:0;
endmodule

