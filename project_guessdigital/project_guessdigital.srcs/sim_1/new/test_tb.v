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

    // ������Ƶ�Ԫ (DUT) ��ʵ����
    test u_test(.clk(clk), .rstn(rstn), .sw_i(sw_i), .led_o(led_o));

    // ��ʼ�飬�������ó�ʼ�����͸�λ����
    initial begin
        counter = 0;
        clk = 1;
        rstn = 1;
        sw_i = 16'b0000_0000_0001_0100;
        foutput = $fopen("results.txt"); // ���ļ����ڼ�¼���
        #5;
        rstn = 0; // �ͷŸ�λ�ź�
        #20;
        rstn = 1; // �ָ���������״̬
    end

    // ʱ���ź�����
    always 
        begin
        #50 clk = ~clk; // ÿ�� 50 ��ʱ�䵥λ��תʱ���ź�
        if (clk == 1'b1) begin
            $fdisplay(foutput, "led_o:\t%b", led_o); // �� led_o ��ֵ��¼���ļ�
            $display("led_o:\t%b", led_o); // ��ʾ led_o ��ֵ
            $display("counter: %h", counter); // ��ʾ������ֵ
            counter = counter + 1; // ����������
            end
         else if (counter > 100) begin
                $fclose(foutput); // �ر��ļ�
                $stop; // ֹͣ����
            end
          else
            counter=counter;
        end
endmodule
