//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2023 08:36:09 PM
// Design Name: 
// Module Name: reset
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


module reset(
    input clk,
    input rstn,
    output LED,
    output tx_sig
    );
    
    logic led;

    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            led <= 0;
        end
        else begin
            led <= 1;
        end 
    end
    assign LED = led;
    
endmodule
