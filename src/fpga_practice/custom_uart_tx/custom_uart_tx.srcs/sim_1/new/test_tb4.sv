`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2023 02:01:38 PM
// Design Name: 
// Module Name: test_tb4
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


module test_tb4(

    );
    
    logic clk = 1;
    logic en;
    logic [31:0] data;
    logic pause = 0;
    
    
    always #5 clk =~clk;
    always #80 pause = ~pause;
    initial begin
        en = 0;
        #20 en = 1;
    end
    nfsr tb(.clk,.rstn(en),.pause(0),.nfsr_data(data),.iout(i),.oout(o));
endmodule
