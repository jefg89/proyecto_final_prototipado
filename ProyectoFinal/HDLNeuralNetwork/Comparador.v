`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:09:52 11/29/2014 
// Design Name: 
// Module Name:    Comparador 
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
module Comparador #(parameter Width = 24, A00= -32'sb11110010000000000000000000000000, A01= -32'sb11110010100000000000000000000000, 
A02 = -32'sb11110011000000000000000000000000, A03 = -32'sb11110011100000000000000000000000, A04 = -32'sb11110100000000000000000000000000, A05 = -32'sb11110100100000000000000000000000, A06 = -32'sb11110101000000000000000000000000, A07 = -32'sb11110101100000000000000000000000, A08 = -32'sb11110110000000000000000000000000, A09 = -32'sb11110110100000000000000000000000,
A10= -32'sb11110111000000000000000000000000, A11= -32'sb11110111100000000000000000000000, A12 = -32'sb11111000000000000000000000000000, A13 = -32'sb11111000100000000000000000000000, A14 = -32'sb11111001000000000000000000000000, A15 = -32'sb11111001100000000000000000000000, A16 = -32'sb11111010000000000000000000000000, A17 = -32'sb11111010100000000000000000000000, A18 = -32'sb11111011000000000000000000000000, A19 = -32'sb11111011100000000000000000000000,
A20= -32'sb11111100000000000000000000000000, A21= -32'sb11111100100000000000000000000000, 
A22 = -32'sb11111101000000000000000000000000, A23 = -32'sb11111101100000000000000000000000, A24 = -32'sb11111110000000000000000000000000, A25 = -32'sb11111110100000000000000000000000, A26 = -32'sb11111111000000000000000000000000, A27 = 32'sb00000001000000000000000000000000, A28 = 32'sb00000011000000000000000000000000, A29 = 32'sb00001000000000000000000000000000, 
A30 = 32'sb00010100000000000000000000000000)
	(A,OutComp);
	
	
	 input signed [Width-1:0] A;
	 
	 output reg [4:0] OutComp=0;
	 
	 always @* begin
      if (A <= A00)
         OutComp <= 5'd00;
      else if (A <= A01)
         OutComp <= 5'd01;
		else if (A <= A02)
         OutComp <= 5'd02;
		else if (A <= A03)
         OutComp <= 5'd03;
		else if (A <= A04)
         OutComp <= 5'd04;
		else if (A <= A05)
         OutComp <= 5'd05;
		else if (A <= A06)
         OutComp <= 5'd06;
		else if (A <= A07)
         OutComp <= 5'd07;
		else if (A <= A08)
         OutComp <= 5'd08;
		else if (A <= A09)
         OutComp <= 5'd09;
		else if (A <= A10)
         OutComp <= 5'd10;
      else if (A <= A11)
         OutComp <= 5'd11;
		else if (A <= A12)
         OutComp <= 5'd12;
		else if (A <= A13)
         OutComp <= 5'd13;
		else if (A <= A14)
         OutComp <= 5'd14;
		else if (A <= A15)
         OutComp <= 5'd15;
		else if (A <= A16)
         OutComp <= 5'd16;
		else if (A <= A17)
         OutComp <= 5'd17;
		else if (A <= A18)
         OutComp <= 5'd18;
		else if (A <= A19)
         OutComp <= 5'd19;
		else if (A <= A20)
         OutComp <= 5'd20;
      else if (A <= A21)
         OutComp <= 5'd21;
		else if (A <= A22)
         OutComp <= 5'd22;
		else if (A <= A23)
         OutComp <= 5'd23;
		else if (A <= A24)
         OutComp <= 5'd24;
		else if (A <= A25)
         OutComp <= 5'd25;
		else if (A <= A26)
         OutComp <= 5'd26;
		else if (A <= A27)
         OutComp <= 5'd27;
		else if (A <= A28)
         OutComp <= 5'd28;
		else if (A <= A29)
         OutComp <= 5'd29;
		else if (A <= A30)
         OutComp <= 5'd30;
      else 
         OutComp <= 5'd31;
		end


endmodule
