`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2023 09:16:37 PM
// Design Name: 
// Module Name: nfsr_method
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


module nfsr_method(
    input clk,
    input rstn,
    input pause,
    output o_bit
    );
    
    logic pause;
    logic o_bit;

    logic [31:0] seed = 32'hace1;
    logic [31:0] nfsr;
    logic ibit, obit;
    
    always_ff @(posedge clk) begin
        // low trigger reset
        if(!rstn) begin
            nfsr <= seed;
        end
        else begin
            if (!pause) begin                                     // pause if needed
                    obit = nfsr & 1'b1;                           // output bit
                    ibit = ((nfsr>>0)                             // Primitive Polynomial GF(32)
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
                     
                     nfsr = (nfsr >> 1) | (ibit << 31);            // shift left once and insert calculted bit at most signification bit position

             end
         end  
    end
    // assign to port
    assign o_bit = obit;
endmodule
