`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/10 15:42:57
// Design Name: 
// Module Name: test_tb
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




module test_tb();

    reg clk, rstn;
    reg [15:0] sw_i;
    wire [15:0] led_o;
    integer foutput, counter;

    // 待测设计单元 (DUT) 的实例化
    test u_test(.clk(clk), .rstn(rstn), .sw_i(sw_i), .led_o(led_o));

    // 初始块，用于设置初始条件和复位序列
    initial begin
        counter = 0;
        clk = 1;
        rstn = 1;
        sw_i = 16'b0000_0000_0001_0100;
        foutput = $fopen("results.txt"); // 打开文件用于记录输出
        #5;
        rstn = 0; // 释放复位信号
        #20;
        rstn = 1; // 恢复正常工作状态
    end

    // 时钟信号生成
    always 
        begin
        #50 clk = ~clk; // 每隔 50 个时间单位翻转时钟信号
        if (clk == 1'b1) begin
            $fdisplay(foutput, "led_o:\t%b", led_o); // 将 led_o 的值记录到文件
            $display("led_o:\t%b", led_o); // 显示 led_o 的值
            $display("counter: %h", counter); // 显示计数器值
            counter = counter + 1; // 计数器递增
            end
         else if (counter > 100) begin
                $fclose(foutput); // 关闭文件
                $stop; // 停止仿真
            end
          else
            counter=counter;
        end
endmodule
