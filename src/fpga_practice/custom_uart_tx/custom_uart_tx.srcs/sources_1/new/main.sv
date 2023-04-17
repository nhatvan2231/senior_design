//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nate Van 
// 
// Create Date: 04/05/2023 10:50:26 PM
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
    input clk, rstn,
    output tx_sig
    );
    
    logic rstn;
    logic tx_sig;
    logic [7:0] nfsr_byte;
    logic transmit;
    logic ready;
    
    logic nfsr_en;
    logic pause;
    logic nfsr_out;
    
    logic [2:0] data_cnt;

    
    typedef enum logic {S_DATA,
                        N_DATA
                        } statetype;
    
    statetype                 state;
    
    custom_uart_tx tx(  .clk(clk),
                        .rstn(rstn),
                        .data(nfsr_byte),
                        .transmit(transmit),
                        .tx_sig(tx_sig),
                        .ready(ready)
                        );
    
    nfsr method(        .clk(clk),
                        .en(nfsr_en),
                        .seed(seed),
                        .pause(pause),
                        .out(nfsr_out),
                        .complete(nfsr_complete)
                        );
                        

    always_ff@(posedge clk) begin
    if (!rstn) begin
        pause <= 0;
        transmit <= 0;
        nfsr_byte <= 0;
        data_cnt <= 0;
        nfsr_en <= 0;
        state <= N_DATA;
    end
    else begin
        if (!nfsr_en) nfsr_en <= 1;
        case (state) 
            S_DATA: begin
                if (!ready) transmit <= 0;
                else begin
                    transmit <= 1;
                    pause <= 0;
                    state <= N_DATA;
                end
            end
            N_DATA: begin
                //nfsr until fill a byte
                if (data_cnt < 8) begin
                    nfsr_byte[data_cnt] <= nfsr_out;
                    data_cnt <= data_cnt + 1;
                end
                // pause nfsr
                else begin
                    pause <= 1;
                    data_cnt <= 0;
                    state <= S_DATA;
                end
            end
            default: begin
                state <= N_DATA;
            end
        endcase
    end
    end
endmodule
