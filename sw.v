`include "sw.vh"
module sw(input [`PKTW:0] i0, i1, i2, i3, output [`PKTW:0] o0, o1, o2, o3, output ack0, ack1, ack2, ack3, output [`PORT:0] req0, req1, req2, req3, output we0, we1, we2, we3, output [3:0] reqi0, reqi1, reqi2, reqi3, output [1:0] mode0, mode1, mode2, mode3, output [1:0] cmd0, cmd1, cmd2, cmd3, output [2:0] ackreg0, ackreg1, ackreg2, ackreg3, output [3:0] lead0, lead1, lead2, lead3, input clk, rst);
	logic [`PKTW:0] co0, co1, co2, co3; // packet outputs from ib
	logic [`PORT:0] req0, req1, req2, req3; // request outputs from ib

  // Input Buffers
	ib ib0(i0, co0, req0, ack0, full0, clk, rst, we0, reqi0, mode0, cmd0);
	ib ib1(i1, co1, req1, ack1, full1, clk, rst, we1, reqi1, mode1, cmd1);
	ib ib2(i2, co2, req2, ack2, full2, clk, rst, we2, reqi2, mode2, cmd2);
	ib ib3(i3, co3, req3, ack3, full3, clk, rst, we3, reqi3, mode3, cmd3);

  // ACK ORs
	ackor ackor0(ack00, ack10, ack20, ack30, ack0);
	ackor ackor1(ack01, ack11, ack21, ack31, ack1);
	ackor ackor2(ack02, ack12, ack22, ack32, ack2);
	ackor ackor3(ack03, ack13, ack23, ack33, ack3);

  // Arbiters (Correspond to output index)
	arb arb0(req0[0], req1[0], req2[0], req3[0], ack00, ack01, ack02, ack03, clk, rst, ackreg0, lead0);
	arb arb1(req0[1], req1[1], req2[1], req3[1], ack10, ack11, ack12, ack13, clk, rst, ackreg1, lead1);
	arb arb2(req0[2], req1[2], req2[2], req3[2], ack20, ack21, ack22, ack23, clk, rst, ackreg2, lead2);
	arb arb3(req0[3], req1[3], req2[3], req3[3], ack30, ack31, ack32, ack33, clk, rst, ackreg3, lead3);

  // Crossbar
	cb cb(co0, co1, co2, co3, o0, o1, o2, o3,
		{ack03, ack02, ack01, ack00}, {ack13, ack12, ack11, ack10},
		{ack23, ack22, ack21, ack20}, {ack33, ack32, ack31, ack30});
endmodule

