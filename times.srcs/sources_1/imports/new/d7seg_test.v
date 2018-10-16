`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/30 15:51:22
// Design Name: 
// Module Name: d7seg_test
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


module d7seg_test(
    input clk,
    input [3:0] hex,
    input dp,
    output [7:0] sseg,
    output [3:0] an
    );
    d7seg d7(.clk(clk),
        .reset(1'b0),
        .hex3(hex + 3),
        .hex2(hex + 2),
        .hex1(hex + 1),
        .hex0(hex),
        .dp_in(dp ? 4'b1101 : 4'b1011),
        .sseg(sseg),
        .an(an));
endmodule
