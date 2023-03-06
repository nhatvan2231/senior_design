`timescale 1ps / 10fs

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
    reg t_en = 1'b1;
    reg [31:0] t_nfsr;
    reg o;
    
    nfsr nfsr_t (
    .clk(t_clk),
    .en(t_en),
    .seed(t_seed),
    .nfsr(t_nfsr),
    .out(o)
    );
    
    always #1 t_clk <= ~t_clk;
    //initial begin
    //end
endmodule
