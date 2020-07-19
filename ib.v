`include "sw.vh"
module ib(input [`PKTW:0] pkti, output [`PKTW:0] pkto, output [`PORT:0] req, input ack, output logic full, input clk, rst, output we, output [3:0] reqi, output [1:0] mode, output [1:0] cmd);

	logic [`PORT:0] reqi;
  assign cmd = pkti[`FLOWBH:`FLOWBL];

	mkwe mkwe(pkti, we); // we =  write enable
	fifo fifo(pkti, we, full, pkto, re, empty, clk, rst);
	isbm isbm(pkti[`FLOWBH:`FLOWBL], pkto[`FLOWBH:`FLOWBL], re, empty, reqi, req, ack, clk, rst, mode);
	mkreq mkreq(pkto, reqi, clk, rst);

endmodule

