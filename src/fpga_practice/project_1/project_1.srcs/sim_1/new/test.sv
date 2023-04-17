`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2023 02:37:21 PM
// Design Name: 
// Module Name: test
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


module test(
);

logic clk = 0;
logic tx;
logic rstn = 0;
logic [7:0] data;

simple_tx tb(.clk(clk),
            .rstn(rstn),
            .SW(SW),
            .LED(LED),
            .tx_sig(tx),
            .rstn_led(le),
            .data_o(data),
            .ready_o(ready),
            .transmit_o(transmit));

always #5 clk = ~clk;

initial begin
    #20 rstn <= 1;
end
endmodule
