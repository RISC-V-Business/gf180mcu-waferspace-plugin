// SPDX-FileCopyrightText: 2026 CFU-Playground Contributors
// SPDX-License-Identifier: Apache-2.0

`timescale 1ns / 1ps
`default_nettype none

module sram_tb;
  logic        clk0 = 1'b0;
  logic        clk1 = 1'b0;
  logic        csb0 = 1'b1;
  logic        csb1 = 1'b1;
  logic        web0 = 1'b1;
  logic [ 3:0] wmask0 = 4'b0000;
  logic [ 8:0] addr0 = 9'b0;
  logic [ 8:0] addr1 = 9'b0;
  logic [31:0] din0 = 32'b0;
  wire  [31:0] dout0;
  wire  [31:0] dout1;

  always #20 clk0 = ~clk0;
  always #20 clk1 = ~clk1;

  sram dut (
      .clk0  (clk0),
      .csb0  (csb0),
      .web0  (web0),
      .wmask0(wmask0),
      .addr0 (addr0),
      .din0  (din0),
      .dout0 (dout0),
      .clk1  (clk1),
      .csb1  (csb1),
      .addr1 (addr1),
      .dout1 (dout1)
  );

  initial begin
    #1;
    if (dout1 !== 32'b0) begin
      $fatal(1, "legacy SRAM port 1 is not grounded: %h", dout1);
    end
    #100;
    $finish;
  end
endmodule

`default_nettype wire
