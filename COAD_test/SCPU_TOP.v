`timescale 1ns / 1ps


module SCPU_TOP(
    input clk,
    input rstn,
    input [15:0]sw_i,
    output [7:0]disp_an_o,
    output [7:0]disp_seg_o    
);
//Clock Divide
reg [31:0]clkdiv;
wire Clk_CPU;
wire Clk_instr;
always@(posedge clk or negedge rstn)
begin
    if(!rstn)
        clkdiv<=0;
    else
        clkdiv<=clkdiv+1'b1;
end
assign Clk_CPU=(sw_i[15])?clkdiv[27]:clkdiv[25];
assign Clk_instr=Clk_CPU&~sw_i[1];
//Cycle
reg [63:0]display_data;
parameter LED_DATA_NUM=19;
reg [4:0]led_data_addr;
wire [31:0]rom_addr;
//parameter REG_DATA_NUM=32;
parameter REG_DATA_NUM=11;
reg [4:0]reg_addr;
parameter ALU_DATA_NUM=4;
reg [1:0]alu_addr;
parameter DMEM_DATA_NUM=16;
reg [3:0]dmem_addr;

//LED
reg [63:0]led_disp_data;
reg [63:0]LED_DATA[18:0];
initial begin
    LED_DATA[0] = 64'hC6F6F6F0C6F6F6F0;
    LED_DATA[1] = 64'hF9F6F6CFF9F6F6CF;
    LED_DATA[2] = 64'hFFC6F0FFFFC6F0FF;
    LED_DATA[3] = 64'hFFC0FFFFFFC0FFFF;
    LED_DATA[4] = 64'hFFA3FFFFFFA3FFFF;
    LED_DATA[5] = 64'hFFFFA3FFFFFFA3FF;
    LED_DATA[6] = 64'hFFFF9CFFFFFF9CFF;
    LED_DATA[7] = 64'hFF9EBCFFFF9EBCFF;
    LED_DATA[8] = 64'hFF9CFFFFFF9CFFFF;
    LED_DATA[9] = 64'hFFC0FFFFFFC0FFFF;
    LED_DATA[10] = 64'hFFA3FFFFFFA3FFFF;
    LED_DATA[11] = 64'hFFA7B3FFFFA7B3FF;
    LED_DATA[12] = 64'hFFC6F0FFFFC6F0FF;
    LED_DATA[13] = 64'hF9F6F6CFF9F6F6CF;
    LED_DATA[14] = 64'h9EBEBEBC9EBEBEBC;
    LED_DATA[15] = 64'h2737373327373733;
    LED_DATA[16] = 64'h505454EC505454EC;
    LED_DATA[17] = 64'h744454F8744454F8;
    LED_DATA[18] = 64'h0062080000620800;
end

//Wire Everything
wire [31:0]instr;
wire [6:0]Op;
wire [6:0]Funct7;
wire [2:0]Funct3;
wire [11:0]iimm;
wire [11:0]simm;
wire [11:0]bimm;
wire [19:0]jimm;
wire [5:0]EXTOp;
wire [31:0]immout;
wire [4:0]rs1,rs2;
wire [4:0]rd;
reg [31:0]WD;
wire [1:0]WDSel;
wire RegWrite;
wire [31:0]RD1,RD2;
wire [31:0]A,B;
wire ALUSrc;
wire [4:0]ALUOp;
wire [31:0]aluout;
wire Zero;
wire MemWrite;
wire [6:0]dm_addr;
wire [31:0]dm_din;
wire [2:0]DMType;
wire [31:0]dm_dout;
wire [2:0]NPCOp;
wire [31:0]PCout;
wire [31:0]NPC;
//Initialize
assign Op=instr[6:0];
assign Funct7=instr[31:25];
assign Funct3=instr[14:12];
assign rs1=instr[19:15];
assign rs2=instr[24:20];
assign rd=instr[11:7];
assign iimm=instr[31:20];
assign simm={instr[31:25],instr[11:7]};
assign bimm={instr[31],instr[7],instr[30:25],instr[11:8]};
assign jimm={instr[31],instr[19:12],instr[20],instr[30:21]};
//ROM
dist_mem_gen_10 U_IM(.a(rom_addr[7:2]),.spo(instr));
//CTRL
ctrl U_ctrl(.Op(Op),.Funct7(Funct7),.Funct3(Funct3),.Zero(Zero),.RegWrite(RegWrite),.MemWrite(MemWrite),.EXTOp(EXTOp),.ALUOp(ALUOp),.ALUSrc(ALUSrc),.DMType(DMType),.WDSel(WDSel),.NPCOp(NPCOp));
//EXT
EXT U_EXT(.iimm(iimm),.simm(simm),.bimm(bimm),.jimm(jimm),.EXTOp(EXTOp),.immout(immout));
//PC&NPC
PC U_PC(.clk(Clk_CPU),.rstn(rstn),.sw_i(sw_i),.PC(rom_addr),.NPC(NPC),.PCout(rom_addr));
NPC U_NPC(.PC(rom_addr),.NPCOp(NPCOp),.immout(immout),.aluout(aluout),.NPC(NPC));
//RF
reg [31:0]reg_data;
always@(*)
begin
    case(WDSel)
    2'b00:WD<=aluout;
    2'b01:WD<=dm_dout;
    2'b10:WD<=rom_addr+4;
    endcase
end
RF U_RF(.clk(Clk_instr),.rstn(rstn),.RFWr(RegWrite),.A1(rs1),.A2(rs2),.A3(rd),.WD(WD),.RD1(RD1),.RD2(RD2));
//ALU
reg [31:0]alu_disp_data;
assign B=(ALUSrc)?immout:RD2;
alu U_alu(.A(RD1),.B(B),.ALUOp(ALUOp),.C(aluout),.Zero(Zero));
//DMEM
reg [31:0]dmem_data;
assign dm_addr=aluout[6:0];
dm U_dm(.clk(Clk_instr),.rstn(rstn),.DMWr(MemWrite),.addr(dm_addr),.din(RD2),.DMType(DMType),.dout(dm_dout));
//Display
always@(posedge Clk_CPU or negedge rstn)
begin
    if(!rstn)
    begin
        reg_addr=5'b0;
        alu_addr=2'b0;
        dmem_addr=4'b0;
        led_data_addr=5'd0;
        led_disp_data=64'b1;
    end
    else if(sw_i[0]==1'b1)
    begin
        if(led_data_addr==LED_DATA_NUM)
        begin
            led_data_addr=5'd0;
            led_disp_data=64'b1;
        end
        led_disp_data=LED_DATA[led_data_addr];
        led_data_addr=led_data_addr+1;
    end
    else
    begin
        led_data_addr=led_data_addr;
        if(sw_i[13]==1'b1)
        begin
            if(reg_addr==REG_DATA_NUM)
                reg_addr=5'b0;
            else
            begin
                reg_data=U_RF.rf[reg_addr];
                reg_addr=reg_addr+1'b1;
            end
        end
        if(sw_i[12]==1'b1)
        begin
            if(alu_addr==ALU_DATA_NUM)
                alu_addr=2'b0;
            else
            begin
                case(alu_addr)
                2'b00:alu_disp_data=U_alu.A;
                2'b01:alu_disp_data=U_alu.B;
                2'b10:alu_disp_data=U_alu.C;
                2'b11:alu_disp_data=U_alu.Zero;
                endcase
                alu_addr=alu_addr+1'b1;
            end
        end
        if(sw_i[11]==1'b1)
        begin
            if(dmem_addr==DMEM_DATA_NUM)
                dmem_addr=4'b0;
            else
            begin
                dmem_data=U_dm.dmem[dmem_addr];
                dmem_addr=dmem_addr+1'b1;
            end
        end
    end
end



//Choose Data
always@(sw_i)
begin
    if(sw_i[0]==1'b0)
    begin
        case(sw_i[14:11])
            4'b1000:display_data=instr;
            4'b0100:display_data=reg_data;
            4'b0010:display_data=alu_disp_data;
            4'b0001:display_data=dmem_data;
            default:display_data=32'h76543210;
        endcase
    end
    else
    begin
        display_data=led_disp_data;
    end
end

//seg7x16
seg7x16 u_seg7x16(.clk(clk),.rstn(rstn),.i_data(display_data),.disp_mode(sw_i[0]),.o_seg(disp_seg_o),.o_sel(disp_an_o));
endmodule
