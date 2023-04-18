//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nate Van
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
    input rstn,
    input pause,
    //output nfsr_data,
    //output iout,
    output oout
    );
    
    
    
    logic en; 
    logic pause;
    logic [31:0] nfsr_data;
    logic [31:0] seed = 32'hace1;
    
    logic [31:0] nfsr;
    //logic out;
    logic iout, oout;

    
    logic ibit, obit;
    logic [31:0] nfsr;


    always_ff @(posedge clk) begin
        if(!rstn) begin
            nfsr <= seed;
        end
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
             end
         end  
    end
    //assign nfsr_data = nfsr;
    assign oout = obit;
    //assign iout = ibit;
endmodule
