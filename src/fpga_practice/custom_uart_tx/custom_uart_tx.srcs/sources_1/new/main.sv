`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2023 10:50:26 PM
// Design Name: 
// Module Name: main
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


module main(
    input clk, rstn, transmit, 
    output tx_sig
    );
    
    logic [7:0] nfsr_byte;
    custom_uart_tx tx(  .clk(clk),
                        .rstn(rstn),
                        .data(nfsr_byte),
                        .transmit(transmit),
                        .tx_sig(tx_sig),
                        .ready(ready)
                        );
    
    nfsr alr(           .clk(clk),
                        .en(en),
                        .seed(seed),
                        .pause(pause),
                        .out(out)
                        );
endmodule
