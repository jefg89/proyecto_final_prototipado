`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:36:38 11/30/2014 
// Design Name: 
// Module Name:    DecoEscrituraRegistros 
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
module DecoEscrituraRegistros(Address,Write,EnableStart,EnableRegister
 );
 
 input Write;
 input [8:0] Address;
 output    [21:0] EnableRegister ;
 output  EnableStart;
 


	assign EnableStart = (Address==9'h068) ? 1'b1 : 1'b0 ;
	
	assign EnableRegister[0] = (Address==9'h00C)&Write ? 1'b1 : 1'b0 ;  // CoeffEntrenamiento0
	assign EnableRegister[1] = (Address==9'h010)&Write ? 1'b1 : 1'b0 ;  // CoeffEntrenamiento1
	assign EnableRegister[2] = (Address==9'h014)&Write ? 1'b1 : 1'b0 ;  // CoeffEntrenamiento2
	assign EnableRegister[3] = (Address==9'h018)&Write ? 1'b1 : 1'b0 ;  // CoeffEntrenamiento3
	assign EnableRegister[4] = (Address==9'h01C)&Write ? 1'b1 : 1'b0 ;  // CoeffEntrenamiento4
	assign EnableRegister[5] = (Address==9'h020)&Write ? 1'b1 : 1'b0 ;  // CoeffEntrenamiento5
	assign EnableRegister[6] = (Address==9'h024)&Write ? 1'b1 : 1'b0 ;  // CoeffEntrenamiento6
	assign EnableRegister[7] = (Address==9'h028)&Write ? 1'b1 : 1'b0 ;  // CoeffEntrenamiento7
	assign EnableRegister[8] = (Address==9'h02C)&Write ? 1'b1 : 1'b0 ;  // CoeffEntrenamiento8
	assign EnableRegister[9] = (Address==9'h030)&Write ? 1'b1 : 1'b0 ;  // CoeffEntrenamiento9
	assign EnableRegister[10] = (Address==9'h034)&Write ? 1'b1 : 1'b0;  // CoeffEntrenamiento10
	assign EnableRegister[11] = (Address==9'h038)&Write ? 1'b1 : 1'b0;  // CoeffEntrenamiento11
	assign EnableRegister[12] = (Address==9'h03C)&Write ? 1'b1 : 1'b0;  // CoeffEntrenamiento12
	assign EnableRegister[13] = (Address==9'h040)&Write ? 1'b1 : 1'b0;  // CoeffEntrenamiento13
	assign EnableRegister[14] = (Address==9'h044)&Write ? 1'b1 : 1'b0;  // CoeffEntrenamiento14
	assign EnableRegister[15] = (Address==9'h048)&Write ? 1'b1 : 1'b0;  // CoeffEntrenamiento15
	assign EnableRegister[16] = (Address==9'h04C)&Write ? 1'b1 : 1'b0;  // CoeffEntrenamiento16
	assign EnableRegister[17] = (Address==9'h050)&Write ? 1'b1 : 1'b0;  // CoeffEntrenamiento17
	assign EnableRegister[18] = (Address==9'h054)&Write ? 1'b1 : 1'b0;  // CoeffEntrenamiento18
	assign EnableRegister[19] = (Address==9'h058)&Write ? 1'b1 : 1'b0;  // CoeffEntrenamiento19
	
	assign EnableRegister[20] = (Address==9'h05C)&Write ? 1'b1 : 1'b0; // Coeficiente Offset
	
	assign EnableRegister[21] = (Address==9'h060)&Write ? 1'b1 : 1'b0; // Entrada

endmodule

