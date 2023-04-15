module uart_rx
  #(parameter
    /*
     You can specify the following three parameters.
     1. DATA_WIDTH : width of data that is transmited by this module
     2. BAUD_RATE  : baud rate of output uart signal
     3. CLK_FREQ   : freqency of input clock signal
    */
    DATA_WIDTH = 8,
    BAUD_RATE  = 115200,
    CLK_FREQ   = 100_000_000,

    localparam
    LB_DATA_WIDTH    = $clog2(DATA_WIDTH),
    PULSE_WIDTH      = CLK_FREQ / BAUD_RATE,
    LB_PULSE_WIDTH   = $clog2(PULSE_WIDTH),
    HALF_PULSE_WIDTH = PULSE_WIDTH / 2)
   (input logic rx,
    input logic clk,
    input logic rstn,
    output logic [DATA_WIDTH-1:0] LED);


   //----------------------------------------------------------------
   // description about receive UART signal
   typedef enum logic [1:0] {STT_DATA,
                             STT_STOP,
                             STT_WAIT
                             } statetype;

   statetype                 state;

   logic [DATA_WIDTH-1:0]   data_tmp_r;
   logic [LB_DATA_WIDTH:0]  data_cnt;
   logic [LB_PULSE_WIDTH:0] clk_cnt;
   logic                    rx_done;

   always_ff @(posedge clk) begin
      if(!rstn) begin
         state      <= STT_WAIT;
         data_tmp_r <= 0;
         data_cnt   <= 0;
         clk_cnt    <= 0;
      end
      else begin

         //-----------------------------------------------------------------------------
         // 3-state FSM
         case(state)

           //-----------------------------------------------------------------------------
           // state      : STT_DATA
           // behavior   : deserialize and recieve data
           // next state : when all data have recieved -> STT_STOP
           STT_DATA: begin
              if(0 < clk_cnt) begin
                 clk_cnt <= clk_cnt - 1;
              end
              else begin
                 data_tmp_r <= {rx, data_tmp_r[DATA_WIDTH-1:1]};
                 clk_cnt    <= PULSE_WIDTH;

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
           // behavior   : watch stop bit
           // next state : STT_WAIT
           STT_STOP: begin
              if(0 < clk_cnt) begin
                 clk_cnt <= clk_cnt - 1;
              end
              else if(rx) begin
                 state <= STT_WAIT;
              end
           end

           //-----------------------------------------------------------------------------
           // state      : STT_WAIT
           // behavior   : watch start bit
           // next state : when start bit is observed -> STT_DATA
           STT_WAIT: begin
              if(rx == 0) begin
                 clk_cnt  <= PULSE_WIDTH + HALF_PULSE_WIDTH;
                 data_cnt <= 0;
                 state    <= STT_DATA;
              end
           end

           default: begin
              state <= STT_WAIT;
           end
         endcase
      end
   end

   assign rx_done = (state == STT_STOP) && (clk_cnt == 0);

   //-----------------------------------------------------------------------------
   // description about output signal

   always_ff @(posedge clk) begin
      if(!rstn) begin
         LED  <= 0;
      end
      else if(rx_done) begin
         LED  <= data_tmp_r;
      end
   end


endmodule