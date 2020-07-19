`include "sw.vh"
module swtest;
	logic [`PKTW:0] i0, i1, i2, i3;
	logic [`PKTW:0] o0, o1, o2, o3;
	logic clk, rst;
  logic ack0, ack1, ack2, ack3;
  logic [`PORT:0] req0, req1, req2, req3;
  logic we0, we1, we2, we3;
  logic [3:0] reqi0, reqi1, reqi2, reqi3;
  logic [1:0] mode0, mode1, mode2, mode3;
  logic [1:0] cmd0, cmd1, cmd2, cmd3;
  logic [2:0] ackreg0, ackreg1, ackreg2, ackreg3;
  logic [3:0] lead0, lead1,lead2, lead3;
	sw sw(i0, i1, i2, i3, o0, o1, o2, o3, ack0, ack1, ack2, ack3, req0, req1, req2, req3, we0, we1, we2, we3, reqi0, reqi1, reqi2, reqi3, mode0, mode1, mode2, mode3, cmd0, cmd1, cmd2, cmd3, ackreg0, ackreg1, ackreg2, ackreg3, lead0, lead1, lead2, lead3, clk, rst);
	always #5 clk = ~clk;
initial begin
$dumpfile("sw.vcd");
$dumpvars(0, swtest);
clk = 0;
i0 = 0;
i1 = 0;
i2 = 0;
i3 = 0;
rst = `ASSERT;
#10
rst = `NEGATE;
#10
i0 = 10'b10_0000_0000; // (header frame) port0 => port0 length 4
#10
i0 = 10'b01_0000_0000; // (payload) 0
#10
i0 = 10'b01_0000_0001; // (payload) 0
#10
i0 = 10'b11_0000_0010; // (trailer frame) 2
#10
i0 = 0; // (empty)
#10
i0 = 10'b10_1001_0001; // port0 => port1 length 4
#10
i0 = 10'b01_1001_0000;
#10
i0 = 10'b01_1001_0001;
#10
i0 = 10'b11_1001_0010;
#10
i0 = 0;
#10
i0 = 10'b10_0000_0000; // port0 => port0 short
#10
i0 = 10'b11_0000_1111;
#10
i0 = 10'b10_0000_0001; // port0 => port1 short
#10
i0 = 10'b11_0000_1111;
#10
i0 = 10'b10_0000_0010; // port0 => port2 short
#10
i0 = 10'b11_0000_1111;
#10
i0 = 10'b10_0000_0011; // port0 => port3 short
#10
i0 = 10'b11_0000_1111;
#10
i0 = 0;
#10
i1 = 10'b10_0001_0000; // port1 => port0 short
#10
i1 = 10'b11_0001_1111;
#10
i1 = 10'b10_0001_0001; // port1 => port1 short
#10
i1 = 10'b11_0001_1111;
#10
i1 = 10'b10_0001_0010; // port1 => port2 short
#10
i1 = 10'b11_0001_1111;
#10
i1 = 10'b10_0001_0011; // port1 => port3 short
#10
i1 = 10'b11_0001_1111;
#10
i1 = 0;
#10
i2 = 10'b10_0010_0000; // port2 => port0 short
#10
i2 = 10'b11_0010_1111;
#10
i2 = 10'b10_0010_0001; // port2 => port1 short
#10
i2 = 10'b11_0010_1111;
#10
i2 = 10'b10_0010_0010; // port2 => port2 short
#10
i2 = 10'b11_0010_1111;
#10
i2 = 10'b10_0010_0011; // port2 => port3 short
#10
i2 = 10'b11_0010_1111;
#10
i2 = 0;
#10
i3 = 10'b10_0011_0000; // port3 => port0 short
#10
i3 = 10'b11_0011_1111;
#10
i3 = 10'b10_0011_0001; // port3 => port1 short
#10
i3 = 10'b11_0011_1111;
#10
i3 = 10'b10_0011_0010; // port3 => port2 short
#10
i3 = 10'b11_0011_1111;
#10
i3 = 10'b10_0011_0011; // port3 => port3 short
#10
i3 = 10'b11_0011_1111;
#10
i3 = 0;
#10
i0 = 10'b10_0000_0001; // port0 => port1 length 4 conflict
i1 = 10'b10_0001_0001; // port0 => port1 length 4 conflict
i2 = 10'b10_0010_0001; // port0 => port1 length 4 conflict
i3 = 10'b10_0011_0001; // port0 => port1 length 4 conflict
#10
i0 = 10'b01_0000_0000;
i1 = 10'b01_0001_0000;
i2 = 10'b01_0010_0000;
i3 = 10'b01_0011_0000;
#10
i0 = 10'b01_0000_0001;
i1 = 10'b01_0001_0001;
i2 = 10'b01_0010_0001;
i3 = 10'b01_0011_0001;
#10
i0 = 10'b11_0000_1111;
i1 = 10'b11_0001_1111;
i2 = 10'b11_0010_1111;
i3 = 10'b11_0011_1111;
#10
i0 = 0;
i1 = 0;
i2 = 0;
i3 = 0;
#200
i0 = 10'b10_0000_0000; // port0 => port0 short conflict
i1 = 10'b10_0001_0000; // port0 => port0 short conflict
i2 = 10'b10_0010_0000; // port0 => port0 short conflict
i3 = 10'b10_0011_0000; // port0 => port0 short conflict
#10
i0 = 10'b11_0000_1111;
i1 = 10'b11_0001_1111;
i2 = 10'b11_0010_1111;
i3 = 10'b11_0011_1111;
#10
i0 = 0;
i1 = 0;
i2 = 0;
i3 = 0;
#200
i0 = 10'b10_0000_0001; // port0 => port1 short conflict
i1 = 10'b10_0001_0001; // port0 => port1 short conflict
i2 = 10'b10_0010_0001; // port0 => port1 short conflict
i3 = 10'b10_0011_0001; // port0 => port1 short conflict
#10
i0 = 10'b11_0000_1111;
i1 = 10'b11_0001_1111;
i2 = 10'b11_0010_1111;
i3 = 10'b11_0011_1111;
#10
i0 = 0;
i1 = 0;
i2 = 0;
i3 = 0;
#200
i0 = 10'b10_0000_0010; // port0 => port2 short conflict
i1 = 10'b10_0001_0010; // port0 => port2 short conflict
i2 = 10'b10_0010_0010; // port0 => port2 short conflict
i3 = 10'b10_0011_0010; // port0 => port2 short conflict
#10
i0 = 10'b11_0000_1111;
i1 = 10'b11_0001_1111;
i2 = 10'b11_0010_1111;
i3 = 10'b11_0011_1111;
#10
i0 = 0;
i1 = 0;
i2 = 0;
i3 = 0;
#200
i0 = 10'b10_0000_0011; // port0 => port3 short conflict
i1 = 10'b10_0001_0011; // port0 => port3 short conflict
i2 = 10'b10_0010_0011; // port0 => port3 short conflict
i3 = 10'b10_0011_0011; // port0 => port3 short conflict
#10
i0 = 10'b11_0000_1111;
i1 = 10'b11_0001_1111;
i2 = 10'b11_0010_1111;
i3 = 10'b11_0011_1111;
#10
i0 = 0;
i1 = 0;
i2 = 0;
i3 = 0;
#500
$finish;
end
endmodule
