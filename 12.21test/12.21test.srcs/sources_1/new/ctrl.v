`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/21 22:26:00
// Design Name: 
// Module Name: ctrl
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

module ctrl(
    input [6:0]Op,
    input [6:0]Funct7,
    input [2:0]Funct3,
    input Zero,
    //��Ϊ������
    input signed [31:0]C,
    output RegWrite,
    output MemWrite,
    output [5:0]EXTOp,
    output [4:0]ALUOp,
    output ALUSrc,
    output [2:0]DMType,
    output [1:0]WDSel,
    output [7:0]NPCOp
);
//R
wire rtype=~Op[6]&Op[5]&Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0];
wire i_add=rtype&~Funct7[6]&~Funct7[5]&~Funct7[4]&~Funct7[3]&~Funct7[2]&~Funct7[1]&~Funct7[0]&~Funct3[2]&~Funct3[1]&~Funct3[0];
wire i_sub=rtype&~Funct7[6]&Funct7[5]&~Funct7[4]&~Funct7[3]&~Funct7[2]&~Funct7[1]&~Funct7[0]&~Funct3[2]&~Funct3[1]&~Funct3[0];


//I_load
wire itype_l=~Op[6]&~Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0];
wire i_lb=itype_l&~Funct3[2]&~Funct3[1]&~Funct3[0];
wire i_lh=itype_l&~Funct3[2]&~Funct3[1]&Funct3[0];
wire i_lw=itype_l&~Funct3[2]&Funct3[1]&~Funct3[0];
//I_reg
wire itype_r=~Op[6]&~Op[5]&Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0];
wire i_addi=itype_r&~Funct3[2]&~Funct3[1]&~Funct3[0];
//S
wire stype=~Op[6]&Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0];
wire i_sb=stype&~Funct3[2]&~Funct3[1]&~Funct3[0];
wire i_sh=stype&~Funct3[2]&~Funct3[1]&Funct3[0];
wire i_sw=stype&~Funct3[2]&Funct3[1]&~Funct3[0];
//UJ
wire i_jal=Op[6]&Op[5]&~Op[4]&Op[3]&Op[2]&Op[1]&Op[0];
wire i_jalr=Op[6]&Op[5]&~Op[4]&~Op[3]&Op[2]&Op[1]&Op[0];
//SB
wire sbtype=Op[6]&Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0];
wire i_beq=sbtype&~Funct3[2]&~Funct3[1]&~Funct3[0];
wire i_bne=sbtype&~Funct3[2]&~Funct3[1]&Funct3[0];
wire i_blt=sbtype&Funct3[2]&~Funct3[1]&~Funct3[0];
wire i_bge=sbtype&Funct3[2]&~Funct3[1]&Funct3[0];
wire i_bltu=sbtype&Funct3[2]&Funct3[1]&~Funct3[0];
wire i_bgeu=sbtype&Funct3[2]&Funct3[1]&Funct3[0];



assign RegWrite=rtype|itype_l|itype_r|i_jal|i_jalr;
assign MemWrite=stype;

assign EXTOp[5]=0;
assign EXTOp[4]=itype_l|i_addi|i_jalr;
assign EXTOp[3]=stype;
assign EXTOp[2]=sbtype;
assign EXTOp[1]=0;
assign EXTOp[0]=i_jal;

assign ALUOp[4]=0;
assign ALUOp[3]=i_bltu|i_bgeu;
assign ALUOp[2]=i_beq|i_bne|i_blt|i_bge;
assign ALUOp[1]=i_add|itype_l|i_addi|stype|i_jalr;
assign ALUOp[0]=i_add|itype_l|i_addi|stype|i_jalr;
assign ALUSrc=itype_l|itype_r|stype|i_jal|i_jalr;

assign DMType[1]=i_lb|i_sb;
assign DMType[0]=i_lb|i_lh|i_sb|i_sh;

assign WDSel[1]=i_jal|i_jalr;
assign WDSel[0]=itype_l;

// assign NPCOp[2]=i_jalr;
// assign NPCOp[1]=i_jal;
assign NPCOp[7]=i_jalr;
assign NPCOp[6]=i_jal;
assign NPCOp[5]=i_bltu&(C[31]|~Zero);
assign NPCOp[4]=i_bgeu&(Zero|~C[31]);
assign NPCOp[3]=i_blt&(C[31]|~Zero);
assign NPCOp[2]=i_bge&(Zero|~C[31]);
assign NPCOp[1]=i_bne&~Zero;
assign NPCOp[0]=i_beq&Zero;


endmodule

