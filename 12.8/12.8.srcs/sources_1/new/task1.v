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
//// ��Ƶ��
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
//        // ���ģʽѡ��Ϊ 0 ��д��������Ч������д��Ĵ���
//        if (sw_i[1] == 1'b0 && sw_i[3] == 1'b1) begin
//           WD <= {{28{sw_i[7]}},sw_i[7:4]}; // �� sw_i[7:4] д��ָ���Ĵ���
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

//reg [5:0] rf_index;          // ��ǰ��ʾ�ļĴ�������
//reg rf_display_done;         // RF ��ʾ��ɱ�־


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


//// ����ѡ������Դ
//always @(sw_i) begin
//    if (sw_i[0] == 1'b0) begin
//        case (sw_i[14:13])
//            2'b10: display_data = instr;    // ��ʾָ��
//            2'b01: display_data = reg_data; // ��ʾ�Ĵ�������
//            // ���������������Դ��ʾ
//            // 2'b00: display_data = alu_disp_data; // ��ʾALU���
//            // 2'b11: display_data = dmem_data; // ��ʾ�����ڴ�����
//            default: display_data = instr;
//        endcase
//    end
//end


//// ʵ�����Ĵ����ļ�
//RF u_RF (
//    .clk(Clk_CPU),
//    .rst(rstn),
//    .RFWr(sw_i[3]),
//    .sw_i(sw_i),       // �� sw_i ���ݸ��Ĵ����ļ�
////    .A1(A1),
////    .A2(A2),
//    .A3(sw_i[11:8]),
//    .WD(WD),
//    .RD1(RD1),
//    .RD1(RD2)
//);


//// ʵ���� 7����ʾ��
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
// ʱ�ӷ�Ƶ�߼�
always @(posedge clk or negedge rstn) begin
    if (!rstn)
        clkdiv <= 0;
    else
        clkdiv <= clkdiv + 1'b1;
end

assign Clk_CPU = (sw_i[15]) ? clkdiv[27] : clkdiv[25]; // ����/����ʱ��ѡ��
assign RFWr = sw_i[3];
assign WD = {{28{sw_i[7]}},sw_i[7:4]};
assign rd = sw_i[11:8];

// RF ģ�����
wire [31:0] RD1,RD2;
// ROM ģ�����
wire [31:0] rom_data;
// RF ��ʾ�߼�
reg [5:0] rf_index;          // ��ǰ��ʾ�ļĴ�������
reg rf_display_done;         // RF ��ʾ��ɱ�־

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

// ��ʾ����ѡ���߼�
always @(*) begin
    if (sw_i[14]) begin
        display_data = rom_data; // SW[14]=1����ʾ ROM ����
    end else if (sw_i[13]) begin
        if (rf_display_done && rf_index == 6'd32) begin
            display_data = 32'hFFFFFFFF; // ��ʾ������־
        end else begin
            display_data = RD1; // SW[13]=1����ʾ RF ����
        end
    end else begin
        display_data = 32'b0; // Ĭ����ʾ������
    end
end



// ʵ���� RF ģ��
RF rf_inst (
    .clk(Clk_CPU),
    .rst(~rstn),
    .RFWr(RFWr),           // дʹ��
    .sw_i(sw_i),               // ��������
    .A1(rf_index),             // ����ַ1
    .A2(rf_index + 1'b1),      // ����ַ2
    .A3(rd),             // д��ַ
    .WD(WD),         // д����
    .RD1(RD1),                 // �������1
    .RD2(RD2)                  // �������2
);

// ʵ���� ROM ģ��
dist_mem_im rom_inst (
    .a(rf_index),              // ��ַ����
    .spo(rom_data)             // �������
);

// 7 ���������ʾģ��
seg7x16 u_seg7x16 (
    .clk(clk),
    .rstn(rstn),
    .i_data(display_data),
    .o_seg(disp_seg_o),
    .o_sel(disp_an_o)
);

endmodule





module RF(
    input clk,                  // ��Ƶ�����ʱ�� CLK
    input rst,                  // reset �ź�
    input RFWr,                 // Rfwrite = mem2reg
    input [15:0] sw_i,          // sw_i[15]---sw_i[0]
    input [4:0] A1, A2, A3,     // �Ĵ�����ַ
    input [31:0] WD,            // д������
    output reg [31:0] RD1, RD2  // ��������˿�
);

// ����32��32λ�Ĵ���
reg [31:0] rf [31:0];

//��ʼ��Ϊ rf[i] = i
integer i;
always @(posedge clk or posedge rst) begin
    if (rst) begin
        // ��λʱ�����мĴ�����ʼ��Ϊ i
        for (i = 0; i < 32; i = i + 1) begin
                rf[i] <= {28'b0,i}; 
        end
    end 
    else if (RFWr) begin
        // д������ͨ�� sw_i ����ѡ��Ҫд��ļĴ���
        if (A3 != 0) begin  // ������д�뵽 rf[0]
            rf[A3] <= WD;
        end
    end
end

//��ȡ�Ĵ���ֵ
always @(*) begin
    RD1 = rf[A1];  // ��ȡ A1 ��ַ�ļĴ���ֵ
    RD2 = rf[A2];  // ��ȡ A2 ��ַ�ļĴ���ֵ
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
    case(seg7_addr)//Ƭѡ�ź�
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



