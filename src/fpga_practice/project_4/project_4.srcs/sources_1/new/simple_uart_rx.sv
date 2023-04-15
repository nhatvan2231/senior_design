`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2023 06:26:13 PM
// Design Name: 
// Module Name: simple_uart_rx
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


module simple_uart_rx(
    input clk,
    input rx,
    output o
    );
    
    logic o;
    logic clk_div;
    clk_divider (.clk(clk), .clk_div(clk_div));
    always_ff @(posedge clk_div) begin
        o <= rx;
    end
endmodule
