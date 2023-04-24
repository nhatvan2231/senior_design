`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2023 09:16:37 PM
// Design Name: 
// Module Name: uart_tx
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


module uart_tx(
    input clk,
    input rstn,
    input data,
    input transmit,
    output tx_sig,
    output ready
    );
    
        localparam DATA_WIDTH = 8; // typical uart data length
    localparam BAUD_RATE  = 115200; // buad rate
    localparam CLK_FREQ   = 100_000_000; // fpga clk frequency
    
    logic clk, rstn;
    logic transmit; // start transmitting
    logic [DATA_WIDTH-1:0] data; // transmiting data
    logic tx_sig; // transmitting signal
    logic ready; // ready to transmit
    
    logic [DATA_WIDTH-1:0] data_r; // transmiting data
    //logic sig = 1; // serialize data to signal
    logic sig;
    logic [2:0] data_cnt; // data index
    logic tx_done; // transmitting finish
    int clk_cnt; // clk counter for cycle per bit
    int cycle_bit = CLK_FREQ/BAUD_RATE; // clk cycle per bit
    
    // fsm start, data, stop signal
    typedef enum logic [1:0] {STT_DATA,
                             STT_STOP,
                             STT_IDLE
                             } statetype;
    
    statetype                 state;
    
    always_ff@(posedge clk) begin
        // low trigger reset
        if(!rstn) begin
            state <= STT_IDLE;
            sig <= 1;
            tx_done <= 1;
            data_r <= 0;
            clk_cnt <= 0;
            data_cnt <= 0;
        end
        else begin
            // transmit signal
            case (state)
                // waiting for in coming data to transmit
                // construct start bit 
                STT_IDLE:   begin
                    // clk cycle count down if any
                    if (0 < clk_cnt) begin
                        clk_cnt <= clk_cnt - 1;
                    end
                    // signal 1 at idle
                    else if (!sig) sig<=1;
                    // ready to transmit
                    else if (!tx_done) tx_done <= 1;
                    // start transmiting
                    else if (transmit) begin
                        sig <= 0; // start bit
                        tx_done <= 0;
                        data_r <= data;
                        clk_cnt <= cycle_bit;
                        state <= STT_DATA;
                        data_cnt <= 0;
                    end
                end
                // serialize data
                STT_DATA:   begin
                    // clk cycle count down
                    if (0 < clk_cnt) begin
                        clk_cnt <= clk_cnt - 1;
                    end
                    else begin
                        sig <= (data_r>>data_cnt) & 1'b1; // data at index data_cnt to signal
                        clk_cnt <= cycle_bit;
                        if (data_cnt == DATA_WIDTH-1) begin
                            state <= STT_STOP;                            
                        end
                        else begin
                            data_cnt <= data_cnt + 1;
                        end
                    end
                end
                // stop bit
                STT_STOP:   begin
                    // clk cycle count down            
                    if (0 < clk_cnt) begin
                        clk_cnt <= clk_cnt - 1;
                    end
                    // stop bit
                    else begin
                        clk_cnt <= cycle_bit;
                        state <= STT_IDLE;
                        sig <= 1;

                    end
                end
                default: begin
                        state <= STT_IDLE;
                end
            endcase 
        end
    end
    
    // assign to port
    assign tx_sig = sig; 
    assign ready = tx_done;
    
endmodule

