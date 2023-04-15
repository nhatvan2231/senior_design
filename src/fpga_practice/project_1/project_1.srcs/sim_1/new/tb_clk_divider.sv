`timescale 1ns / 1ps


module tb_clk_divider;
    
    reg clkt = 0;
    logic clkt_div;
    
    clk_divider uut(.clk(clkt),
                    .clk_div(clkt_div));
                    
    always #5 clkt = ~clkt;
endmodule
