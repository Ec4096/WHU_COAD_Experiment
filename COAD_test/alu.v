`timescale 1ns / 1ps

`define ALUOp_nop 5'b00000
`define ALUOp_lui 5'b00001
`define ALUOp_auipc 5'b00010
`define ALUOp_add 5'b00011
`define ALUOp_sub 5'b00100
module alu(
    input signed [31:0]A,B,
    input [4:0]ALUOp,
    output reg signed [31:0]C,
    output reg Zero
);
always@(*)
begin
    case(ALUOp)
    `ALUOp_add:C=A+B;
    `ALUOp_sub:C=A-B;
    default:C=32'hFFFFFFFF;
    endcase
    Zero=(C==0)?1:0;
end
endmodule
