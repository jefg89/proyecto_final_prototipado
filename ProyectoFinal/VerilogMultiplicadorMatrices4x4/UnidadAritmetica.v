`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:58:47 10/29/2014 
// Design Name: 
// Module Name:    UnidadAritmetica 
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
module UnidadAritmetica #(parameter Width = 8) 
   (CLK,reset,Op,InA,InB,InC,Out,Error);
		
	 // In A, In B son los valores que se van a multiplicar
	 // InC es la que viene de los registros
	
	 input CLK,reset,Op; // Si Op es 1, se hace una resta, si Op es 0 se hace una suma
	 input signed [Width-1:0] InA,InB, InC;
	 output signed [Width-1:0] Out;
	 output reg Error = 0; // Si Error es 1, significa que hubo Overflow o Underflow
	 
	 wire signed [Width-1:0] ResultMult,ResultMultxMenos1,InSumador1;
	 wire Error1,Error2,Error3;
	 
	 
	 Multiplicador #(.Width(Width)) MultiplicadorCopia (
    .OperandoA(InA), 
    .OperandoB(InB), 
    .Result(ResultMult), 
    .Error(Error1)
    );
	 
	 
	 Multiplicadormenos1 #(.Width(Width)) Multiplicadormenos1copia (
    .In(ResultMult), 
    .Out(ResultMultxMenos1)
    );
	 
	 assign InSumador1 = Op ? ResultMultxMenos1 : ResultMult;
	 
	 Sumador #(.Width(Width)) SumadorCopia (
    .OperandoA(InSumador1), 
    .OperandoB(InC), 
    .Result(Out), 
    .Error(Error2)
    );
	 
	 assign Error3 = Error1 | Error2;
	 
	 always @(posedge CLK)
      if (reset) begin
         Error <= 1'b0;
      end else if (Error3) begin
         Error <= 1'b1;
      end


endmodule
