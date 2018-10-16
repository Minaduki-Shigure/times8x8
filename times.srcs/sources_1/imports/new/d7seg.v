`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/01/30 15:35:52
// Design Name: 
// Module Name: d7seg
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


module d7seg(
    input clk,
    input reset,
    input [3:0] hex3,
    input [3:0] hex2,
    input [3:0] hex1,
    input [3:0] hex0,
    input [3:0] dp_in,
    output reg [7:0] sseg,
    output reg [3:0] an
    );
    localparam N = 19;
    reg [N-1:0] regN;
    always @ (posedge clk, posedge reset)
    begin
        if (reset)
            regN <= 0;
        else
            regN = regN + 1;
    end
    always @ *
    begin
        case (regN[N-1:N-2])
            2'b00: an = 4'b1110;
            2'b01: an = 4'b1101;
            2'b10: an = 4'b1011;
            default: an = 4'b0111;
        endcase
    end
    reg [3:0] hex_in;
    reg dp;
    
    always @ *
    begin
        case (regN[N-1:N-2])
            2'b00: begin hex_in = hex0; dp = dp_in[0]; end
            2'b01: begin hex_in = hex1; dp = dp_in[1]; end
            2'b10: begin hex_in = hex2; dp = dp_in[2]; end
            default: begin hex_in = hex3; dp = dp_in[3]; end
        endcase
    end
    always @ *
    begin
        case (hex_in)
            4'h0: sseg[6:0] = 7'b1000000;
            4'h1: sseg[6:0] = 7'b1111001;
            4'h2: sseg[6:0] = 7'b0100100;
            4'h3: sseg[6:0] = 7'b0110000;
            4'h4: sseg[6:0] = 7'b0011001;
            4'h5: sseg[6:0] = 7'b0010010;
            4'h6: sseg[6:0] = 7'b0000010;
            4'h7: sseg[6:0] = 7'b1111000;
            4'h8: sseg[6:0] = 7'b0000000;
            4'h9: sseg[6:0] = 7'b0011000;
            4'ha: sseg[6:0] = 7'b0001000;
            4'hb: sseg[6:0] = 7'b0000011;
            4'hc: sseg[6:0] = 7'b1000110;
            4'hd: sseg[6:0] = 7'b0100001;
            4'he: sseg[6:0] = 7'b0000110;
            default: sseg[6:0] = 7'b0001110;
        endcase
        sseg[7] = dp;
    end
endmodule
