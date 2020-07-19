`include "sw.vh"

module mkwe (pkt, we);
  input [`PKTW:0] pkt;
  output we;
  assign we = pkt[9:8] != 0;
endmodule
