`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2023 11:49:25 PM
// Design Name: 
// Module Name: tb_inverter
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


module tb_inverter;
    reg clkt = 0;
    logic yt;
    
    inverter uut(.clk(clkt),
                 .y(yt));
                 
    always #5 clkt=~clkt;
endmodule
