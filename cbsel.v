`include "sw.vh"
module cbsel (in0, in1, in2, in3, out, port);
  input [`PKTW:0] in0, in1, in2, in3;
  input [`PORT:0] port;
  output[`PKTW:0] out;

  assign out = (port == 4'b0000) ? 0 :
               (port == 4'b0001) ? in0 :
               (port == 4'b0010) ? in1 :
               (port == 4'b0100) ? in2 :
               (port == 4'b1000) ? in3 :
               `PKTW'bx;
endmodule
