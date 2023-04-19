`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2023 08:36:09 PM
// Design Name: 
// Module Name: reset
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


module simple_tx(
    input clk,
    input rstn,
    //input logic [7:0] SW,
    //output logic [7:0] LED,
    output tx_sig,
    output rstn_led
    //output logic [7:0] data_o,
    //output logic transmit_o,
    //output logic ready_o
    );
    
    logic [7:0] data;
    logic ready;
    logic transmit;
    logic l;
    int buffer;
    custom_uart_tx tx(  .clk(clk),
                        .rstn(rstn),
                        .data(data),
                        .transmit(transmit),
                        .tx_sig(tx_sig),
                        .ready(ready)
                        );
                        
    always_ff @(posedge clk) begin
        if (!rstn) begin
            l <= 0;
            transmit <= 0;
            data <= 8'hff;
        end
        else begin
            l <= 1;
            if (ready) begin
                transmit = 1;
                data <= data+1;

            end
            else begin
                transmit = 0;
            end
        end 
    end
    assign rstn_led = l;
    //assign data_o = data;
    //assign transmit_o = transmit;
    //assign ready_o = ready;
    //assign LED = SW;
    
    
endmodule
