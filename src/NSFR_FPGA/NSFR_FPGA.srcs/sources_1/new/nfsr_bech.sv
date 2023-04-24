`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2023 10:09:56 PM
// Design Name: 
// Module Name: nfsr_bech
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


module nfsr_bech(
    input clk,
    input rstn,
    output LED
    );
    
    logic pause;
    logic [31:0] seed = 32'hace1;
    logic [31:0] nfsr;
    logic ibit, obit;
    logic [15:0] LED;
    int clk_count;
    int nfsr_count;
    
    always_ff @(posedge clk) begin
        clk_count <= clk_count + 1;
        if(!rstn) begin
            nfsr <= seed;
            clk_count <= 0;
            nfsr_count <= 0;
            pause <= 0;
        end
        else if (clk_count == 50000) pause <= 1;
        else begin
            if (!pause) begin
                    obit = nfsr & 1'b1;
                    ibit = ((nfsr>>0)
                            ^(nfsr>>2)
                            ^(nfsr>>6)
                            ^(nfsr>>7)
                            ^(nfsr>>12)
                            ^(nfsr>>17)
                            ^(nfsr>>20)
                            ^(nfsr>>27)
                            ^(nfsr>>30)
                            ^((nfsr>>3)&(nfsr>>9))
                            ^((nfsr>>12)&(nfsr>>15))
                            ^((nfsr>>4)&(nfsr>>5)&(nfsr>>16))
                            ) & 1'b1;
                           
                     nfsr = (nfsr >> 1) | (ibit << 31);
                     nfsr_count <= nfsr_count + 1;
             end
         end  
    end
    
    assign LED = nfsr_count[15:0];
endmodule
