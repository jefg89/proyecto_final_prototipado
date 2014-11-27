`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:50:47 10/30/2014 
// Design Name: 
// Module Name:    MUXEscrituraRegistro 
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
module MUXEscrituraRegistro (
 Address,Write,EnableStart,EnableRegister
 );
 
 input Write;
 input [8:0] Address;
 output    [63:0] EnableRegister ;
 output  EnableStart;

	assign EnableStart = (Address==9'h180) ? 1'b1 : 1'b0 ;
	
	assign EnableRegister[0] = (Address==9'h000)&Write ? 1'b1 : 1'b0 ;
	assign EnableRegister[1] = (Address==9'h004)&Write ? 1'b1 : 1'b0 ;
	assign EnableRegister[2] = (Address==9'h008)&Write ? 1'b1 : 1'b0 ;
	assign EnableRegister[3] = (Address==9'h00C)&Write ? 1'b1 : 1'b0 ;
	assign EnableRegister[4] = (Address==9'h010)&Write ? 1'b1 : 1'b0 ;
	assign EnableRegister[5] = (Address==9'h014)&Write ? 1'b1 : 1'b0 ;
	assign EnableRegister[6] = (Address==9'h018)&Write ? 1'b1 : 1'b0 ;
	assign EnableRegister[7] = (Address==9'h01C)&Write ? 1'b1 : 1'b0 ;
	assign EnableRegister[8] = (Address==9'h020)&Write ? 1'b1 : 1'b0 ;
	assign EnableRegister[9] = (Address==9'h024)&Write ? 1'b1 : 1'b0 ;
	assign EnableRegister[10] = (Address==9'h028)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[11] = (Address==9'h02C)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[12] = (Address==9'h030)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[13] = (Address==9'h034)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[14] = (Address==9'h038)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[15] = (Address==9'h03C)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[16] = (Address==9'h040)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[17] = (Address==9'h044)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[18] = (Address==9'h048)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[19] = (Address==9'h04C)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[20] = (Address==9'h050)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[21] = (Address==9'h054)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[22] = (Address==9'h058)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[23] = (Address==9'h05C)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[24] = (Address==9'h060)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[25] = (Address==9'h064)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[26] = (Address==9'h068)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[27] = (Address==9'h06C)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[28] = (Address==9'h070)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[29] = (Address==9'h074)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[30] = (Address==9'h078)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[31] = (Address==9'h07C)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[32] = (Address==9'h080)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[33] = (Address==9'h084)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[34] = (Address==9'h088)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[35] = (Address==9'h08C)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[36] = (Address==9'h090)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[37] = (Address==9'h094)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[38] = (Address==9'h098)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[39] = (Address==9'h09C)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[40] = (Address==9'h0A0)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[41] = (Address==9'h0A4)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[42] = (Address==9'h0A8)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[43] = (Address==9'h0AC)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[44] = (Address==9'h0B0)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[45] = (Address==9'h0B4)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[46] = (Address==9'h0B8)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[47] = (Address==9'h0BC)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[48] = (Address==9'h0C0)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[49] = (Address==9'h0C4)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[50] = (Address==9'h0C8)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[51] = (Address==9'h0CC)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[52] = (Address==9'h0D0)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[53] = (Address==9'h0D4)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[54] = (Address==9'h0D8)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[55] = (Address==9'h0DC)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[56] = (Address==9'h0E0)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[57] = (Address==9'h0E4)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[58] = (Address==9'h0E8)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[59] = (Address==9'h0EC)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[60] = (Address==9'h0F0)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[61] = (Address==9'h0F4)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[62] = (Address==9'h0F8)&Write ? 1'b1 : 1'b0; 
	assign EnableRegister[63] = (Address==9'h0FC)&Write ? 1'b1 : 1'b0; 
	
 
	
 
	 


endmodule
