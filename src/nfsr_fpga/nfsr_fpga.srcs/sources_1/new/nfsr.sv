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
    input pause,
    input complete,
    input [31:0] seed,
    output [31:0] nfsr_data,
    output logic nfsr_status,
    output logic out);
    
    
    logic        b;
    logic [31:0] nfsr;
    logic pause;
    logic en;
    logic complete;
    logic status;
    
    /*
    always_ff @(posedge en) begin
        nfsr <= seed;
        start <= 1;
    end
    */
    typedef enum logic {NFSR_I,
                    NFSR_R
                    } statetype;
    statetype state;

    always_ff @(posedge clk) begin
        case (state) 
            NFSR_I: begin
                if (en) begin
                    nfsr <= seed;
                    state <= NFSR_R;
                    status <= 1;
                end
            end
            NFSR_R: begin
                if (complete) begin
                    state <= NFSR_I;
                    status <= 0;
                end
                else if (!pause) begin
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
            default: begin     
                state <= NFSR_I;
            end
        endcase  
    end
    assign nfsr_data = nfsr;
    assign nfsr_status = status;
    assign out = b;
endmodule
