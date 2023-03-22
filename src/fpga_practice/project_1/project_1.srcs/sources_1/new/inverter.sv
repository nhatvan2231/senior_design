`timescale 1ns / 1ps

module inverter(
    input clk,
    output y
    );
    
    reg y = 1'b0;
    
    always_ff@(posedge clk)
        y = ~y;
    
    
endmodule
