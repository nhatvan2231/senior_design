`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2023 10:05:32 PM
// Design Name: 
// Module Name: shift_register
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


module shift_register(input clk,
                      output led);
    logic clk;
    logic [3:0] led = 4'b0001;
    logic clk_div;
    
    clk_divider uut(.clk(clk), .clk_div(clk_div));
    
    always_ff@(posedge clk_div) begin
        led <= (led<<1);
        
    end


endmodule
