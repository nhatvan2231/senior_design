`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 03:29:16 PM
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(
    input clk,
    output clk_div
    );
    
    logic clk_div = 0;
    integer  counter = 0; //1hz
    integer  counter_rst = 49999999;
    
    always_ff@(posedge clk) begin
        if (counter == counter_rst) begin
            counter <= 0;
            clk_div <= ~clk_div;
        end
        else begin
            counter <= counter + 1;
        end
    end
endmodule
