`include "sw.vh"

module ib(pkti, pkto, req, ack, full, clk, rst);
  input ack, clk, rst;
  input [`PKTW:0] pkti;
  output full;
  output [`PKTW:0] pkto;
  output [`PORT:0] req;

	wire [`PORT:0] reqi;

	mkwe mkwe(pkti, we); // we =  write enable
	fifo fifo(pkti, we, full, pkto, re, empty, clk, rst);
	isbm isbm(pkto[`FLOWBH:`FLOWBL], re, empty, reqi, req, ack, clk, rst);
	mkreq mkreq(pkto, reqi, clk, rst);
endmodule

