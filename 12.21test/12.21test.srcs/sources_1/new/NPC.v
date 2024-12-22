`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/21 22:29:24
// Design Name: 
// Module Name: NPC
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

`timescale 1ns / 1ps

// `define NPC_PLUS4 3'b000
// `define NPC_BRANCH 3'b001
// `define NPC_JAL 3'b010
// `define NPC_JALR 3'b100
`define NPC_PLUS4 8'b00000000
`define NPC_JALR 8'b10000000
`define NPC_JAL 8'b01000000
`define NPC_BLTU 8'b00100000
`define NPC_BGEU 8'b00010000
`define NPC_BLT 8'b00001000
`define NPC_BGE 8'b00000100
`define NPC_BNE 8'b00000010
`define NPC_BEQ 8'b00000001

module NPC(
    input [31:0]PC,
    input [7:0]NPCOp,
    input [31:0]immout,
    input [31:0]aluout,
    output reg [31:0]NPC
);
always@(*)
begin
    case(NPCOp)
    `NPC_PLUS4:NPC<=PC+4;
    `NPC_JALR:NPC<=PC+immout;
    `NPC_JAL:NPC<=aluout;
    `NPC_BLTU:NPC<=PC+immout;
    `NPC_BGEU:NPC<=PC+immout;
    `NPC_BLT:NPC<=PC+immout;
    `NPC_BGE:NPC<=PC+immout;
    `NPC_BNE:NPC<=PC+immout;
    `NPC_BEQ:NPC<=PC+immout;
    
    endcase
end
endmodule

