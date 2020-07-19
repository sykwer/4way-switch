`include "sw.vh"

// Arbiter: this module corresponds to one specific output
module arb (req0, req1, req2, req3, ack0, ack1, ack2, ack3, clk, rst, ack, lead);
  input clk, rst;
  input req0, req1, req2, req3; // From input0, input1, input2, input3
  output ack0, ack1, ack2, ack3; // To input0, input1, input2, input3

  output reg [3:0] lead; // First candidate to gain right for output
  output reg [2:0] ack; // ACK index (1-indexed, 0 means no port is granted)

  wire [3:0] first, second, third, forth;
  wire [3:0] reqs;

  assign first = lead;
  assign second = (lead + 1) % 4;
  assign third = (lead + 2) % 4;
  assign forth = (lead + 3) % 4;
  assign reqs = {req3, req2, req1, req0};

  assign ack0 = (req0 && ack == 1);
  assign ack1 = (req1 && ack == 2);
  assign ack2 = (req2 && ack == 3);
  assign ack3 = (req3 && ack == 4);

  always @(posedge clk) begin
    if (rst) begin
      lead <= 0;
      ack <= 0;
    end else begin
      if (ack != 0) begin
        if ((ack == 1 && !req0) || (ack == 2 && !req1) || (ack == 3 && !req2) || (ack == 4 && !req3)) begin
          ack <= 0;
        end
      end else begin
        if (reqs[first]) begin
          ack <= first + 1;
          lead <= (lead + 1) % 4;
        end else if (reqs[second]) begin
          ack <= second + 1;
          lead <= (lead + 1) % 4;
        end else if (reqs[third]) begin
          ack <= third + 1;
          lead <= (lead + 1) % 4;
        end else if (reqs[forth]) begin
          ack <= forth + 1;
          lead <= (lead + 1) % 4;
        end else begin
        end
      end
    end
  end
endmodule
