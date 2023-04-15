//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2023 02:10:20 PM
// Design Name: 
// Module Name: uart_if
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

interface uart_if
  #(parameter
    DATA_WIDTH = 8);

   logic                  sig;
   logic [DATA_WIDTH-1:0] data;
   logic                  valid;
   logic                  ready;

   modport tx(output sig,
              input  data,
              input  valid,
              output ready);

   modport rx(input  sig,
              output data,
              output valid,
              input  ready);

endinterface