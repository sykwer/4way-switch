`include "sw.vh"

module isbm(in_cmd, out_cmd, re, empty, reqi, req_out, ack, clk, rst, mode);
  input clk, rst, empty, ack;
  input [1:0] in_cmd, out_cmd;
  input [`PORT:0] reqi;
  output re;
  reg [`PORT:0] req;

  output reg [1:0] mode;


  localparam MODE_WAIT_HEAD = 2'b00;
  localparam MODE_WAIT_ACK = 2'b01;
  localparam MODE_WAIT_TAIL = 2'b10;
  localparam CMD_HEAD = 2'b10;
  localparam CMD_TAIL = 2'b11;

  // tmp
  output [`PORT:0] req_out;
  assign req_out = req;
  // tmp

  assign re = ack;

  always @(posedge clk) begin
    if (rst) begin
      mode <= MODE_WAIT_HEAD;
      req <= 0;
    end else begin
      if (mode == MODE_WAIT_HEAD && out_cmd == CMD_HEAD) begin
        mode <= MODE_WAIT_ACK;
        req <= reqi;
      end else if (mode == MODE_WAIT_ACK && ack) begin
        mode <= MODE_WAIT_TAIL;
      end else if (mode == MODE_WAIT_TAIL && out_cmd == CMD_TAIL) begin
        mode <= MODE_WAIT_HEAD;
        req <= 0;
      end else begin
      end
    end
  end
endmodule
