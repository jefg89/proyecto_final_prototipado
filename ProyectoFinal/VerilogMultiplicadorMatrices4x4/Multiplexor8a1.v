`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:22 10/29/2014 
// Design Name: 
// Module Name:    Multiplexor8a1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Multiplexor8a1 #(parameter Width = 8)
(SEL,In0,In1,In2,In3,In4,In5,In6,In7,Out
    );
	 
	 input [2:0] SEL;
	 input [Width-1:0] In0,In1,In2,In3,In4,In5,In6,In7;
	 output reg [Width-1:0] Out;
	 
	 always @(SEL,In0,In1,In2,In3,In4,In5,In6,In7)
      case (SEL)
         3'b000: Out = In0;
         3'b001: Out = In1;
         3'b010: Out = In2;
         3'b011: Out = In3;
         3'b100: Out = In4;
         3'b101: Out = In5;
         3'b110: Out = In6;
         3'b111: Out = In7;
      endcase


endmodule
