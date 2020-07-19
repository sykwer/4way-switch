`include "sw.vh"

module mkreq(pkt, req, clk, rst);
  input clk, rst;
  input [`PKTW:0] pkt;
  output [`PORT:0] req;
  assign req = pkt[9:8] == 2'b10 ? (1 << pkt[1:0]) : 0;
endmodule

