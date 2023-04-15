`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2023 06:17:17 PM
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
    input clk, rx_serial,
    output data
    );
    logic [7:0] data;
    logic [7:0] temp;
    
    uart_rx 
  (
    .i_Clock(clk),
   .i_Rx_Serial(rx_serial),
   .o_Rx_DV(),
   .o_Rx_Byte(temp)
   );
   
   logic set = 1'b0;
   always_comb  begin
    if (set == 1'b0) begin
        data <= temp;
        set <= 1'b1;
    end
    end
endmodule
