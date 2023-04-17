`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2023 11:14:30 PM
// Design Name: 
// Module Name: test_tb2
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


module test_tb2(

    );
    
    logic clk = 1;
    logic sig;
    logic en = 1;
    logic seed = 32'hace1;
    logic pause = 0;
    logic out;
    always #5 clk <= ~clk;
    //initial #20 en <= 1;
    main utt(.clk(clk), .rstn(), .tx_sig(sig));
    //nfsr a(.clk(clk), .en(en), .seed(seed), .pause(pause), .out(out));
endmodule
