`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2023 01:03:51 PM
// Design Name: 
// Module Name: test_tb3
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


module test_tb3(
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

    
    always #5 clk <= ~clk;
    nfsr_test tb(.clk(clk),.rstn(rstn),.nfsr_byte(bytes), .temp(temp),.out_o(out),.o_pause(pause),.cnt(count));
    

endmodule
