`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2023 06:53:11 PM
// Design Name: 
// Module Name: nfsr_tb
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


module nfsr_tb();
    reg t_clk = 1'b0;
    reg [31:0] t_seed = 32'hace1;
    reg [31:0] t_nfsr;
    reg o;
    
    nfsr nfsr_t (
    .clk(t_clk),
    .en(1'b1),
    .seed(t_seed),
    .nfsr(t_nfsr),
    .out(o)
    );
    
    always #1 t_clk <= ~t_clk;
    initial begin
    //repeat (10) @(posedge t_clk);
    end
endmodule
