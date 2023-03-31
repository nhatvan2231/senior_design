`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 10:59:59 PM
// Design Name: 
// Module Name: simple_tx
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


module simple_tx(
    input clk, rst,
    output tx_sig
    );
   localparam DATA_WIDTH = 8;
   localparam BAUD_RATE  = 115200;
   localparam CLK_FREQ   = 100_000_000;
   
   localparam PULSE_WIDTH= CLK_FREQ / BAUD_RATE;
   localparam count_max = $clog2(PULSE_WIDTH);
   localparam index = $clog2(DATA_WIDTH);
   
   logic [count_max:0] clk_cnt;
   logic [DATA_WIDTH-1:0] data;
   
   typedef enum logic [1:0] {STT_DATA,
                             STT_STOP,
                             STT_WAIT
                             } statetype;
   statetype                 state;
   
   always_ff @(posedge clk or negedge rst) begin
    if (!rst) begin
        //do something
    end
    else begin
        //start bit
        case(state)
           //-----------------------------------------------------------------------------
           // state      : STT_DATA
           // behavior   : serialize and transmit data
           // next state : when all data have transmited -> STT_STOP
           STT_DATA: begin
              if(0 < clk_cnt) begin
                 clk_cnt <= clk_cnt - 1;
              end
              else begin
                 sig_r   <= data[data_cnt];
                 clk_cnt <= PULSE_WIDTH;

                 if(data_cnt == DATA_WIDTH - 1) begin
                    state <= STT_STOP;
                 end
                 else begin
                    data_cnt <= data_cnt + 1;
                 end
              end
           end

           //-----------------------------------------------------------------------------
           // state      : STT_STOP
           // behavior   : assert stop bit
           // next state : STT_WAIT
           STT_STOP: begin
              if(0 < clk_cnt) begin
                 clk_cnt <= clk_cnt - 1;
              end
              else begin
                 state   <= STT_WAIT;
                 sig_r   <= 1;
                 clk_cnt <= PULSE_WIDTH + HALF_PULSE_WIDTH;
              end
           end

           //-----------------------------------------------------------------------------
           // state      : STT_WAIT
           // behavior   : watch valid signal, and assert start bit when valid signal assert
           // next state : when valid signal assert -> STT_STAT
           STT_WAIT: begin
              if(0 < clk_cnt) begin
                 clk_cnt <= clk_cnt - 1;
              end
              else if(!ready_r) begin
                 ready_r <= 1;
              end
              else if(txif.valid) begin
                 state    <= STT_DATA;
                 sig_r    <= 0;
                 data_r   <= txif.data;
                 ready_r  <= 0;
                 data_cnt <= 0;
                 clk_cnt  <= PULSE_WIDTH;
              end
           end

           default: begin
              state <= STT_WAIT;
           end
         endcase
     end
end
endmodule
