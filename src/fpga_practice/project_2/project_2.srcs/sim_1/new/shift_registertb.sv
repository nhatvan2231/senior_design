`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2023 10:12:09 PM
// Design Name: 
// Module Name: shift_registertb
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


module shift_registertb;
    logic clk =0;
    logic [3:0] led;
    
    shift_register hello(.clk(clk), .led(led));
    always #5 clk=~clk;
endmodule
