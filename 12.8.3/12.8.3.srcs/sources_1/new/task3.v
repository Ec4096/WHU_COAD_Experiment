`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/08 20:47:40
// Design Name: 
// Module Name: task3
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



// ALU �����붨��
`define ALUOp_add 5'b00001
`define ALUOp_sub 5'b00010

module seg7x16 (
    input clk,
    input rstn,
    input disp_mode,
    input [63:0] i_data,
    output [7:0] o_seg,
    output [7:0] o_sel
);

    reg [14:0] cnt;
    wire seg7_clk;
    always @(posedge clk or negedge rstn)
        if (!rstn)
            cnt <= 0;
        else
            cnt <= cnt + 1'b1;

    assign seg7_clk = cnt[14];

    reg [2:0] seg7_addr;

    always @(posedge seg7_clk or negedge rstn)
        if (!rstn)
            seg7_addr <= 0;
        else
            seg7_addr <= seg7_addr + 1'b1;

    reg [7:0] o_sel_r;
    always @(*)
        case (seg7_addr)
            7: o_sel_r = 8'b01111111;
            6: o_sel_r = 8'b10111111;
            5: o_sel_r = 8'b11011111;
            4: o_sel_r = 8'b11101111;
            3: o_sel_r = 8'b11110111;
            2: o_sel_r = 8'b11111011;
            1: o_sel_r = 8'b11111101;
            0: o_sel_r = 8'b11111110;
        endcase

    reg [63:0] i_data_store;
    always @(posedge seg7_clk or negedge rstn)
        if (!rstn)
            i_data_store <= 0;
        else
            i_data_store <= i_data;

    reg [7:0] seg_data_r;
    always @(*)
        if (disp_mode == 1'b1) begin
            case (seg7_addr)
                0: seg_data_r = i_data_store[7:0];
                1: seg_data_r = i_data_store[15:8];
                2: seg_data_r = i_data_store[23:16];
                3: seg_data_r = i_data_store[31:24];
                4: seg_data_r = i_data_store[39:32];
                5: seg_data_r = i_data_store[47:40];
                6: seg_data_r = i_data_store[55:48];
                7: seg_data_r = i_data_store[63:56];
            endcase
        end else begin
            case (seg7_addr)
                0: seg_data_r = i_data_store[3:0];
                1: seg_data_r = i_data_store[7:4];
                2: seg_data_r = i_data_store[11:8];
                3: seg_data_r = i_data_store[15:12];
                4: seg_data_r = i_data_store[19:16];
                5: seg_data_r = i_data_store[23:20];
                6: seg_data_r = i_data_store[27:24];
                7: seg_data_r = i_data_store[31:28];
            endcase
        end

    reg [7:0] o_seg_r;
    always @(posedge clk or negedge rstn)
        if (!rstn)
            o_seg_r <= 8'hff;
        else if (disp_mode == 1'b0) begin
            case (seg_data_r)
                4'h0: o_seg_r <= 8'hC0;
                4'h1: o_seg_r <= 8'hF9;
                4'h2: o_seg_r <= 8'hA4;
                4'h3: o_seg_r <= 8'hB0;
                4'h4: o_seg_r <= 8'h99;
                4'h5: o_seg_r <= 8'h92;
                4'h6: o_seg_r <= 8'h82;
                4'h7: o_seg_r <= 8'hF8;
                4'h8: o_seg_r <= 8'h80;
                4'h9: o_seg_r <= 8'h90;
                4'hA: o_seg_r <= 8'h88;
                4'hB: o_seg_r <= 8'h83;
                4'hC: o_seg_r <= 8'hC6;
                4'hD: o_seg_r <= 8'hA1;
                4'hE: o_seg_r <= 8'h86;
                4'hF: o_seg_r <= 8'h8E;
                default: o_seg_r <= 8'hFF;
            endcase
        end else begin
            o_seg_r <= seg_data_r;
        end

    assign o_sel = o_sel_r;
    assign o_seg = o_seg_r;
endmodule


module alu(
    input signed [31:0] A, B,       // ALU ���������
    input [4:0] ALUOp,              // ALU ������
    output reg signed [31:0] C,     // ALU ������
    output reg Zero                 // Zero ��־λ
);

    always @(*) begin
        case (ALUOp)
            `ALUOp_add: C = A + B;            // �ӷ�
            `ALUOp_sub: C = A - B;            // ����
            default: C = 32'b0;               // Ĭ����� 0
        endcase

        // Zero ��־�������Ϊ��ʱ��λ
        Zero = (C == 32'b0) ? 1'b1 : 1'b0;
    end

endmodule

module RF(
    input clk,
    input rst,
    input RFWr,
    input [15:0]sw_i,
    input [2:0]A1,A2,A3,
    input [31:0]WD,
    output reg [31:0]RD1,RD2
);
  reg signed [31:0] registers [7:0]; // 8 �� 32 λ�Ĵ���

    // �첽���߼�
    always @(*) begin
        RD1 = registers[A1];
        RD2 = registers[A2];
    end

    // ͬ��д�߼�
    integer i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 8; i = i + 1) begin
                registers[i] <= i; // �� i ���Ĵ�����ֵΪ i
            end
        end 
        else if (RFWr) begin
            registers[A3] <= WD; // д�����ݵ��Ĵ���
        end
    end
endmodule


module task3 (
    input clk,
    input rstn,
    input [15:0] sw_i,             // ��������
    output [7:0] disp_seg_o,       // ����ܶ�ѡ�ź�
    output [7:0] disp_an_o         // �����λѡ�ź�
);

    reg [31:0] clkdiv;
    wire Clk_CPU;
    reg [31:0] display_data;

    always @(posedge clk or negedge rstn) begin
        if (!rstn)
            clkdiv <= 0;
        else
            clkdiv <= clkdiv + 1'b1;
    end

    assign Clk_CPU = (sw_i[15]) ? clkdiv[27] : clkdiv[25]; // ����/����ʱ��ѡ��

    // ALU �� RF �ź�
    wire signed [31:0] RD1, RD2;
    wire signed [31:0] alu_c;
    wire alu_zero;
    reg [4:0] alu_op;

    reg [1:0] display_index;//3��

    always @(posedge Clk_CPU or negedge rstn) begin
        if (!rstn)
            display_index <= 0;
        else if (sw_i[12])
            display_index <= display_index + 1;
    end

    always @(*) begin
        alu_op = (sw_i[4:3] == 2'b01) ? `ALUOp_add : `ALUOp_sub;
    end

    RF rf_inst (
        .clk(Clk_CPU),
        .rst(~rstn),
        .RFWr(sw_i[2]),
        .A1(sw_i[10:8]),
        .A2(sw_i[7:5]),
        .A3(sw_i[10:8]),
        .WD({29'b0, sw_i[7:5]}),
        .RD1(RD1),jks                                                                                                                                                                                                                                                                                                                                                           
        .RD2(RD2)
    );

    alu alu_inst (
        .A(RD1),
        .B(RD2),
        .ALUOp(alu_op),
        .C(alu_c),
        .Zero(alu_zero)
    );

    always @(*) begin
        case (display_index)
            2'b00: display_data = RD1;
            2'b01: display_data = RD2;
            2'b10: display_data = alu_c;
            2'b11: display_data = {31'b0, alu_zero};
            default: display_data = 32'b0;
        endcase
    end

    seg7x16 seg_display (
        .clk(clk),
        .rstn(rstn),
        .i_data(display_data),
        .disp_mode(sw_i[0]),
        .o_seg(disp_seg_o),
        .o_sel(disp_an_o)
    );

endmodule
