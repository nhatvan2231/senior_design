`timescale 1ps / 10fs
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2023 07:51:36 AM
// Design Name: 
// Module Name: nfsr
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


module nfsr(
    input clk,
    input en,
    input [31:0] seed,
    input pause,
    output logic out
    );
    
    
    //reg [31:0] nfsr;
    logic        b;
    logic [31:0] nfsr;

    always_ff @(posedge en) begin
        nfsr <= seed;
    end
    
    always_ff @(posedge clk) begin
        if (!pause) begin
            b = ((nfsr>>0)
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
                   
              nfsr = (nfsr >> 1) | (b << 31);
        end       
    end
    
    assign out = b;
endmodule
