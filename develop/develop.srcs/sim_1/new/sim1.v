`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2023 10:16:01 PM
// Design Name: 
// Module Name: sim1
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


module tb_ex1();
logic at,yt;
// instantiate device under test
ex1 dut(at, yt);
// apply inputs one at a time
initial begin
at = 0; #10;
at = 1; #10;
at = 0; #10;
at = 1; #10;
at = 0; #10;
at = 1; #10;
at = 0; #10;
at = 1; #10;
end
endmodule