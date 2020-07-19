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

// module fifotest;
// 	reg [7:0] in;
// 	wire [7:0] out;
// 	reg we, re, clk, rst;
// 	always #5 clk = ~clk;
// 	fifo fifo(in, we, full, out, re, empty, clk, rst);
// 	initial begin
// 	$dumpfile("fifo.vcd");
// 	$dumpvars(0, fifotest);
// 	rst = 1'b1;
// 	clk = 1'b1;
// 	re = 1'b0;
// 	we = 1'b0;
// 	#20
// 	rst = 1'b0;
// 	#20
// 	we = 1'b1;
// 	in = 10;
// 	#10
// 	in = 20;
// 	#10
// 	in = 30;
// 	#10
// 	in = 40;
// 	#10
// 	in = 50;
// 	#10
// 	in = 60;
// 	#10
// 	in = 70;
// 	#10
// 	we = 1'b0;
// 	#30
// 	re = 1'b1;
// 	#100
// 	$finish;
// 	end
// endmodule
