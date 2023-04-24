`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2023 12:40:44 PM
// Design Name: 
// Module Name: nfsr_test
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


module main_test(
    input clk,
    input rstn,
    //output nfsr_byte,
    //output temp,
    //output out_o,
    //output o_pause,
    //output cnt,
    //output r,
    //output t,
    output tx_sig

    );
    
    //tx input/output
    logic transmit;
    logic ready;
    logic tx_sig;
    
    logic [7:0] nfsr_byte, temp;
    logic out_o;
    logic [2:0] cnt;
    
    logic pause;
    logic [7:0] tmp, bytes;
    logic [2:0] count;
    logic out;
    logic buffer;
                                                                   
    typedef enum logic [1:0] {  TX_SEND,
                                PACKGING,
                                TRANSFER
                        } statetype;

    statetype                 state;
    
    //nfsr method(.clk(clk),.en(en),.pause(pause),.nfsr_data(nfsr_data),.oout(out));
    //nfsr method(.clk(clk),.rstn(rstn),.pause(pause),.nfsr_data(nfsr_data),.oout(out));
    nfsr_method method(.clk(clk),.rstn(rstn),.pause(pause),.oout(out));

    custom_uart_tx tx(  .clk(clk),
                        .rstn(rstn),
                        .data(bytes),
                        .transmit(transmit),
                        .tx_sig(tx_sig),
                        .ready(ready)
                        );
                        
    always_ff @(posedge clk) begin
        if (!rstn) begin
            pause <= 0;
            count <= 0;
            buffer <= 0;
            tmp <= 0;
            transmit <= 0;
            //bytes <= 0;
            state <= PACKGING;
        end
        else begin
            if (!buffer) buffer <= 1;
            else begin
                case(state)
                    TX_SEND: begin
                        if(ready) begin
                            transmit = 1;
                            pause <= 0;
                            state <= PACKGING;
                        end
                    end
                    TRANSFER: begin
                        bytes = tmp;
                        //pause <= 0;
                        state <= TX_SEND;
                    end
                    PACKGING: begin
                        if (transmit) transmit <= 0;
                        tmp[count] = out;
                        if (count == 7) begin
                            pause <= 1;
                            state <= TRANSFER;
                        end
                        count <= count +1'b1;
                    end
                    default: begin
                        state <= PACKGING;
                    end
                endcase 
            end
        end
    end
    
    //assign nfsr_byte = bytes;
    //assign temp = tmp;
    //assign out_o = out;
    //assign o_pause = pause;
    //assign cnt = count;
    //assign t = transmit;
    //assign r = ready;
endmodule
