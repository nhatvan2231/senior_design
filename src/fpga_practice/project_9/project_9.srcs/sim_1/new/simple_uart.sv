`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2023 10:18:19 PM
// Design Name: 
// Module Name: simple_uart
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


module simple_uart();
    logic clk = 0;
    logic nrst = 0;
    logic UART_RXD, UART_TXD;
    logic istx = 1;
    //logic [7:0] rx_byte;
    logic [7:0] tx_byte = 8'b10101010;
    always #10 clk=~clk;
    
    
    uart #(
    .baud_rate(9600) // default is 9600
    )
    uart0(
    .clk(clk), // The master clock for this module
    .rst(~nrst), // Synchronous reset
    .rx(UART_RXD), // Incoming serial line
    .tx(UART_TXD), // Outgoing serial line
    .transmit(istx), // Signal to transmit
    .tx_byte(), // Byte to transmit
    .received(), // Indicated that a byte has been received
    .rx_byte(), // Byte received
    .is_receiving(), // Low when receive line is idle
    .is_transmitting(),// Low when transmit line is idle
    .recv_error() // Indicates error in receiving packet.
    );
    
endmodule
