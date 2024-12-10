`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/08 19:29:11
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



module task1(
    input clk,
    input rstn,
    input [15:0] sw_i,
    output [7:0] disp_seg_o,
    output [7:0] disp_an_o
);
//// 分频器
//reg [31:0] clkdiv;
//wire Clk_CPU;
//reg [31:0] display_data;

//wire [31:0] instr;
//reg [31:0] reg_data;
//reg [31:0] rom_addr;
//reg [31:0] rom_data;
//reg [31:0] RD1, RD2;
//reg [31:0] WD;
//parameter ROM_DATA_NUM = 11;

//always @(posedge clk or negedge rstn) begin
//    if (!rstn)
//        clkdiv <= 0;
//    else
//        clkdiv <= clkdiv + 1'b1;
//end
//assign Clk_CPU = (sw_i[15]) ? clkdiv[27] : clkdiv[25];



//always @(posedge Clk_CPU or negedge rstn) begin
//    if (!rstn) begin
//        reg_data <= 0;
//        rom_addr <= 0;
//        rom_data <= 0;
//        end 
        
//    else begin
//        // 如果模式选择为 0 且写入数据有效，允许写入寄存器
//        if (sw_i[1] == 1'b0 && sw_i[3] == 1'b1) begin
//           WD <= {{28{sw_i[7]}},sw_i[7:4]}; // 将 sw_i[7:4] 写入指定寄存器
//            end
//        end
//    if(rom_addr==ROM_DATA_NUM)begin
//        rom_addr <=  1'b0;   
//        end        
//    else begin 
//         rom_addr <= rom_addr + 1'b1; 
//         end
//end

    
//dist_mem_im U_IM(
//    .a(rom_addr),
//    .spo(instr)
//);

//reg [5:0] rf_index;          // 当前显示的寄存器索引
//reg rf_display_done;         // RF 显示完成标志


//always @(posedge Clk_CPU or negedge rstn) begin
//    if (!rstn) begin
//        rf_index <= 6'd0;
//        rf_display_done <= 1'b0;
//    end else if (sw_i[13]) begin
//        if (rf_index == 6'd32) begin
//            rf_display_done <= 1'b1;
//        end else begin
//            rf_index <= rf_index + 1'b1;
//            rf_display_done <= 1'b0;
//        end
//    end else begin
//        rf_index <= 6'd0;
//        rf_display_done <= 1'b0;
//    end
//end


//// 控制选择数据源
//always @(sw_i) begin
//    if (sw_i[0] == 1'b0) begin
//        case (sw_i[14:13])
//            2'b10: display_data = instr;    // 显示指令
//            2'b01: display_data = reg_data; // 显示寄存器数据
//            // 可以添加其他数据源显示
//            // 2'b00: display_data = alu_disp_data; // 显示ALU结果
//            // 2'b11: display_data = dmem_data; // 显示数据内存数据
//            default: display_data = instr;
//        endcase
//    end
//end


//// 实例化寄存器文件
//RF u_RF (
//    .clk(Clk_CPU),
//    .rst(rstn),
//    .RFWr(sw_i[3]),
//    .sw_i(sw_i),       // 将 sw_i 传递给寄存器文件
////    .A1(A1),
////    .A2(A2),
//    .A3(sw_i[11:8]),
//    .WD(WD),
//    .RD1(RD1),
//    .RD1(RD2)
//);


//// 实例化 7段显示器
//seg7x16 u_seg7x16(
//    .clk(clk),
//    .rstn(rstn),
//    .i_data(display_data),
//    .o_seg(disp_seg_o),
//    .o_sel(disp_an_o)
//);

reg [31:0] clkdiv;
wire Clk_CPU;
reg [31:0] display_data;
wire [31:0]WD;
wire [4:0]rd;
wire RFWr;
// 时钟分频逻辑
always @(posedge clk or negedge rstn) begin
    if (!rstn)
        clkdiv <= 0;
    else
        clkdiv <= clkdiv + 1'b1;
end

assign Clk_CPU = (sw_i[15]) ? clkdiv[27] : clkdiv[25]; // 快速/慢速时钟选择
assign RFWr = sw_i[3];
assign WD = {{28{sw_i[7]}},sw_i[7:4]};
assign rd = sw_i[11:8];

// RF 模块输出
wire [31:0] RD1,RD2;
// ROM 模块输出
wire [31:0] rom_data;
// RF 显示逻辑
reg [5:0] rf_index;          // 当前显示的寄存器索引
reg rf_display_done;         // RF 显示完成标志

always @(posedge Clk_CPU or negedge rstn) begin
    if (!rstn) begin
        rf_index <= 6'd0;
        rf_display_done <= 1'b0;
    end else if (sw_i[13]) begin
        if (rf_index == 6'd32) begin
            rf_display_done <= 1'b1;
        end else begin
            rf_index <= rf_index + 1'b1;
            rf_display_done <= 1'b0;
        end
    end else begin
        rf_index <= 6'd0;
        rf_display_done <= 1'b0;
    end
end

// 显示数据选择逻辑
always @(*) begin
    if (sw_i[14]) begin
        display_data = rom_data; // SW[14]=1，显示 ROM 内容
    end else if (sw_i[13]) begin
        if (rf_display_done && rf_index == 6'd32) begin
            display_data = 32'hFFFFFFFF; // 显示结束标志
        end else begin
            display_data = RD1; // SW[13]=1，显示 RF 数据
        end
    end else begin
        display_data = 32'b0; // 默认显示空内容
    end
end



// 实例化 RF 模块
RF rf_inst (
    .clk(Clk_CPU),
    .rst(~rstn),
    .RFWr(RFWr),           // 写使能
    .sw_i(sw_i),               // 开关输入
    .A1(rf_index),             // 读地址1
    .A2(rf_index + 1'b1),      // 读地址2
    .A3(rd),             // 写地址
    .WD(WD),         // 写数据
    .RD1(RD1),                 // 输出数据1
    .RD2(RD2)                  // 输出数据2
);

// 实例化 ROM 模块
dist_mem_im rom_inst (
    .a(rf_index),              // 地址输入
    .spo(rom_data)             // 数据输出
);

// 7 段数码管显示模块
seg7x16 u_seg7x16 (
    .clk(clk),
    .rstn(rstn),
    .i_data(display_data),
    .o_seg(disp_seg_o),
    .o_sel(disp_an_o)
);

endmodule





module RF(
    input clk,                  // 分频后的主时钟 CLK
    input rst,                  // reset 信号
    input RFWr,                 // Rfwrite = mem2reg
    input [15:0] sw_i,          // sw_i[15]---sw_i[0]
    input [4:0] A1, A2, A3,     // 寄存器地址
    input [31:0] WD,            // 写入数据
    output reg [31:0] RD1, RD2  // 数据输出端口
);

// 定义32个32位寄存器
reg [31:0] rf [31:0];

//初始化为 rf[i] = i
integer i;
always @(posedge clk or posedge rst) begin
    if (rst) begin
        // 复位时将所有寄存器初始化为 i
        for (i = 0; i < 32; i = i + 1) begin
                rf[i] <= {28'b0,i}; 
        end
    end 
    else if (RFWr) begin
        // 写操作：通过 sw_i 输入选择要写入的寄存器
        if (A3 != 0) begin  // 不允许写入到 rf[0]
            rf[A3] <= WD;
        end
    end
end

//读取寄存器值
always @(*) begin
    RD1 = rf[A1];  // 读取 A1 地址的寄存器值
    RD2 = rf[A2];  // 读取 A2 地址的寄存器值
end

endmodule




module seg7x16(
    input clk,
    input rstn,
    input [31:0] i_data,
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

reg[31:0]i_data_store;
always@(posedge clk,negedge rstn)
  if(!rstn)
     i_data_store<=0;
  else i_data_store <=i_data;
  
reg [7:0] seg_data_r;
always@(*)
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
  
reg [7:0] o_seg_r;
always@(posedge clk,negedge rstn)
  if(!rstn)
     o_seg_r<= 8'hff;
   else
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
     endcase
     assign o_sel =o_sel_r;
     assign o_seg =o_seg_r;
endmodule



