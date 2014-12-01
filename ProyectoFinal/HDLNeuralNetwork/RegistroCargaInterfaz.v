`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:05:56 10/30/2014 
// Design Name: 
// Module Name:    RegistroLoad 
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
module RegistroCargaInterfaz #(parameter Width = 32)
(CLK,Reset,ResetStart,InDatoMemoria,Write,Address,
Coeff00,Coeff01,Coeff02,Coeff03,Coeff04,Coeff05,
Coeff06,Coeff07,Coeff08,Coeff09,Coeff10,Coeff11,Coeff12,Coeff13,Coeff14,Coeff15,Coeff16,Coeff17,Coeff18,
Coeff19,Offset,InDato,Start);
	 
	 genvar i;
	 input CLK,Write,Reset,ResetStart;
	 input signed [Width-1:0] InDatoMemoria;
	 input [8:0] Address;
	 wire [21:0] EnableRegister ;
	 
	 output Start;
	 
	 wire EnableStart;
	 
	 wire [Width-1:0] OutRegisterStart;
	 
	 
	 output   signed [Width-1:0]  Coeff00,Coeff01,Coeff02,Coeff03,Coeff04,Coeff05,
Coeff06,Coeff07,Coeff08,Coeff09,Coeff10,Coeff11,Coeff12,Coeff13,Coeff14,Coeff15,Coeff16,Coeff17,Coeff18,
Coeff19,Offset,InDato;
	
	wire signed [Width-1:0] Aux [21:0]; //*********************
	
	 DecoEscrituraRegistros DecoEscrituraRegistro (
    .Address(Address),             //*****************
    .Write(Write),                 //*****************
    .EnableStart(EnableStart),     //*********************
    .EnableRegister(EnableRegister) //*****************
    );

	 
	 generate 
		for (i=0; i<21; i=i+1) begin: MemoriaToRegistros
			Registro #(.Width(Width)) RegistroCoeffcientes (
			 .CLK(CLK),  //*********************
			 .reset(Reset),   //********************* 
			 .Enable(EnableRegister[i]),  //*********************
			 .Entrada(InDatoMemoria),    //*********************
			 .Salida(Aux[i]) //*********************
			 );
		end
	endgenerate
	
	
	Registro #(.Width(Width)) RegistroEntrada ( // Solo cuando se hace un master reset los coeficientes se borrar
    .CLK(CLK),     //********************* 
    .reset(ResetStart),    //*********************
    .Enable(EnableRegister[21]), //*********************
    .Entrada(InDatoMemoria),    //*********************
    .Salida(Aux[21])   //*********************
    );
	
	Registro #(.Width(Width)) RegistroStart (
    .CLK(CLK),     //********************* 
    .reset(ResetStart),    //*********************
    .Enable(EnableStart), //*********************
    .Entrada(InDatoMemoria),    //*********************
    .Salida(OutRegisterStart)   //*********************
    );
	assign Start = OutRegisterStart[00] | OutRegisterStart[01] | OutRegisterStart[02] | 
	OutRegisterStart[03] | OutRegisterStart[04] | OutRegisterStart[05] | OutRegisterStart[06] | 
	OutRegisterStart[07] | OutRegisterStart[08] | OutRegisterStart[09] | OutRegisterStart[10] | 
	OutRegisterStart[11] | OutRegisterStart[12] | OutRegisterStart[13] | OutRegisterStart[14] | 
	OutRegisterStart[15] | OutRegisterStart[16] | OutRegisterStart[17] | OutRegisterStart[18] | 
	OutRegisterStart[19] | OutRegisterStart[20] | OutRegisterStart[21] | OutRegisterStart[22] | 
	OutRegisterStart[23] | OutRegisterStart[24] | OutRegisterStart[25] | OutRegisterStart[26] | 
	OutRegisterStart[27] | OutRegisterStart[28] | OutRegisterStart[29] | OutRegisterStart[30] | 
	OutRegisterStart[31];
	
	assign Coeff00 = Aux[0];
	assign Coeff01 = Aux[1];
	assign Coeff02 = Aux[2];
	assign Coeff03 = Aux[3];
	assign Coeff04 = Aux[4];
	assign Coeff05 = Aux[5];
	assign Coeff06 = Aux[6];
	assign Coeff07 = Aux[7];
	assign Coeff08 = Aux[8];
	assign Coeff09 = Aux[9];
	assign Coeff10 = Aux[10];
	assign Coeff11 = Aux[11];
	assign Coeff12 = Aux[12];
	assign Coeff13 = Aux[13];
	assign Coeff14 = Aux[14];
	assign Coeff15 = Aux[15];
	
	assign Coeff16 = Aux[16];
	assign Coeff17 = Aux[17];
	assign Coeff18 = Aux[18];
	assign Coeff19 = Aux[19];
	assign Offset = Aux[20];
	assign InDato = Aux[21];

	
	

endmodule
