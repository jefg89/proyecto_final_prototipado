`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:52 12/01/2014 
// Design Name: 
// Module Name:    ALUborrar 
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
module ALUNeuralNetwork#(parameter Width = 32,ConLimitador=0, Magnitud = 9, Precision = 22, Signo = 1, A00= 0, 
A01= 1, A02 = 2, A03 = 3, A04 = 4, A05 = 5, A06 = 6, A07 = 7, A08 = 8, A09 = 9,
A10= 10, A11= 11, A12 = 12, A13 = 13, A14 = 14, A15 = 15, A16 = 16, A17 = 17, A18 = 18, A19 = 19,
A20= 20, A21= 21,A22 = 22, A23 = 23, A24 = 24, A25 = 25, A26 = 26, A27 = 27, A28 = 28, A29 = 29, 
A30 = 30, M01= 1,  M02 = 2, M03 = 3, M04 = 4, M05 = 5, M06 = 6, M07 = 7, M08 = 8, M09 = 9, M10= 10, 
M11= 11, M12 = 12, M13 = 13, M14 = 14, M15 = 15, M16 = 16, M17 = 17, M18 = 18, M19 = 19, M20= 20, 
M21= 21,M22 = 22, M23 = 23, M24 = 24, M25 = 25, M26 = 26, M27 = 27, M28 = 28, M29 = 29,  M30 = 30,
B01= 1,  B02 = 2, B03 = 3, B04 = 4, B05 = 5, B06 = 6, B07 = 7, B08 = 8, B09 = 9,
B10= 10, B11= 11, B12 = 12, B13 = 13, B14 = 14, B15 = 15, B16 = 16, B17 = 17, B18 = 18, B19 = 19,
B20= 20, B21= 21,B22 = 22, B23 = 23, B24 = 24, B25 = 25, B26 = 26, B27 = 27, B28 = 28, B29 = 29, 
B30 = 30)
(CLK,reset,EnableLoadCoeff, EnableMulX,EnableRegOutMultCoeffX,EnableFuctAct,EnableRegActFunc,EnableMulY,
EnableRegDesplazamiento,EnableSum,InDato,Acumulador,SELCoeffX,SELCoeffY,SELOffset,Coeff00,Coeff01,Coeff02,Coeff03,Coeff04,Coeff05,
Coeff06,Coeff07,Coeff08,Coeff09,Coeff10,Coeff11,Coeff12,Coeff13,Coeff14,Coeff15,Coeff16,Coeff17,Coeff18,
Coeff19,Offset,Error,OutDato,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9);

	 input CLK, reset, EnableLoadCoeff,EnableRegOutMultCoeffX,EnableMulX,EnableFuctAct,EnableMulY,
	 EnableRegActFunc,EnableRegDesplazamiento,EnableSum;
	 input [3:0] SELCoeffX,SELCoeffY;
	 input SELOffset; // Si SELOffset es 1, es una suma con el offset, sino es una suma con el resultado
	 // de multcoeffY
	 
	 input signed [Width-1:0] InDato,Acumulador,Coeff00,Coeff01,Coeff02,Coeff03,Coeff04,Coeff05,
    Coeff06,Coeff07,Coeff08,Coeff09,Coeff10,Coeff11,Coeff12,Coeff13,Coeff14,Coeff15,Coeff16,Coeff17,
	 Coeff18,Coeff19,Offset;
	 
	 output Error;
	 output signed [Width-1:0] OutDato,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9;
	 
	 wire signed [Width-1:0] OutMultCoeffX,OutRegisterMultCoeffX,OutActFunct,OutRegActFunct,OutCoeffY,
	 OutCoeffX,OutMultCoeffY,OffsetOut, OutMuXOffsetOrMultCoeffY;
	 
	 wire Error1,Error2,Error3,Error4;

	 RegistroWithMuxInput #(.Width(Width)) RegistroWithMuxInputCopia (
    .CLK(CLK),           //************************************
    .EnableRegisterIn(EnableLoadCoeff),   //************************************
    .reset(reset),        //************************************
    .SELCoeffX(SELCoeffX), //************************************
    .SELCoeffY(SELCoeffY),//************************************
    .Coeff00(Coeff00),   //************************************
    .Coeff01(Coeff01),   //************************************
    .Coeff02(Coeff02),   //************************************
    .Coeff03(Coeff03),   //************************************
    .Coeff04(Coeff04),   //************************************
    .Coeff05(Coeff05),   //************************************
    .Coeff06(Coeff06),   //************************************
    .Coeff07(Coeff07),   //************************************
    .Coeff08(Coeff08),   //************************************
    .Coeff09(Coeff09),   //************************************
    .Coeff10(Coeff10),   //************************************
    .Coeff11(Coeff11),   //************************************
    .Coeff12(Coeff12),   //************************************
    .Coeff13(Coeff13),   //************************************
    .Coeff14(Coeff14),   //************************************
    .Coeff15(Coeff15),   //************************************
    .Coeff16(Coeff16),   //************************************
    .Coeff17(Coeff17),   //************************************
    .Coeff18(Coeff18),   //************************************ 
    .Coeff19(Coeff19),   //************************************
    .OffsetIn(Offset),   //************************************
    .OutCoeffX(OutCoeffX),  //************************************
    .OutCoeffY(OutCoeffY),  //************************************
    .OffsetOut(OffsetOut)   //************************************
    );

	 
	 multiplicadorPuntoFijo  #(.Width(Width), .Magnitud(Magnitud), .Precision(Precision),.Signo(Signo)) 
	 multiplicadorPuntoFijoCoeficienteX (
    .EnableMul(EnableMulX),    //************************************
    .In(InDato),               //************************************
    .Coeff(OutCoeffX),         //************************************
    .OutMul(OutMultCoeffX),    //************************************
    .Error(Error1)             //************************************
    );
	 
	 Registro  #(.Width(Width)) RegistroOutMultCoeffX (
    .CLK(CLK),                  //************************************
    .reset(reset),              //************************************
    .Enable(EnableRegOutMultCoeffX), //************************************
    .Entrada(OutMultCoeffX),    //************************************
    .Salida(OutRegisterMultCoeffX)  //************************************
    );
	 
	 FuncionActivacion #(.Width(Width),.ConLimitador(ConLimitador),.Magnitud(Magnitud), .Precision(Precision), .Signo(Signo), .A00(A00), 
		.A01(A01),.A02(A02),.A03(A03),.A04(A04),.A05(A05),.A06(A06),.A07(A07),.A08(A08),.A09(A09),
		.A10(A10),.A11(A11),.A12(A12),.A13(A13),.A14(A14),.A15(A15),.A16(A16),.A17(A17),.A18(A18),.A19(A19),
		.A20(A20),.A21(A21),.A22(A22),.A23(A23),.A24(A24),.A25(A25),.A26(A26),.A27(A27),.A28(A28),.A29(A29), 
		.A30(A30), 
		.M01(M01),.M02(M02),.M03(M03),.M04(M04),.M05(M05),.M06(M06),.M07(M07),.M08(M08),.M09(M09),
		.M10(M10),.M11(M11),.M12(M12),.M13(M13),.M14(M14),.M15(M15),.M16(M16),.M17(M17),.M18(M18),.M19(M19),
		.M20(M20),.M21(M21),.M22(M22),.M23(M23),.M24(M24),.M25(M25),.M26(M26),.M27(M27),.M28(M28),.M29(M29), 
		.M30(M30),
		.B01(B01),.B02(B02),.B03(B03),.B04(B04),.B05(B05),.B06(B06),.B07(B07),.B08(B08),.B09(B09),
		.B10(B10),.B11(B11),.B12(B12),.B13(B13),.B14(B14),.B15(B15),.B16(B16),.B17(B17),.B18(B18),.B19(B19),
		.B20(B20),.B21(B21),.B22(B22),.B23(B23),.B24(B24),.B25(B25),.B26(B26),.B27(B27),.B28(B28),.B29(B29), 
		.B30(B30))
		FuncionActivacionSigmoidal (
    .Entrada(OutRegisterMultCoeffX),  //************************************
    .Enable(EnableFuctAct),           //************************************
    .Error(Error2),                   //************************************
    .Salida(OutActFunct)              //************************************
    );

	 //assign OutActFunct=OutRegisterMultCoeffX;  // Borrar
	 
	 Registro #(.Width(Width)) RegistroOutActFunct (
    .CLK(CLK),                        //************************************
    .reset(reset),                    //************************************
    .Enable(EnableRegActFunc),         //************************************
    .Entrada(OutActFunct),  //OutActFunct            //************************************
    .Salida(OutRegActFunct)             //************************************
    );
	 
	 multiplicadorPuntoFijo  #(.Width(Width), .Magnitud(Magnitud), .Precision(Precision),.Signo(Signo)) 
	 multiplicadorPuntoFijoCoeffY (
    .EnableMul(EnableMulY),              //************************************
    .In(OutRegActFunct),                 //************************************
    .Coeff(OutCoeffY),                   //************************************
    .OutMul(OutMultCoeffY),              //************************************
    .Error(Error3)                       //************************************
    );
	 
	 Registrodesplazamiento #(.Width(Width))  RegistrodesplazamientoCopia (
    .CLK(CLK),                           //************************************
    .reset(reset),                       //************************************
    .Enable(EnableRegDesplazamiento),    //************************************
    .Indato(OutMultCoeffY),              //************************************
    .Y0(Y0),                             //************************************
    .Y1(Y1),                             //************************************
    .Y2(Y2),                             //************************************
    .Y3(Y3),                             //************************************
    .Y4(Y4),                             //************************************
    .Y5(Y5),                             //************************************ 
    .Y6(Y6),                             //************************************
    .Y7(Y7),                             //************************************
    .Y8(Y8),                             //************************************
    .Y9(Y9)                              //************************************
    );
	 
	 assign OutMuXOffsetOrMultCoeffY = SELOffset ? OffsetOut : OutMultCoeffY; //Mux selector de offset
	 
	 sumadorPuntoFijo #(.Width(Width), .Magnitud(Magnitud), .Precision(Precision),.Signo(Signo))
	 sumadorPuntoFijocopia (
    .EnableSum(EnableSum),                         //************************************
    .In(OutMuXOffsetOrMultCoeffY),                 //************************************
    .Acumulador(Acumulador),                       //************************************
    .OutSum(OutDato),                               //************************************
    .Error(Error4)                                   //************************************
    );
	 
	 assign Error = Error1 | Error2 | Error3 | Error4;


endmodule
