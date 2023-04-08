`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2023 11:54:08 PM
// Design Name: 
// Module Name: test_tb
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


module test_tb();
    
    logic clk = 1;
    logic rstn;
    logic [7:0] data = 0;    
    logic tx_sig;
    logic ready;
    logic transmit;
    
    always #5 clk <= ~clk;
    
    always_ff @(posedge clk) begin
        if (!ready) begin
            transmit <= 0;
        end
        else begin
            transmit <=1;
            data <= 8'b10001000;
        end
    end
    custom_uart_tx utt(.clk(clk), .rstn(), .data(data),.transmit(transmit),
    .tx_sig(tx_sig), .ready(ready)
    );
    
    
endmodule
