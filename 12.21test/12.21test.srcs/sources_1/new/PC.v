`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/21 22:30:03
// Design Name: 
// Module Name: PC
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

module PC(
    input clk,
    input rstn,
    input [15:0]sw_i,
    input [31:0]PC,
    input [31:0]NPC,
    output reg [31:0]PCout
);
always@(posedge clk or negedge rstn)
begin
    if (!rstn) 
    begin
        case (sw_i[5:2])
            4'b0000: PCout <= 32'h0000_0000; // beq
            4'b0001: PCout <= 32'h0000_0080; // bne
            4'b0010: PCout <= 32'h0000_0100; // blt
            4'b0011: PCout <= 32'h0000_0180; // bge
            4'b0100: PCout <= 32'h0000_0200; // bltu
            4'b0101: PCout <= 32'h0000_0280; // bgeu
            4'b0110: PCout <= 32'h0000_0300; // jal
            4'b0111: PCout <= 32'h0000_037c; // jalr
            4'b1000: PCout <= 32'h0000_03f0; // sll
            4'b1001: PCout <= 32'h0000_0410; // srl
            4'b1010: PCout <= 32'h0000_0430; // sra
            default: PCout <= 32'h0000_0000; // Ĭ�ϵ�ַ
        endcase
    end
    
    else
    begin
        if(sw_i[1]==1'b0)
            PCout<=NPC;
        else
            PCout<=PC;
    end

end
endmodule
