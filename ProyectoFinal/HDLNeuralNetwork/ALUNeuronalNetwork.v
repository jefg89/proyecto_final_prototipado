`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:59:45 11/30/2014 
// Design Name: 
// Module Name:    ALUNeuronalNetwork 
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
module ALUNeuronalNetwork #(parameter Width = 4, Magnitud = 2, Precision = 1, Signo = 1)
(CLK,reset,EnableLoadCoeff, EnableMul,EnableSum,InDato,Acumulador,SELCoeff,Coeff00,Coeff01,Coeff02,Coeff03,Coeff04,Coeff05,
Coeff06,Coeff07,Coeff08,Coeff09,Coeff10,Coeff11,Coeff12,Coeff13,Coeff14,Coeff15,Coeff16,Coeff17,Coeff18,
Coeff19,Offset,Error,OutDato);
	 
	 input CLK, reset, EnableLoadCoeff,EnableMul,EnableSum;
	 input [4:0] SELCoeff;
	 input signed [Width-1:0] InDato,Acumulador,Coeff00,Coeff01,Coeff02,Coeff03,Coeff04,Coeff05,
    Coeff06,Coeff07,Coeff08,Coeff09,Coeff10,Coeff11,Coeff12,Coeff13,Coeff14,Coeff15,Coeff16,Coeff17,
	 Coeff18,Coeff19,Offset;
	 
	 output Error;
	 output signed [Width-1:0] OutDato;
	 
	 wire signed [Width-1:0] CoefficienteEntrenamiento, OutMult;
	 wire Error1,Error2;
	 
	 RegistroWithMuxInput #(.Width(Width)) RegistroWithMuxInputcopiaCargaCoeff (
    .CLK(CLK), //************************
    .EnableRegisterIn(EnableLoadCoeff), //************************
    .reset(reset), //************************
    .SEL(SELCoeff),      //************************
    .Coeff00(Coeff00),   //************************
    .Coeff01(Coeff01),   //************************
    .Coeff02(Coeff02),   //************************
    .Coeff03(Coeff03),   //************************
    .Coeff04(Coeff04),   //************************
    .Coeff05(Coeff05),   //************************
    .Coeff06(Coeff06),   //************************
    .Coeff07(Coeff07),   //************************
    .Coeff08(Coeff08),   //************************
    .Coeff09(Coeff09),   //************************
    .Coeff10(Coeff10),   //************************ 
    .Coeff11(Coeff11),   //************************
    .Coeff12(Coeff12),   //************************
    .Coeff13(Coeff13),    //************************
    .Coeff14(Coeff14),    //************************
    .Coeff15(Coeff15),    //************************
    .Coeff16(Coeff16),    //************************
    .Coeff17(Coeff17),    //************************ 
    .Coeff18(Coeff18),    //************************
    .Coeff19(Coeff19),    //************************
	 .Offset(Offset),      //************************
    .OutCoeff(CoefficienteEntrenamiento)  //*************************
    );
	 
	 
	 multiplicadorPuntoFijo #(.Width(Width), .Magnitud(Magnitud), .Precision(Precision),.Signo(Signo)) 
	 multiplicadorPuntoFijoNeuronalNetwork (
    .EnableMul(EnableMul), //*************************
    .In(InDato),            //*************************
    .Coeff(CoefficienteEntrenamiento),   //*************************
    .OutMul(OutMult),                     //*************************
    .Error(Error1)                       //*************************
    );
	 
	 
	 sumadorPuntoFijo #(.Width(Width), .Magnitud(Magnitud), .Precision(Precision),.Signo(Signo))
	 sumadorPuntoFijoNeuronalNetwork (
    .EnableSum(EnableSum),   //**********************
    .In(OutMult),            //*************************
    .Acumulador(Acumulador),  //*************************
    .OutSum(OutDato),        //*************************
    .Error(Error2)           //*************************
    );
	 
	 assign Error = Error1 | Error2;


endmodule
