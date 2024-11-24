`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/24 15:14:50
// Design Name: 
// Module Name: snake
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
module snake(
    input clk,
    input rstn,
    input [15:0] sw_i,
    output [7:0] disp_seg_o,
    output [7:0] disp_an_o
);
reg [31:0] clkdiv;
wire Clk_CPU;
always @(posedge clk or negedge rstn) begin
    if (!rstn)
        clkdiv <= 0;
    else
        clkdiv <= clkdiv + 1'b1;
end

assign Clk_CPU = (sw_i[15]) ? clkdiv[27] : clkdiv[25];

reg [63:0] display_data; // 7 segments display
reg [5:0] led_data_addr;
reg [63:0] led_disp_data;
parameter LED_DATA_NUM = 48;       //现在是贪吃蛇，从19改成48
parameter ROM_ADDR_NUM = 64;
reg [63:0] LED_DATA [47:0];        //这里也修改


initial begin
    LED_DATA[0]=64'hFFFFFFFEFEFEFEFE;
    LED_DATA[1]=64'hFFFEFEFEFEFEFFFF;
    LED_DATA[2]=64'hDEFEFEFEFFFFFFFF;
    LED_DATA[3]=64'hCEFEFEFFFFFFFFFF;
    LED_DATA[4]=64'hC2FFFFFFFFFFFFFF;
    LED_DATA[5]=64'hC1FEFFFFFFFFFFFF;
    LED_DATA[6]=64'hF1FCFFFFFFFFFFFF;
    LED_DATA[7]=64'hFDF8F7FFFFFFFFFF;
    LED_DATA[8]=64'hFFF8F3FFFFFFFFFF;
    LED_DATA[9]=64'hFFFBF1FEFFFFFFFF;
    LED_DATA[10]=64'hFFFFF9F8FFFFFFFF;
    LED_DATA[11]=64'hFFFFFDF8F7FFFFFF;
    LED_DATA[12]=64'hFFFFFFF9F1FFFFFF;
    LED_DATA[13]=64'hFFFFFFFFF1FCFFFF;
    LED_DATA[14]=64'hFFFFFFFFF9F8FFFF;
    LED_DATA[15]=64'hFFFFFFFFFFF8F3FF;
    LED_DATA[16]=64'hFFFFFFFFFFFBF1FE;
    LED_DATA[17]=64'hFFFFFFFFFFFFF9BC;
    LED_DATA[18]=64'hFFFFFFFFFFFFBDBC;
    LED_DATA[19]=64'hFFFFFFFFBFBFBFBD;
    LED_DATA[20]=64'hFFFFBFBFBFBFBFFF;
    LED_DATA[21]=64'hFFBFBFBFBFBFFFFF;
    LED_DATA[22]=64'hAFBFBFBFFFFFFFFF;
    LED_DATA[23]=64'h2737FFFFFFFFFFFF;
    LED_DATA[24]=64'h277777FFFFFFFFFF;
    LED_DATA[25]=64'h7777777777FFFFFF;
    LED_DATA[26]=64'hFFFF7777777777FF;
    LED_DATA[27]=64'hFFFFFF7777777777;
    LED_DATA[28]=64'hFFFFFFFFFF777771;
    LED_DATA[29]=64'hFFFFFFFFFFFF7750;
    LED_DATA[30]=64'hFFFFFFFFFFFFFF8C;
    LED_DATA[31]=64'hFFFFFFFFFFFFE7CE;
    LED_DATA[32]=64'hFFFFFFFFFFFFC7CF;
    LED_DATA[33]=64'hFFFFFFFFFFDEC7FF;
    LED_DATA[34]=64'hFFFFFFFFF7CEDFFF;
    LED_DATA[35]=64'hFFFFFFFFC7CFFFFF;
    LED_DATA[36]=64'hFFFFFFFEC7EFFFFF;
    LED_DATA[37]=64'hFFFFFFCECFFFFFFF;
    LED_DATA[38]=64'hFFFFE7CEFFFFFFFF;
    LED_DATA[39]=64'hFFFFC7CFFFFFFFFF;
    LED_DATA[40]=64'hFFDEC7FFFFFFFFFF;
    LED_DATA[41]=64'hF7CEDFFFFFFFFFFF;
    LED_DATA[42]=64'hA7CFFFFFFFFFFFFF;
    LED_DATA[43]=64'hA7AFFFFFFFFFFFFF;
    LED_DATA[44]=64'hAFBFBFBFFFFFFFFF;
    LED_DATA[45]=64'hBFBFBFBFBFFFFFFF;
    LED_DATA[46]=64'hFFFFBFBFBFBFBFFF;
    LED_DATA[47]=64'hFFFFFFFFBFBFBFBD;
end


wire [31:0] instr;
reg [31:0] reg_data;
reg [31:0] alu_disp_data;
reg [31:0] dmem_data;
reg [63:0] rom_addr;


// Generate LED_DATA
always @(posedge Clk_CPU or negedge rstn) begin
    if (!rstn) begin
        led_data_addr <= 6'd0;
        led_disp_data <= 64'b1;
    end else if (sw_i[0] == 1'b1) begin
        if (led_data_addr == LED_DATA_NUM) begin
            led_data_addr <= 6'd0;
            led_disp_data <= 64'b1;
        end 
        else begin
            led_disp_data <= LED_DATA[led_data_addr];
            if(led_data_addr==ROM_ADDR_NUM)
            begin
            led_data_addr <=  1'b0;   
            end        
            else begin led_data_addr <= led_data_addr + 1'b1; end
            
        end
    end else begin
         led_data_addr <= led_data_addr;
         rom_addr=rom_addr+1'b1;
    end
end
// Choose display source data
always @(sw_i) begin
    if (sw_i[0] == 1'b0) begin
        case (sw_i[14:11])
            4'b1000: display_data = instr; // ROM
            4'b0100: display_data = reg_data; // RF
            4'b0010: display_data = alu_disp_data; // ALU
            4'b0001: display_data = dmem_data; // DMEM
            default: display_data = instr;
        endcase
    end else begin
        display_data = led_disp_data;
    end
end

//dist_mem_gen_0  U_IM(.a(rom_addr),.spo(instr));

seg7x16 u_seg7x16(
    .clk(clk),
    .rstn(rstn),
    .i_data(display_data),
    .disp_mode(sw_i[0]),
    .o_seg(disp_seg_o),
    .o_sel(disp_an_o)
);
endmodule

`timescale 1ns/1ps
module seg7x16(
input clk,
input rstn,
input disp_mode,
input [63:0] i_data,
output [7:0]o_seg,
output [7:0]o_sel
);

