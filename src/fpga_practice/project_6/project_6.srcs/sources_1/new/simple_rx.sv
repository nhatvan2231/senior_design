`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 10:16:26 PM
// Design Name: 
// Module Name: simple_rx
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


module simple_rx(
    input clk, rst, 
    output LED
    );
    
   logic [7:0] LED;
   localparam DATA_WIDTH = 8;
   localparam BAUD_RATE  = 115200;
   localparam CLK_FREQ   = 100_000_000;
   
   uart_if #(DATA_WIDTH) rxif();
   
   uart_rx #(DATA_WIDTH, BAUD_RATE, CLK_FREQ) dut(.rxif(rxif),
                                                  .clk(clk),
                                                  .rstn(rstn));
    
    assign LED[0] = rxif.data[0];
   
endmodule
