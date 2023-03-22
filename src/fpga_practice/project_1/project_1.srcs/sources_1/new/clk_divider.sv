`timescale 1ns / 1ps


module clk_divider(
    input clk,
    output clk_div
    );
    
    reg clk_div;
    integer  counter = 0; //1hz
    integer  counter_rst = 49999999;
    
    always_ff@(posedge clk) begin
        if (counter == counter_rst) begin
            counter = 0;
            clk_div <= 1'b1;
        end
        else begin
            counter <= counter + 1;
        end
    end
endmodule