reg [14:0] cnt;
wire seg7_clk;
always@(posedge clk,negedge rstn)
if (!rstn)
    cnt<=0;
else
    cnt<=cnt + 1'b1;
assign seg7_clk = cnt[14];

reg [2:0] seg7_addr;

always @ (posedge seg7_clk,negedge rstn)
if(!rstn)
    seg7_addr<=0;
else
    seg7_addr<= seg7_addr + 1'b1;

reg [7:0] o_sel_r;

always @(*) 
case(seg7_addr)//片选信号
    7:o_sel_r = 8'b01111111;
    6:o_sel_r = 8'b10111111;
    5:o_sel_r = 8'b11011111;
    4:o_sel_r = 8'b11101111;
    3:o_sel_r = 8'b11110111;
    2:o_sel_r = 8'b11111011;
    1:o_sel_r = 8'b11111101;
    0:o_sel_r = 8'b11111110;
endcase

reg[63:0]i_data_store;
always@(posedge clk,negedge rstn)
  if(!rstn)
     i_data_store<=0;
  else i_data_store <=i_data;
  
reg [7:0] seg_data_r;
always@(*)
  if (disp_mode==1'b1) begin
    case(seg7_addr)
    0:seg_data_r = i_data_store[7:0];
    1:seg_data_r = i_data_store[15:8];
    2:seg_data_r = i_data_store[23:16];
    3:seg_data_r = i_data_store[31:24];
    4:seg_data_r = i_data_store[39:32];
    5:seg_data_r = i_data_store[47:40];
    6:seg_data_r = i_data_store[55:48];
    7:seg_data_r = i_data_store[63:56];
    endcase
  end
  else begin
  case(seg7_addr) 
    0:seg_data_r = i_data_store[3:0];
    1:seg_data_r = i_data_store[7:4];
    2:seg_data_r = i_data_store[11:8];
    3:seg_data_r = i_data_store[15:12];
    4:seg_data_r = i_data_store[19:16];
    5:seg_data_r = i_data_store[23:20];
    6:seg_data_r = i_data_store[27:24];
    7:seg_data_r = i_data_store[31:28];
  endcase
  end
  
reg [7:0] o_seg_r;
always@(posedge clk,negedge rstn)
  if(!rstn)
     o_seg_r<= 8'hff;
   else if (disp_mode==1'b0) begin
     case(seg_data_r)
     4'h0:o_seg_r<=8'hC0;
     4'h1:o_seg_r<=8'hF9;
     4'h2:o_seg_r<=8'hA4;
     4'h3:o_seg_r<=8'hB0;
     4'h4:o_seg_r<=8'h99;
     4'h5:o_seg_r<=8'h92;
     4'h6:o_seg_r<=8'h82;
     4'h7:o_seg_r<=8'hF8;
     4'h8:o_seg_r<=8'h80;
     4'h9:o_seg_r<=8'h90;
     4'hA:o_seg_r<=8'h88;
     4'hB:o_seg_r<=8'h83;
     4'hC:o_seg_r<=8'hC6;
     4'hD:o_seg_r<=8'hA1;
     4'hE:o_seg_r<=8'h86;
     4'hF:o_seg_r<=8'h8E;
     default: o_seg_r<=8'hFF;
     endcase end
     else begin
      o_seg_r<=seg_data_r;
     end
     assign o_sel =o_sel_r;
     assign o_seg =o_seg_r;
endmodule
