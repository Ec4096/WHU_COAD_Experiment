`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/24 14:33:50
// Design Name: 
// Module Name: task1
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


//module task1(

//    );
//endmodule

module sccomp(
    input clk,
    input rstn,
    input [15:0] sw_i,
    output [7:0] disp_seg_o,
    output [7:0] disp_an_o
);
reg [31:0] clkdiv;
wire Clk_CPU;

//分频                          
always @(posedge clk or negedge rstn) begin
    if (!rstn)
        clkdiv <= 0;
    else
        clkdiv <= clkdiv + 1'b1;
end

assign Clk_CPU = (sw_i[15]) ? clkdiv[27] : clkdiv[25];



reg [63:0] display_data; // 7 segments display
reg [5:0] led_data_addr;  //2^6-=64,2^5=32
reg [63:0] led_disp_data;
parameter LED_DATA_NUM = 19;
reg [63:0] LED_DATA [18:0];       //19个
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


wire [31:0] instr;
reg [31:0] reg_data;
reg [31:0] alu_disp_data;
reg [31:0] dmem_data;

// Generate LED_DATA 图形变换module
always @(posedge Clk_CPU or negedge rstn) begin
    if (!rstn) 
    begin
        led_data_addr <= 6'd0;
        led_disp_data <= 64'b1;     
    end 
    else if (sw_i[0] == 1'b1) 			//sw_i[0]控制整个程序的开始，1的时候程序开始运行
    begin                                               
        if (led_data_addr == LED_DATA_NUM) begin
        //这里起到一个结束的作用，
        //led_data_addr>=19，led_data_addr就应该重新从0开始了，干这个

            led_data_addr <= 6'd0;
            led_disp_data <= 64'b1;
        end 
        else //ed_data_addr<=18,正常运行
        begin
            //将真正要显示的信号输入到led_disp_data
            led_disp_data <= LED_DATA[led_data_addr];
            //然后该显示下一个了，led_data_addr++            
            led_data_addr <= led_data_addr + 1'b1;
        end
    end 
    else //0模式
    begin
    //这个时候地址保持原有的显示不变
        led_data_addr <= led_data_addr;
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
            default: display_data = instr;//默认赋值ROM
        endcase
    end 
else 
begin		//sw_i[0] == 1'b1的时候display_data才能获得我们前面建立的数组的数据。
        display_data = led_disp_data;
    end
end

seg7x16 u_seg7x16
(
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
//15分频
always@(posedge clk,negedge rstn)
if (!rstn)
    cnt<=0;
else
    cnt<=cnt + 1'b1;

assign seg7_clk = cnt[14];

reg [2:0] seg7_addr;


//跑马
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
  if (disp_mode==1'b1) begin //图形模式
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
  else begin //数字模式
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
     else begin //1模式 即图形模式
      o_seg_r<=seg_data_r;
     end
     assign o_sel =o_sel_r;
     assign o_seg =o_seg_r;
     
endmodule


