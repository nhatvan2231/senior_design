`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2023 10:50:35 PM
// Design Name: 
// Module Name: custom_uart_tx
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


module custom_uart_tx(
    input clk, rstn, data, transmit,
    output tx_sig, ready
    );
    
    localparam DATA_WIDTH = 8;
    localparam BAUD_RATE  = 115200;
    localparam CLK_FREQ   = 100_000_000;
    
    logic transmit;
    logic clk, rstn;
    logic [DATA_WIDTH-1:0] data, data_r;
    logic tx_sig;
    logic sig = 1;
    logic ready;
    logic [2:0] data_cnt;
    logic tx_done;
    int clk_cnt;
    int cycle_bit = CLK_FREQ/BAUD_RATE;
    
    typedef enum logic [1:0] {STT_DATA,
                             STT_STOP,
                             STT_IDLE
                             } statetype;
    
    statetype                 state;
    
    always_ff@(posedge clk or negedge rstn) begin
        if(!rstn) begin
            state <= STT_IDLE;
            sig <= 1;
            tx_done <= 1;
            data_r <= 0;
            clk_cnt <= 0;
            data_cnt <= 0;
        end
        else begin
            case (state)
                STT_IDLE:   begin
                    if (0 < clk_cnt) begin
                        clk_cnt <= clk_cnt - 1;
                    end
                    else if (!tx_done) begin
                        tx_done <= 1;
                    end
                    else if (transmit) begin
                        sig <= 0;
                        tx_done <= 0;
                        data_r <= data;
                        clk_cnt <= cycle_bit;
                        state <= STT_DATA;
                        data_cnt <= 0;
                    end
                end
                STT_DATA:   begin
                    if (0 < clk_cnt) begin
                        clk_cnt <= clk_cnt - 1;
                    end
                    else begin
                        sig <= (data_r>>data_cnt) & 1'b1;
                        clk_cnt <= cycle_bit;
                        if (data_cnt == 7) begin
                            state <= STT_STOP;                            
                        end
                        else begin
                            data_cnt <= data_cnt + 1;
                        end
                    end
                end
                STT_STOP:   begin
                    if (0 < clk_cnt) begin
                        clk_cnt <= clk_cnt - 1;
                    end
                    else begin
                        clk_cnt <= cycle_bit;
                        state <= STT_IDLE;
                        tx_done <= 1;
                        sig <= 1'b1;

                    end
                end
                default: begin
                        tx_done <= 1;
                        state <= STT_IDLE;

                end
            endcase 
        end
    end
    assign tx_sig = sig;
    assign ready = tx_done;
    
endmodule

