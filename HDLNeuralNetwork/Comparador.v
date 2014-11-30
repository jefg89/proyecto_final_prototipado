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
module Comparador #(parameter Width = 24, A00= 0, A01= 1, 
A02 = 2, A03 = 3, A04 = 4, A05 = 5, A06 = 6, A07 = 7, A08 = 8, A09 = 9,
A10= 10, A11= 11, A12 = 12, A13 = 13, A14 = 14, A15 = 15, A16 = 16, A17 = 17, A18 = 18, A19 = 19,
A20= 20, A21= 21, 
A22 = 22, A23 = 23, A24 = 24, A25 = 25, A26 = 26, A27 = 27, A28 = 28, A29 = 29, A30 = 30)
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
