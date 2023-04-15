
module uart
  #(parameter
    /*
     You can specify the following three parameters.
     1. DATA_WIDTH : width of data that is transmited by this module
     2. BAUD_RATE  : baud rate of output uart signal
     3. CLK_FREQ   : freqency of input clock signal
    */
    DATA_WIDTH = 8,
    BAUD_RATE  = 115200,
    CLK_FREQ   = 100_000_000)
   (uart_if.rx   rxif,
    uart_if.tx   txif,
    input logic rx_sig,
    input logic  clk,
    input logic  rstn,
    output logic tx_sig);
    
    always_ff @(posedge clk) begin
        rxif.sig <= rx_sig;
        tx_sig <= txif.sig;
    end
   uart_tx #(DATA_WIDTH, BAUD_RATE, CLK_FREQ)
   uart_tx_inst(.rxif(rxif),
                .clk(clk),
                .rstn(rstn));

   uart_rx #(DATA_WIDTH, BAUD_RATE, CLK_FREQ)
   uart_rx_inst(.txif(txif),
                .clk(clk),
                .rstn(rstn));
endmodule