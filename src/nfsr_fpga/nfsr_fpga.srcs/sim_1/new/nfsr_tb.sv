`timescale 1ps / 10fs

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2023 06:53:11 PM
// Design Name: 
// Module Name: nfsr_tb
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


module nfsr_tb();
    logic t_clk = 1'b0;
    logic [31:0] t_seed;
    logic t_en;
    logic o;
    logic pause = 0;
    logic status;
    logic [31:0] nfsr_data;
    
    initial begin
        t_seed <= 32'h0000ace1;
        t_en <= 0;
        #10 t_en <= 1;
    end
    always #5 t_clk <= ~t_clk;

    nfsr nfsr_t (
    .clk(t_clk),
    .en(t_en),
    .pause(pause),
    .complete(),
    .seed(t_seed),
    .nfsr_status(status),
    .out(o),
    .nfsr_data(nfsr_data)
    );
   
    //initial begin
    //end
endmodule
