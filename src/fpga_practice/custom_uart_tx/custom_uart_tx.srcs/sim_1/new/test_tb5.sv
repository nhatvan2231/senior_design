`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2023 05:44:41 PM
// Design Name: 
// Module Name: test_tb5
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


module test_tb5(

    );
    logic clk = 1;
    logic rstn;
    logic [7:0] bytes, temp;
    logic pause;
    logic [2:0] count;
    
    
    initial begin
        rstn <= 0;
        #20 rstn <= 1;
    end
    always #5 clk =~clk;
    
    main_test tb(   .clk(clk),
                    .rstn(rstn),
                    .nfsr_byte(bytes),
                    .temp(temp),
                    .out_o(out),
                    .o_pause(pause),
                    .cnt(count),
                    .tx_sig(sig),
                    .r(ready),
                    .t(transmit));
endmodule
