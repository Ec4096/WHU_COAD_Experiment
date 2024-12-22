`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/21 22:27:30
// Design Name: 
// Module Name: EXT
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

`define EXT_CTRL_ITYPE 6'b010000
`define EXT_CTRL_STYPE 6'b001000
`define EXT_CTRL_BTYPE 6'b000100
`define EXT_CTRL_JTYPE 6'b000001
module EXT(
    input [11:0]iimm,
    input [11:0]simm,
    input [11:0]bimm,
    input [19:0]jimm,
    input [5:0]EXTOp,
    output reg [31:0]immout
);
always@(*)
begin
    case(EXTOp)
    `EXT_CTRL_ITYPE:immout<={{20{iimm[11]}},iimm};
    `EXT_CTRL_STYPE:immout<={{20{simm[11]}},simm};
    `EXT_CTRL_BTYPE:immout<={{19{bimm[11]}},bimm,1'b0};
    `EXT_CTRL_JTYPE:immout<={{11{jimm[19]}},jimm,1'b0};
    default:immout<=32'h00000000;
    endcase
end
endmodule
