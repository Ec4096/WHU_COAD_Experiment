`timescale 1ns / 1ps

`define NPC_PLUS4 3'b000
`define NPC_BRANCH 3'b001
`define NPC_JAL 3'b010
`define NPC_JALR 3'b100
module NPC(
    input [31:0]PC,
    input [2:0]NPCOp,
    input [31:0]immout,
    input [31:0]aluout,
    output reg [31:0]NPC
);
always@(*)
begin
    case(NPCOp)
    `NPC_PLUS4:NPC<=PC+4;
    `NPC_BRANCH:NPC<=PC+immout;
    `NPC_JAL:NPC<=PC+immout;
    `NPC_JALR:NPC<=aluout;
    endcase
end
endmodule
