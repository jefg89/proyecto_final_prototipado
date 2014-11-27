`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:38:00 10/29/2014 
// Design Name: 
// Module Name:    MultiplicacionFilaColumna 
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
module MultiplicacionFilaColumna #(parameter Width = 8)
(CLK,MasterReset,Enable, Start,A11InReal,A11InImag,A12InReal,A12InImag,A13InReal,A13InImag,A14InReal,
A14InImag,B11InReal,B11InImag,B21InReal,B21InImag,B31InReal,B31InImag,B41InReal,B41InImag,OutReal,
OutImag,Error,Listo);

	input CLK, MasterReset, Enable,Start;
	
	input signed [Width-1:0] A11InReal,A11InImag,A12InReal,A12InImag,A13InReal,A13InImag,
	A14InReal,A14InImag,B11InReal,B11InImag,B21InReal,B21InImag,B31InReal,B31InImag,B41InReal,B41InImag;
	
	output signed [Width-1:0] OutReal,OutImag;
	output Listo;
	output wire Error;
	
	wire  signed [Width-1:0] A11OutReal,A11OutImag,A12OutReal,A12OutImag,A13OutReal,
	A13OutImag,A14OutReal,A14OutImag,B11OutReal,B11OutImag,B21OutReal,B21OutImag,B31OutReal,B31OutImag,
	B41OutReal,B41OutImag,OutFilas,OutColumnas,OutUnidadAritmetica,Acumulador;
	
	wire [2:0] SELMUXFila,SELMUXColum;
	wire EnableRegisterIn,ResetRegisterIn,Op,EnableAcum,ResetAcum,EnableRegisterOutParteReal,
	EnableRegisterOutParteImag,ResetRegisterOutParteImag,ResetRegisterOutParteReal,ResetError;
	
	FSMControlMultFilColum FSMControl (
    .CLK(CLK),  //***********
	 .ErrorIn(Error),  //***********
    .MasterReset(MasterReset), //*****************
    .Enable(Enable),  //********************
    .Start(Start),  // ********************
    .Op(Op),        // ********************
    .SELMUXFila(SELMUXFila),  // ********************
    .SELMUXColum(SELMUXColum),  // ********************
    .ResetAcum(ResetAcum),  //**************** 
    .EnableAcum(EnableAcum),  //**************** 
    .EnableRegisterOutParteReal(EnableRegisterOutParteReal),  //****************  
    .EnableRegisterOutParteImag(EnableRegisterOutParteImag),  //**************** 
    .EnableRegisterIn(EnableRegisterIn), //**************************
    .Listo(Listo), //****************  
    .ResetRegisterOutParteImag(ResetRegisterOutParteImag),  //**************** 
    .ResetRegisterOutParteReal(ResetRegisterOutParteReal),   //**************** 
    .ResetRegisterIn(ResetRegisterIn),  //************************
	 .ResetError(ResetError)   //****************
   );
	
	RegistroInMultiplicador #(.Width(Width)) RegistroInMultiplicadorcopia (
    .CLK(CLK),  //*************
    .reset(ResetRegisterIn),  //*********************
    .Enable(EnableRegisterIn),  //****************
    .A11InReal(A11InReal),   //****************
    .A11InImag(A11InImag),   //****************
    .A12InReal(A12InReal),   //****************
    .A12InImag(A12InImag),   //****************
    .A13InReal(A13InReal),   //****************
    .A13InImag(A13InImag),   //****************
    .A14InReal(A14InReal),   //****************
    .A14InImag(A14InImag),   //****************
    .B11InReal(B11InReal),   //****************
    .B11InImag(B11InImag),   //****************
    .B21InReal(B21InReal),   //****************
    .B21InImag(B21InImag),   //****************
    .B31InReal(B31InReal),   //****************
    .B31InImag(B31InImag),   //**************** 
    .B41InReal(B41InReal),   //****************
    .B41InImag(B41InImag),   //****************
    .A11OutReal(A11OutReal),  //****************
    .A11OutImag(A11OutImag),  //****************
    .A12OutReal(A12OutReal),  //****************
    .A12OutImag(A12OutImag),  //****************
    .A13OutReal(A13OutReal),  //**************** 
    .A13OutImag(A13OutImag),  //**************** 
    .A14OutReal(A14OutReal),  //****************
    .A14OutImag(A14OutImag),  //****************
    .B11OutReal(B11OutReal),  //****************
    .B11OutImag(B11OutImag),  //****************
    .B21OutReal(B21OutReal),  //****************
    .B21OutImag(B21OutImag),  //****************
    .B31OutReal(B31OutReal),  //****************
    .B31OutImag(B31OutImag),  //****************
    .B41OutReal(B41OutReal),  //****************
    .B41OutImag(B41OutImag)   //****************
    );
	
	
	Multiplexor8a1 #(.Width(Width)) Multiplexordelasfilas (
    .SEL(SELMUXFila), //****************
    .In0(A11OutReal), //****************
    .In1(A11OutImag), //****************
    .In2(A12OutReal),  //****************
    .In3(A12OutImag), //****************
    .In4(A13OutReal), //**************** 
    .In5(A13OutImag), //****************
    .In6(A14OutReal), //****************
    .In7(A14OutImag), //****************
    .Out(OutFilas)    //**************** 
    );
	 
	 Multiplexor8a1 #(.Width(Width)) Multiplexordelascolumnas (
    .SEL(SELMUXColum), //****************
    .In0(B11OutReal),  //****************
    .In1(B11OutImag),  //****************
    .In2(B21OutReal),  //****************
    .In3(B21OutImag),  //****************
    .In4(B31OutReal),  //****************
    .In5(B31OutImag),  //****************
    .In6(B41OutReal),  //****************
    .In7(B41OutImag),  //****************
    .Out(OutColumnas)  //**************** 
    );
	 
	 UnidadAritmetica #(.Width(Width)) UnidadAritmetica1 (
    .CLK(CLK),   //****************
    .reset(ResetError), //****************
	 .Op(Op),   //****************  
    .InA(OutFilas),     //**************** 
    .InB(OutColumnas),  //**************** 
    .InC(Acumulador),     //**************** 
    .Out(OutUnidadAritmetica),  //****************
    .Error(Error)  //****************
    );
	 
	 Registro8bits #(.Width(Width)) RegistroAcumulador (
    .CLK(CLK),  //**************** 
    .reset(ResetAcum), //**************** 
    .Enable(EnableAcum), //**************** 
    .In(OutUnidadAritmetica), //****************
    .Out(Acumulador)    //**************** 
    );
	 
	 Registro8bits #(.Width(Width)) RegistroSalidaParteReal (
    .CLK(CLK),  //**************** 
    .reset(ResetRegisterOutParteReal), 
    .Enable(EnableRegisterOutParteReal), 
    .In(Acumulador),    //**************** 
    .Out(OutReal)    //**************** 
    );
	 
	 Registro8bits #(.Width(Width)) RegistroSalidaParteImaginaria (
    .CLK(CLK),  //**************** 
    .reset(ResetRegisterOutParteImag),  //**************** 
    .Enable(EnableRegisterOutParteImag),  //**************** 
    .In(Acumulador),  //**************** 
    .Out(OutImag)//**************** 
    );
	 
	 
	


endmodule
