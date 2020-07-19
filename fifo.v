`include "sw.vh"

module fifo(in, we, full, out, re, empty, clk, rst);
  input clk, rst, we, re;
  input [`PKTW:0] in;
  output [`PKTW:0] out;
  output empty, full;

  reg [`FIFOLB:0] head, tail;
  reg [`PKTW:0] buffer [0:16]; // one extra entry for easy implementation

  wire [`FIFOLB:0] next_head;
  wire [`FIFOLB:0] next_tail;

  assign out = buffer[head];
  assign next_head = (head + 1) % 17;
  assign next_tail = (tail + 1) % 17;
  assign empty = (head == tail);
  assign full = (next_tail == head);

  integer i;
  always @(posedge clk) begin
    if (rst) begin
      head <= 0;
      tail <= 0;
      for (i = 0; i <= 16; i++) begin
        buffer[i] = 0;
      end
    end else begin
      if (we & !full) begin
        buffer[tail] <= in;
        tail <= next_tail;
      end

      if (re & !empty) begin
        head <= next_head;
      end
    end
  end
endmodule

