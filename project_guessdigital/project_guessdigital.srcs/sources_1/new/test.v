`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/10 15:28:15
// Design Name: 
// Module Name: test
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


//module test(input clk,input rstn,input[15:0]sw_i,output[15:0]led_o);

//reg ledstate;
//always@(*)
//    begin
//        if(sw_i[4:1] == 4'b1010) begin ledstate = 1'b1;end
//            else begin ledstate=1'b0; end
//        end
        
//assign led_o[15] =ledstate;

//endmodule

module test(
    input clk,
    input rstn,
    input [15:0] sw_i,
    output [15:0] led_o
    );

    parameter div_num=3;  // 仿真时，设为3，2^3 = 8分频；编程时，设为24，2^24 = 16*2^20
    reg [15:0] led_tmp;
    reg ledset_flag;      // 标志位
    wire clk_div2;        // 2分频
    wire clk_div29;

    /// clk_div29
    reg [31:0] clk_cnt;
    always @(posedge clk or negedge rstn) begin
        if (!rstn)
            clk_cnt <= 32'b0;
        else
            clk_cnt <= clk_cnt + 1'b1;
    end
    assign clk_div29 = clk_cnt[div_num]; // div_num分频

    /// led splash 跑马灯程序
    always@(posedge clk_div29 or negedge rstn)
    begin
        if (!rstn) begin
            ledset_flag = 1'b1;
            led_tmp = 16'b0000_0000_0000_0000;
        end
        else if ((ledset_flag == 1'b1) && (sw_i[4:1] == 4'b1010)) begin
            ledset_flag = 1'b0;
            led_tmp = 16'b1000_0000_0000_0000;
        end
        else if (sw_i[4:1] == 4'b1010) begin
            led_tmp = {led_tmp[14:0], led_tmp[15]};
        end
        else begin
            led_tmp = 16'b0000_0000_0000_0000;
            ledset_flag = 1'b1;
        end
    end
    assign led_o[15:0] = led_tmp;

endmodule



