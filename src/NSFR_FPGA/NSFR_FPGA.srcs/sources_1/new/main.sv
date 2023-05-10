`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2023 09:16:37 PM
// Design Name: 
// Module Name: main
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


module main(
    input clk,
    input rstn,
    output tx_sig
    );
    
    //tx input/output
    logic transmit;
    logic ready;
    logic tx_sig;
    
    //nfsr input/output
    logic pause;
    logic nfsr_bit;
    
    logic [7:0] nfsr_byte, tmp_byte; // packing/storing nfsr outputs
    logic [2:0] byte_index;          // byte index
    logic buffer;                    // 1 clk cycle buffer

    typedef enum logic {        TX_SEND,
                                PACKGING
                             }  statetype;
    statetype                state;
    
    nfsr_method wrapper(    .clk(clk),
                            .rstn(rstn),
                            .pause(pause),
                            .o_bit(nfsr_bit));

    uart_tx tx(             .clk(clk),
                            .rstn(rstn),
                            .data(nfsr_byte),
                            .transmit(transmit),
                            .tx_sig(tx_sig),
                            .ready(ready)
                            );
    
    always_ff @(posedge clk) begin
        if (!rstn) begin
            pause <= 0;
            byte_index <= 0;
            buffer <= 0;
            tmp_byte <= 0;
            transmit <= 0;
            state <= PACKGING;
        end
        else begin
            if (!buffer) buffer <= 1;
            else begin
                case(state)
                    //transmit data
                    TX_SEND: begin
                        if(ready) begin
                            transmit = 1;
                            pause <= 0;
                            state <= PACKGING;
                        end
                    end
                    PACKGING: begin
                        if (transmit) transmit <= 0;
                        tmp_byte[byte_index] = nfsr_bit;
                        if (byte_index == 7) begin
                            pause <= 1; //pause nfsr
                            nfsr_byte = tmp_byte;
                            //state <= STORE;
                            state <= TX_SEND;

                        end
                        byte_index <= byte_index + 1; //next bit index
                    end
                    default: begin
                        state <= PACKGING;
                    end
                endcase 
            end
        end
    end                    
endmodule