`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:45:36 11/28/2014 
// Design Name: 
// Module Name:    RegistroWithMuxInput 
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
module RegistroWithMuxInput#(parameter Width = 4)
(CLK,EnableRegisterIn,reset,SEL,Coeff00,Coeff01,Coeff02,Coeff03,Coeff04,Coeff05,Coeff06,Coeff07,Coeff08,Coeff09,
Coeff10,Coeff11,Coeff12,Coeff13,Coeff14,Coeff15,Coeff16,Coeff17,Coeff18,Coeff19,Offset,OutCoeff);

	input signed [Width-1:0] Coeff00,Coeff01,Coeff02,Coeff03,Coeff04,Coeff05,Coeff06,Coeff07,Coeff08,
	Coeff09,Coeff10,Coeff11,Coeff12,Coeff13,Coeff14,Coeff15,Coeff16,Coeff17,Coeff18,Coeff19,Offset;
	
	input CLK,EnableRegisterIn,reset;
	input [4:0] SEL;
	
	output reg signed [Width-1:0] OutCoeff = 0;
	
	reg signed [Width-1:0] AuxCoeff00,AuxCoeff01,AuxCoeff02,AuxCoeff03,AuxCoeff04,AuxCoeff05,AuxCoeff06,
	AuxCoeff07,AuxCoeff08,AuxCoeff09,AuxCoeff10,AuxCoeff11,AuxCoeff12,AuxCoeff13,AuxCoeff14,AuxCoeff15,AuxCoeff16,
	AuxCoeff17,AuxCoeff18,AuxCoeff19,AuxCoeff20;
	
	always @(posedge CLK)
	  if (reset) begin
		  AuxCoeff00 <= 0;
		  AuxCoeff01 <= 0;
		  AuxCoeff02 <= 0;
		  AuxCoeff03 <= 0;
		  AuxCoeff04 <= 0;
		  AuxCoeff05 <= 0;
		  AuxCoeff06 <= 0;
		  AuxCoeff07 <= 0;
		  AuxCoeff08 <= 0;
		  AuxCoeff09 <= 0;
		  AuxCoeff10 <= 0;
		  AuxCoeff11 <= 0;
		  AuxCoeff12 <= 0;
		  AuxCoeff13 <= 0;
		  AuxCoeff14 <= 0;
		  AuxCoeff15 <= 0;
		  AuxCoeff16 <= 0;
		  AuxCoeff17 <= 0;
		  AuxCoeff18 <= 0;
		  AuxCoeff19 <= 0;
		  AuxCoeff20 <= 0;
	  end else if (EnableRegisterIn) begin
		  AuxCoeff00 <= Coeff00;
		  AuxCoeff01 <= Coeff01;
		  AuxCoeff02 <= Coeff02;
		  AuxCoeff03 <= Coeff03;
		  AuxCoeff04 <= Coeff04;
		  AuxCoeff05 <= Coeff05;
		  AuxCoeff06 <= Coeff06;
		  AuxCoeff07 <= Coeff07;
		  AuxCoeff08 <= Coeff08;
		  AuxCoeff09 <= Coeff09;
		  AuxCoeff10 <= Coeff10;
		  AuxCoeff11 <= Coeff11;
		  AuxCoeff12 <= Coeff12;
		  AuxCoeff13 <= Coeff13;
		  AuxCoeff14 <= Coeff14;
		  AuxCoeff15 <= Coeff15;
		  AuxCoeff16 <= Coeff16;
		  AuxCoeff17 <= Coeff17;
		  AuxCoeff18 <= Coeff18;
		  AuxCoeff19 <= Coeff19;
		  AuxCoeff20 <= Offset;
	  end
	  
	  always @(SEL, AuxCoeff00,AuxCoeff01,AuxCoeff02,AuxCoeff03,AuxCoeff04,AuxCoeff05,AuxCoeff06,
		AuxCoeff07,AuxCoeff08,AuxCoeff09,AuxCoeff10,AuxCoeff11,AuxCoeff12,AuxCoeff13,AuxCoeff14,
		AuxCoeff15,AuxCoeff16,AuxCoeff17,AuxCoeff18,AuxCoeff19,AuxCoeff20)
      case (SEL)
         5'd00: OutCoeff <= AuxCoeff00;
         5'd01: OutCoeff <= AuxCoeff01;
         5'd02: OutCoeff <= AuxCoeff02;
         5'd03: OutCoeff <= AuxCoeff03;
         5'd04: OutCoeff <= AuxCoeff04;
         5'd05: OutCoeff <= AuxCoeff05;
         5'd06: OutCoeff <= AuxCoeff06;
         5'd07: OutCoeff <= AuxCoeff07;
			5'd08: OutCoeff <= AuxCoeff08;
         5'd09: OutCoeff <= AuxCoeff09;	
			5'd10: OutCoeff <= AuxCoeff10;
         5'd11: OutCoeff <= AuxCoeff11;
         5'd12: OutCoeff <= AuxCoeff12;
         5'd13: OutCoeff <= AuxCoeff13;
         5'd14: OutCoeff <= AuxCoeff14;
         5'd15: OutCoeff <= AuxCoeff15;
         5'd16: OutCoeff <= AuxCoeff16;
         5'd17: OutCoeff <= AuxCoeff17;
			5'd18: OutCoeff <= AuxCoeff18;
         5'd19: OutCoeff <= AuxCoeff19;
			5'd20: OutCoeff <= AuxCoeff20;
			default : OutCoeff <= 0;
      endcase


endmodule
