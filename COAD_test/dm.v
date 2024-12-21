`timescale 1ns / 1ps

`define dm_word 3'b000
`define dm_halfword 3'b001
`define dm_halfword_unsigned 3'b010
`define dm_byte 3'b011
`define dm_byte_unsigned 3'b100
module dm(
    input clk,
    input rstn,
    input DMWr,
    input [6:0]addr,
    input [31:0]din,
    input [2:0]DMType,
    output reg [31:0]dout
);
reg [7:0]dmem[127:0];
integer i;
always@(posedge clk or negedge rstn)
begin
    if(!rstn)
    begin
        for(i=0;i<128;i=i+1)
        begin
            dmem[i]=0;
        end
    end
    else
    begin
        if(DMWr==1'b1)
        begin
            case(DMType)
            `dm_word:
            begin
                dmem[addr]<=din[7:0];
                dmem[addr+1]<=din[15:8];
                dmem[addr+2]<=din[23:16];
                dmem[addr+3]<=din[31:24];
            end
            `dm_halfword:
            begin
                dmem[addr]<=din[7:0];
                dmem[addr+1]<=din[15:8];
            end
            `dm_halfword_unsigned:
            begin
                dmem[addr]<=din[7:0];
                dmem[addr+1]<=din[15:8];
            end
            `dm_byte:dmem[addr]<=din[7:0];
            `dm_byte_unsigned:dmem[addr]<=din[7:0];
            endcase
        end
    end
end
always@(*)
begin
    case(DMType)
        `dm_word:dout<={dmem[addr+3],dmem[addr+2],dmem[addr+1],dmem[addr]};
        `dm_halfword:dout<={{16{dmem[addr+1][7]}},dmem[addr+1],dmem[addr]};
        `dm_halfword_unsigned:dout<={16'h0000,dmem[addr+1],dmem[addr]};
        `dm_byte:dout<={{24{dmem[addr][7]}},dmem[addr]};
        `dm_byte_unsigned:dout<={24'h000000,dmem[addr]};
    endcase
end
endmodule
