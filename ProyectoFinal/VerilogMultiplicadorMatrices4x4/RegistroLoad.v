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
module RegistroLoad #(parameter Width = 32)
(CLK,MasterReset,InDatos,Write,Address,
A11InReal,A11InImag,A12InReal,A12InImag,A13InReal,A13InImag,A14InReal,A14InImag,
B11InReal,B11InImag,B21InReal,B21InImag,B31InReal,B31InImag,B41InReal,B41InImag,

A21InReal,A21InImag,A22InReal,A22InImag,A23InReal,A23InImag,A24InReal,A24InImag,
B12InReal,B12InImag,B22InReal,B22InImag,B32InReal,B32InImag,B42InReal,B42InImag,

A31InReal,A31InImag,A32InReal,A32InImag,A33InReal,A33InImag,A34InReal,A34InImag,
B13InReal,B13InImag,B23InReal,B23InImag,B33InReal,B33InImag,B43InReal,B43InImag,

A41InReal,A41InImag,A42InReal,A42InImag,A43InReal,A43InImag,A44InReal,A44InImag,
B14InReal,B14InImag,B24InReal,B24InImag,B34InReal,B34InImag,B44InReal,B44InImag,Start);
	 
	 genvar i;
	 input CLK,Write,MasterReset;
	 input signed [Width-1:0] InDatos;
	 input [8:0] Address;
	 wire [63:0] EnableRegister ;
	 
	 output Start;
	 
	 wire EnableStart;
	 
	 wire [Width-1:0] OutRegisterStart;
	 reg [Width-1:0] InDatos_S = 0;
	 
	 
	 output   signed [Width-1:0]  A11InReal,A11InImag,A12InReal,A12InImag,A13InReal,A13InImag,A14InReal,A14InImag,
	B11InReal,B11InImag,B21InReal,B21InImag,B31InReal,B31InImag,B41InReal,B41InImag,

	A21InReal,A21InImag,A22InReal,A22InImag,A23InReal,A23InImag,A24InReal,A24InImag,
	B12InReal,B12InImag,B22InReal,B22InImag,B32InReal,B32InImag,B42InReal,B42InImag,

	A31InReal,A31InImag,A32InReal,A32InImag,A33InReal,A33InImag,A34InReal,A34InImag,
	B13InReal,B13InImag,B23InReal,B23InImag,B33InReal,B33InImag,B43InReal,B43InImag,

	A41InReal,A41InImag,A42InReal,A42InImag,A43InReal,A43InImag,A44InReal,A44InImag,
	B14InReal,B14InImag,B24InReal,B24InImag,B34InReal,B34InImag,B44InReal,B44InImag;
	
	wire [Width-1:0] Aux [63:0];
	
	 MUXEscrituraRegistro DecoEscrituraRegistro (
    .Address(Address),             //*****************
    .Write(Write),                 //*****************
    .EnableStart(EnableStart), 
    .EnableRegister(EnableRegister) //*****************
    );
	
	
	always@(*)begin
		if(InDatos[7]) begin
			InDatos_S <= {24'HFFFFFF,InDatos[7:0]};
		end
		else begin
			InDatos_S <= {24'H000000,InDatos[7:0]};
		end
	end
	 
	 generate 
		for (i=0; i<64; i=i+1) begin: RegistroA11Real1N
			Registro8bits #(.Width(Width)) RegistroA11Real (
			 .CLK(CLK),  //*********************
			 .reset(MasterReset),   //********************* 
			 .Enable(EnableRegister[i]), 
			 .In(InDatos_S),    //*********************
			 .Out(Aux[i])
			 );
		end
	endgenerate
	
	Registro8bits #(.Width(Width)) Registro8bitsStart (
    .CLK(CLK), 
    .reset(MasterReset), 
    .Enable(EnableStart), 
    .In(InDatos), 
    .Out(OutRegisterStart)
    );
	assign Start = OutRegisterStart[0];
	
	assign A11InReal = Aux[0];
	assign A11InImag = Aux[1];
	assign A12InReal = Aux[2];
	assign A12InImag = Aux[3];
	assign A13InReal = Aux[4];
	assign A13InImag = Aux[5];
	assign A14InReal = Aux[6];
	assign A14InImag = Aux[7];
	assign B11InReal = Aux[32];
	assign B11InImag = Aux[33];
	assign B21InReal = Aux[40];
	assign B21InImag = Aux[41];
	assign B31InReal = Aux[48];
	assign B31InImag = Aux[49];
	assign B41InReal = Aux[56];
	assign B41InImag = Aux[57];

	
	assign A21InReal = Aux[8];
	assign A21InImag = Aux[9];
	assign A22InReal = Aux[10];
	assign A22InImag = Aux[11];
	assign A23InReal = Aux[12];
	assign A23InImag = Aux[13];
	assign A24InReal = Aux[14];
	assign A24InImag = Aux[15];
	assign B12InReal = Aux[34];
	assign B12InImag = Aux[35];
	assign B22InReal = Aux[42];
	assign B22InImag = Aux[43];
	assign B32InReal = Aux[50];
	assign B32InImag = Aux[51];
	assign B42InReal = Aux[58];
	assign B42InImag = Aux[59];

	assign A31InReal = Aux[16];
	assign A31InImag = Aux[17];
	assign A32InReal = Aux[18];
	assign A32InImag = Aux[19];
	assign A33InReal = Aux[20];
	assign A33InImag = Aux[21];
	assign A34InReal = Aux[22];
	assign A34InImag = Aux[23];
	assign B13InReal = Aux[36];
	assign B13InImag = Aux[37];
	assign B23InReal = Aux[44];
	assign B23InImag = Aux[45];
	assign B33InReal = Aux[52];
	assign B33InImag = Aux[53];
	assign B43InReal = Aux[60];
	assign B43InImag = Aux[61];

	assign A41InReal = Aux[24];
	assign A41InImag = Aux[25];
	assign A42InReal = Aux[26];
	assign A42InImag = Aux[27];
	assign A43InReal = Aux[28];
	assign A43InImag = Aux[29];
	assign A44InReal = Aux[30];
	assign A44InImag = Aux[31];
	assign B14InReal = Aux[38];
	assign B14InImag = Aux[39];
	assign B24InReal = Aux[46];
	assign B24InImag = Aux[47];
	assign B34InReal = Aux[54];
	assign B34InImag = Aux[55];
	assign B44InReal = Aux[62];
	assign B44InImag = Aux[63];


endmodule
