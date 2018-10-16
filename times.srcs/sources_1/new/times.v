`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/31 09:47:39
// Design Name: 
// Module Name: times
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


module times(
    input clk,
    output [7:0] sseg,
    output [3:0] an,
    input [8:1] factor0,
    input [8:1] factor1,
    output reg [16:1] product
    );
    integer i;
    always @ *
    begin
        i = 1;
        product = 0;
        while (i <= 8)
        begin
            if (factor1[i])
                product = product + (factor0 << (i - 1));
            i = i + 1;
        end
    end
    wire integer hex3;
    wire integer hex2;
    wire integer hex1;
    wire integer hex0;
    wire integer temp3;
    wire integer temp2;
    wire integer temp1;
    assign temp3 = product / 8'h10;
    assign hex3 = product - temp3 * 8'h10;
    assign temp2 = temp3 / 8'h10;
    assign hex2 = temp3 - temp2 * 8'h10;
    assign temp1 = temp2 / 8'h10;
    assign hex1 = temp2 - temp1 * 8'h10;
    assign hex0 = temp1;
    d7seg d7(.clk(clk),
        .reset(1'b0),
        .hex3(hex0),//顺序乱了，这样偷懒地改一下
        .hex2(hex1),
        .hex1(hex2),
        .hex0(hex3),
        .dp_in(4'b1111),
        .sseg(sseg),
        .an(an));
endmodule
