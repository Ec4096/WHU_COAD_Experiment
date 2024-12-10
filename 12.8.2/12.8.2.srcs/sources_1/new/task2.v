`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/08 20:27:13
// Design Name: 
// Module Name: task2
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


// ALU 操作码定义
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
    input signed [31:0] A, B,       // ALU 输入操作数
    input [4:0] ALUOp,              // ALU 操作码
    output reg signed [31:0] C,     // ALU 运算结果
    output reg Zero                 // Zero 标志位
);

    always @(*) begin
        case (ALUOp)
            `ALUOp_add: C = A + B;            // 加法
            `ALUOp_sub: C = A - B;            // 减法
            default: C = 32'b0;               // 默认输出 0
        endcase

        // Zero 标志，当结果为零时置位
        Zero = (C == 32'b0) ? 1'b1 : 1'b0;
    end

endmodule


//------------------------------
module task2 (
    input clk,
    input rstn,
    input [15:0] sw_i,            // 开关输入
    output [7:0] disp_seg_o,      // 数码管段选信号
    output [7:0] disp_an_o        // 数码管位选信号
);

    reg [31:0] clkdiv;
    wire Clk_CPU;
    reg [31:0] display_data;

    // 时钟分频逻辑
    always @(posedge clk or negedge rstn) begin
        if (!rstn)
            clkdiv <= 0;
        else
            clkdiv <= clkdiv + 1'b1;
    end

    assign Clk_CPU = (sw_i[15]) ? clkdiv[27] : clkdiv[25]; // 快速/慢速时钟选择

    // ALU 模块信号
    reg signed [31:0] alu_a, alu_b;   // ALU 输入
    wire signed [31:0] alu_c;         // ALU 输出
    wire alu_zero;                    // ALU Zero 信号
    reg [4:0] alu_op;                 // ALU 操作码
    reg [1:0] alu_display_index;      // ALU 显示索引

    always @(posedge Clk_CPU or negedge rstn) begin
        if (!rstn)
            alu_display_index <= 0;
        else if (sw_i[12])
            alu_display_index <= alu_display_index + 1'b1;
    end

    always @(sw_i[0]) begin
        alu_op = (sw_i[2]) ? `ALUOp_add : `ALUOp_sub;
        alu_a = {{28{1'b0}}, sw_i[10:7]}; // 从 SW 提取 A
        alu_b = {{28{1'b0}}, sw_i[6:3]};  // 从 SW 提取 B
    end

    alu u_alu (
        .A(alu_a),
        .B(alu_b),
        .ALUOp(alu_op),
        .C(alu_c),
        .Zero(alu_zero)
    );

    always @(*) begin
        if (sw_i[12]) begin
            case (alu_display_index)
                2'b00: display_data = alu_a;
                2'b01: display_data = alu_b;
                2'b10: display_data = alu_c;
                2'b11: display_data = {31'b0, alu_zero};
            endcase
        end else begin
            display_data = 32'b0;
        end
    end

    seg7x16 u_seg7x16 (
        .clk(clk),
        .rstn(rstn),
        .i_data(display_data),
        .disp_mode(sw_i[0]),
        .o_seg(disp_seg_o),
        .o_sel(disp_an_o)
    );

endmodule
