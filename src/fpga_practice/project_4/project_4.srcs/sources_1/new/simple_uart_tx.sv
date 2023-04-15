`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2023 10:49:04 PM
// Design Name: 
// Module Name: simple_uart_tx
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


module simple_uart_tx(
    input clk, rst, tx,
    output active, serial, done
    );
    
    logic [7:0] data = 8'b11111111;
    logic active;
    logic serial;
    logic done;
    
    u_tx (
   .i_Rst_L(rst),
   .i_Clock(clk),
   .i_TX_DV(tx),
   .i_TX_Byte(data),
   .o_TX_Active(active),
   .o_TX_Serial(serial),
   .o_TX_Done(done)
   );
endmodule
