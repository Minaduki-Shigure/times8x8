`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/31 09:51:33
// Design Name: 
// Module Name: tb_times
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


module tb_times;
    reg [8:1] f0;
    reg [8:1] f1;
    wire [16:1] pro;
    times uut1(.factor0(f0),.factor1(f1),.product(pro));
    initial begin
        f0 = $random % 128;
        f1 = $random % 128;
        forever
        begin
            #200 f0 = $random % 128;
            f1 = $random % 128;
        end
    end
endmodule
