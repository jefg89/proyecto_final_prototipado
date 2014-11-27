`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:32:56 10/29/2014 
// Design Name: 
// Module Name:    MultiplicadorMatrices 
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
module MultiplicadorMatrices #(parameter Width = 8)
(CLK,Enable,MasterReset,Start,
A11InReal,A11InImag,A12InReal,A12InImag,A13InReal,A13InImag,A14InReal,A14InImag,
B11InReal,B11InImag,B21InReal,B21InImag,B31InReal,B31InImag,B41InReal,B41InImag,

A21InReal,A21InImag,A22InReal,A22InImag,A23InReal,A23InImag,A24InReal,A24InImag,
B12InReal,B12InImag,B22InReal,B22InImag,B32InReal,B32InImag,B42InReal,B42InImag,

A31InReal,A31InImag,A32InReal,A32InImag,A33InReal,A33InImag,A34InReal,A34InImag,
B13InReal,B13InImag,B23InReal,B23InImag,B33InReal,B33InImag,B43InReal,B43InImag,

A41InReal,A41InImag,A42InReal,A42InImag,A43InReal,A43InImag,A44InReal,A44InImag,
B14InReal,B14InImag,B24InReal,B24InImag,B34InReal,B34InImag,B44InReal,B44InImag,

Out11Real,Out11Imag,Out12Real,Out12Imag,Out13Real,Out13Imag,Out14Real,Out14Imag,
Out21Real,Out21Imag,Out22Real,Out22Imag,Out23Real,Out23Imag,Out24Real,Out24Imag,
Out31Real,Out31Imag,Out32Real,Out32Imag,Out33Real,Out33Imag,Out34Real,Out34Imag,
Out41Real,Out41Imag,Out42Real,Out42Imag,Out43Real,Out43Imag,Out44Real,Out44Imag,
Listo, Error
);
		input CLK,Enable,MasterReset,Start;
		output Listo, Error;
		input signed [Width-1:0] A11InReal,A11InImag,A12InReal,A12InImag,A13InReal,A13InImag,A14InReal,A14InImag,
		B11InReal,B11InImag,B21InReal,B21InImag,B31InReal,B31InImag,B41InReal,B41InImag,
		A21InReal,A21InImag,A22InReal,A22InImag,A23InReal,A23InImag,A24InReal,A24InImag,
		B12InReal,B12InImag,B22InReal,B22InImag,B32InReal,B32InImag,B42InReal,B42InImag,
		A31InReal,A31InImag,A32InReal,A32InImag,A33InReal,A33InImag,A34InReal,A34InImag,
		B13InReal,B13InImag,B23InReal,B23InImag,B33InReal,B33InImag,B43InReal,B43InImag,
		A41InReal,A41InImag,A42InReal,A42InImag,A43InReal,A43InImag,A44InReal,A44InImag,
		B14InReal,B14InImag,B24InReal,B24InImag,B34InReal,B34InImag,B44InReal,B44InImag;
		
		output signed [Width-1:0] Out11Real,Out11Imag,Out12Real,Out12Imag,Out13Real,Out13Imag,Out14Real,Out14Imag,
		Out21Real,Out21Imag,Out22Real,Out22Imag,Out23Real,Out23Imag,Out24Real,Out24Imag,
		Out31Real,Out31Imag,Out32Real,Out32Imag,Out33Real,Out33Imag,Out34Real,Out34Imag,
		Out41Real,Out41Imag,Out42Real,Out42Imag,Out43Real,Out43Imag,Out44Real,Out44Imag;
		
		wire signed [Width-1:0] A11OutReal,A11OutImag,A12OutReal,A12OutImag,A13OutReal,A13OutImag,A14OutReal,A14OutImag,
		B11OutReal,B11OutImag,B21OutReal,B21OutImag,B31OutReal,B31OutImag,B41OutReal,B41OutImag,
		A21OutReal,A21OutImag,A22OutReal,A22OutImag,A23OutReal,A23OutImag,A24OutReal,A24OutImag,
		B12OutReal,B12OutImag,B22OutReal,B22OutImag,B32OutReal,B32OutImag,B42OutReal,B42OutImag,
		A31OutReal,A31OutImag,A32OutReal,A32OutImag,A33OutReal,A33OutImag,A34OutReal,A34OutImag,
		B13OutReal,B13OutImag,B23OutReal,B23OutImag,B33OutReal,B33OutImag,B43OutReal,B43OutImag,
		A41OutReal,A41OutImag,A42OutReal,A42OutImag,A43OutReal,A43OutImag,A44OutReal,A44OutImag,
		B14OutReal,B14OutImag,B24OutReal,B24OutImag,B34OutReal,B34OutImag,B44OutReal,B44OutImag,OutReal,OutImag;
		
		wire signed [Width-1:0] OutX1Real,OutX1Imag,OutX2Real,OutX2Imag,OutX3Real,
	   OutX3Imag,OutX4Real,OutX4Imag, Out1XReal,Out1XImag,Out2XReal,Out2XImag,Out3XReal,
		Out3XImag,Out4XReal,Out4XImag;
		
		wire ErrorIntermedio, ListoIntermedio,ResetIn, EnableIn, StartCalculo, EnableCalculo,
		ResetCalculo,ResetOutRegisters,
		EnableRegisterOut11,EnableRegisterOut12,EnableRegisterOut13,EnableRegisterOut14,
		EnableRegisterOut21,EnableRegisterOut22,EnableRegisterOut23,EnableRegisterOut24,
		EnableRegisterOut31,EnableRegisterOut32,EnableRegisterOut33,EnableRegisterOut34,
		EnableRegisterOut41,EnableRegisterOut42,EnableRegisterOut43,EnableRegisterOut44;
		
		wire [1:0] SELMUXFila, SELMUXColumna;
		
		
		RegistroEntradaParalela #(.Width(Width)) RegistroEntradaParalelacopia (
		 .CLK(CLK),   //**********************
		 .reset(ResetIn), //**********************
		 .Enable(EnableIn), //**********************
		 .A11InReal(A11InReal), //**********************
		 .A11InImag(A11InImag), //**********************
		 .A12InReal(A12InReal), //**********************
		 .A12InImag(A12InImag), //**********************
		 .A13InReal(A13InReal), //**********************
		 .A13InImag(A13InImag), //**********************
		 .A14InReal(A14InReal), //**********************
		 .A14InImag(A14InImag), //**********************
		 .B11InReal(B11InReal), //**********************
		 .B11InImag(B11InImag), //**********************
		 .B21InReal(B21InReal),//********************** 
		 .B21InImag(B21InImag),  //**********************
		 .B31InReal(B31InReal), //**********************
		 .B31InImag(B31InImag), //**********************
		 .B41InReal(B41InReal), //**********************
		 .B41InImag(B41InImag), //**********************
		 .A21InReal(A21InReal), //**********************
		 .A21InImag(A21InImag), //**********************
		 .A22InReal(A22InReal), //**********************
		 .A22InImag(A22InImag), //**********************
		 .A23InReal(A23InReal), //**********************
		 .A23InImag(A23InImag), //**********************
		 .A24InReal(A24InReal), //**********************
		 .A24InImag(A24InImag), //**********************
		 .B12InReal(B12InReal), //**********************
		 .B12InImag(B12InImag), //**********************
		 .B22InReal(B22InReal), //**********************
		 .B22InImag(B22InImag), //**********************
		 .B32InReal(B32InReal), //**********************
		 .B32InImag(B32InImag), //**********************
		 .B42InReal(B42InReal), //**********************
		 .B42InImag(B42InImag), //**********************
		 .A31InReal(A31InReal), //**********************
		 .A31InImag(A31InImag), //**********************
		 .A32InReal(A32InReal), //**********************
		 .A32InImag(A32InImag), //**********************
		 .A33InReal(A33InReal), //**********************
		 .A33InImag(A33InImag), //**********************
		 .A34InReal(A34InReal), //**********************
		 .A34InImag(A34InImag), //**********************
		 .B13InReal(B13InReal), //**********************
		 .B13InImag(B13InImag), //**********************
		 .B23InReal(B23InReal), //**********************
		 .B23InImag(B23InImag), //**********************
		 .B33InReal(B33InReal), //**********************
		 .B33InImag(B33InImag), //**********************
		 .B43InReal(B43InReal), //**********************
		 .B43InImag(B43InImag), //**********************
		 .A41InReal(A41InReal), //**********************
		 .A41InImag(A41InImag), //**********************
		 .A42InReal(A42InReal), //**********************
		 .A42InImag(A42InImag), //**********************
		 .A43InReal(A43InReal), //**********************
		 .A43InImag(A43InImag), //**********************
		 .A44InReal(A44InReal), //**********************
		 .A44InImag(A44InImag), //**********************
		 .B14InReal(B14InReal), //**********************
		 .B14InImag(B14InImag), //**********************
		 .B24InReal(B24InReal), //**********************
		 .B24InImag(B24InImag), //**********************
		 .B34InReal(B34InReal), //**********************
		 .B34InImag(B34InImag), //**********************
		 .B44InReal(B44InReal), //**********************
		 .B44InImag(B44InImag), //**********************
		 .A11OutReal(A11OutReal), //**********************
		 .A11OutImag(A11OutImag), //**********************
		 .A12OutReal(A12OutReal), //**********************
		 .A12OutImag(A12OutImag),//********************** 
		 .A13OutReal(A13OutReal), //**********************
		 .A13OutImag(A13OutImag), //**********************
		 .A14OutReal(A14OutReal),//********************** 
		 .A14OutImag(A14OutImag),//********************** 
		 .B11OutReal(B11OutReal),//********************** 
		 .B11OutImag(B11OutImag),//********************** 
		 .B21OutReal(B21OutReal),//********************** 
		 .B21OutImag(B21OutImag),//********************** 
		 .B31OutReal(B31OutReal),//********************** 
		 .B31OutImag(B31OutImag), //**********************
		 .B41OutReal(B41OutReal), //**********************
		 .B41OutImag(B41OutImag), //**********************
		 .A21OutReal(A21OutReal), //**********************
		 .A21OutImag(A21OutImag), //**********************
		 .A22OutReal(A22OutReal), //**********************
		 .A22OutImag(A22OutImag), //**********************
		 .A23OutReal(A23OutReal), //**********************
		 .A23OutImag(A23OutImag), //**********************
		 .A24OutReal(A24OutReal), //**********************
		 .A24OutImag(A24OutImag), //**********************
		 .B12OutReal(B12OutReal), //**********************
		 .B12OutImag(B12OutImag), //**********************
		 .B22OutReal(B22OutReal), //**********************
		 .B22OutImag(B22OutImag), //**********************
		 .B32OutReal(B32OutReal), //**********************
		 .B32OutImag(B32OutImag), //**********************
		 .B42OutReal(B42OutReal), //**********************
		 .B42OutImag(B42OutImag), //**********************
		 .A31OutReal(A31OutReal), //**********************
		 .A31OutImag(A31OutImag), //**********************
		 .A32OutReal(A32OutReal), //**********************
		 .A32OutImag(A32OutImag), //**********************
		 .A33OutReal(A33OutReal), //**********************
		 .A33OutImag(A33OutImag), //**********************
		 .A34OutReal(A34OutReal), //**********************
		 .A34OutImag(A34OutImag), //**********************
		 .B13OutReal(B13OutReal), //**********************
		 .B13OutImag(B13OutImag), //**********************
		 .B23OutReal(B23OutReal), //**********************
		 .B23OutImag(B23OutImag), //**********************
		 .B33OutReal(B33OutReal), //**********************
		 .B33OutImag(B33OutImag), //**********************
		 .B43OutReal(B43OutReal), //**********************
		 .B43OutImag(B43OutImag), //**********************
		 .A41OutReal(A41OutReal), //**********************
		 .A41OutImag(A41OutImag), //**********************
		 .A42OutReal(A42OutReal), //**********************
		 .A42OutImag(A42OutImag), //**********************
		 .A43OutReal(A43OutReal), //**********************
		 .A43OutImag(A43OutImag), //**********************
		 .A44OutReal(A44OutReal), //**********************
		 .A44OutImag(A44OutImag), //**********************
		 .B14OutReal(B14OutReal), //**********************
		 .B14OutImag(B14OutImag), //**********************
		 .B24OutReal(B24OutReal), //**********************
		 .B24OutImag(B24OutImag), //**********************
		 .B34OutReal(B34OutReal), //**********************
		 .B34OutImag(B34OutImag), //**********************
		 .B44OutReal(B44OutReal), //**********************
		 .B44OutImag(B44OutImag)  //**********************
		);
		
		
		
		MuXFilasMAtrizA #(.Width(Width)) MuXFilasMAtrizAcopia (
		 .SEL(SELMUXFila), //**********************
		 .In11Real(A11OutReal),  //**********************
		 .In11Imag(A11OutImag),  //**********************
		 .In12Real(A12OutReal),  //**********************
		 .In12Imag(A12OutImag),  //**********************
		 .In13Real(A13OutReal),  //**********************
		 .In13Imag(A13OutImag),  //**********************
		 .In14Real(A14OutReal),  //**********************
		 .In14Imag(A14OutImag),  //**********************
		 .In21Real(A21OutReal),  //**********************
		 .In21Imag(A21OutImag),  //**********************
		 .In22Real(A22OutReal),  //**********************
		 .In22Imag(A22OutImag),  //**********************
		 .In23Real(A23OutReal),  //**********************
		 .In23Imag(A23OutImag),  //**********************
		 .In24Real(A24OutReal),  //**********************
		 .In24Imag(A24OutImag),  //**********************
		 .In31Real(A31OutReal),  //**********************
		 .In31Imag(A31OutImag),  //**********************
		 .In32Real(A32OutReal), //**********************
		 .In32Imag(A32OutImag),  //**********************
		 .In33Real(A33OutReal),  //**********************
		 .In33Imag(A33OutImag),  //**********************
		 .In34Real(A34OutReal), //**********************
		 .In34Imag(A34OutImag),  //**********************
		 .In41Real(A41OutReal),  //**********************
		 .In41Imag(A41OutImag),  //**********************
		 .In42Real(A42OutReal),  //**********************
		 .In42Imag(A42OutImag),  //**********************
		 .In43Real(A43OutReal),  //**********************
		 .In43Imag(A43OutImag),  //**********************
		 .In44Real(A44OutReal),  //**********************
		 .In44Imag(A44OutImag),  //**********************
		 .OutX1Real(OutX1Real),  //**********************
		 .OutX1Imag(OutX1Imag),  //**********************
		 .OutX2Real(OutX2Real),  //**********************
		 .OutX2Imag(OutX2Imag),  //**********************
		 .OutX3Real(OutX3Real),  //**********************
		 .OutX3Imag(OutX3Imag),  //**********************
		 .OutX4Real(OutX4Real),  //**********************
		 .OutX4Imag(OutX4Imag)   //**********************
    );
	 
	 MuxColumnasMatrizB #(.Width(Width)) MuxColumnasMatrizBcopia (
    .SEL(SELMUXColumna),    //**********************
    .In11Real(B11OutReal),  //**********************
	 .In11Imag(B11OutImag),  //**********************
	 .In12Real(B12OutReal),  //**********************
	 .In12Imag(B12OutImag),  //**********************
	 .In13Real(B13OutReal),  //**********************
	 .In13Imag(B13OutImag),  //**********************
	 .In14Real(B14OutReal),  //**********************
	 .In14Imag(B14OutImag),  //**********************
	 .In21Real(B21OutReal),  //**********************
	 .In21Imag(B21OutImag),  //**********************
	 .In22Real(B22OutReal),  //**********************
	 .In22Imag(B22OutImag),  //**********************
	 .In23Real(B23OutReal),  //**********************
	 .In23Imag(B23OutImag),  //**********************
	 .In24Real(B24OutReal),  //**********************
	 .In24Imag(B24OutImag),  //**********************
	 .In31Real(B31OutReal),  //**********************
	 .In31Imag(B31OutImag),  //**********************
	 .In32Real(B32OutReal),  //**********************
	 .In32Imag(B32OutImag),  //**********************
	 .In33Real(B33OutReal),  //**********************
	 .In33Imag(B33OutImag),  //**********************
	 .In34Real(B34OutReal),  //**********************
	 .In34Imag(B34OutImag),  //**********************
	 .In41Real(B41OutReal),  //**********************
	 .In41Imag(B41OutImag),  //**********************
	 .In42Real(B42OutReal),  //**********************
	 .In42Imag(B42OutImag),  //**********************
	 .In43Real(B43OutReal),  //**********************
	 .In43Imag(B43OutImag),  //**********************
	 .In44Real(B44OutReal),  //**********************
	 .In44Imag(B44OutImag),  //**********************
    .Out1XReal(Out1XReal),  //**********************
    .Out1XImag(Out1XImag),  //**********************
    .Out2XReal(Out2XReal),  //**********************
    .Out2XImag(Out2XImag),  //**********************
    .Out3XReal(Out3XReal),  //**********************
    .Out3XImag(Out3XImag),  //**********************
    .Out4XReal(Out4XReal),  //**********************
    .Out4XImag(Out4XImag)   //**********************
    );
	 
	 
	
		
	 MultiplicacionFilaColumna #(.Width(Width)) MultiplicacionFilaColumnacopia (
    .CLK(CLK), //**********************
    .MasterReset(ResetCalculo),  //**********************
    .Enable(EnableCalculo),   //**********************
    .Start(StartCalculo),  //**********************
    .A11InReal(OutX1Real), //**********************
    .A11InImag(OutX1Imag), //**********************
    .A12InReal(OutX2Real), //**********************
    .A12InImag(OutX2Imag), //**********************
    .A13InReal(OutX3Real), //**********************
    .A13InImag(OutX3Imag), //**********************
    .A14InReal(OutX4Real), //**********************
    .A14InImag(OutX4Imag), //**********************
    .B11InReal(Out1XReal), //**********************
    .B11InImag(Out1XImag), //**********************
    .B21InReal(Out2XReal), //**********************
    .B21InImag(Out2XImag), //**********************
    .B31InReal(Out3XReal), //**********************
    .B31InImag(Out3XImag), //**********************
    .B41InReal(Out4XReal), //**********************
    .B41InImag(Out4XImag), //**********************
    .OutReal(OutReal),      //**********************
    .OutImag(OutImag),      //**********************
    .Error(ErrorIntermedio), //**********************
    .Listo(ListoIntermedio)  //**********************
    );
	 
	 FSMMatrices FSMControlPrincipal (
    .CLK(CLK),   //**********************
    .MasterReset(MasterReset),  //**********************
    .Start(Start),    //**********************
    .Enable(Enable),  //**********************
    .InError(ErrorIntermedio),  //**********************
    .ListoIn(ListoIntermedio), //**********************
    .SELMUXColumna(SELMUXColumna),  //**********************
    .SELMUXFila(SELMUXFila),  //**********************
    .ResetIn(ResetIn),  //**********************
    .EnableIn(EnableIn),  //**********************
    .ResetOutRegisters(ResetOutRegisters),  //**********************
    .EnableRegisterOut11(EnableRegisterOut11), //**********************
    .EnableRegisterOut12(EnableRegisterOut12), //**********************
    .EnableRegisterOut13(EnableRegisterOut13), //**********************
    .EnableRegisterOut14(EnableRegisterOut14), //**********************
    .EnableRegisterOut21(EnableRegisterOut21), //**********************
    .EnableRegisterOut22(EnableRegisterOut22), //**********************
    .EnableRegisterOut23(EnableRegisterOut23), //**********************
    .EnableRegisterOut24(EnableRegisterOut24), //**********************
    .EnableRegisterOut31(EnableRegisterOut31), //**********************
    .EnableRegisterOut32(EnableRegisterOut32), //**********************
    .EnableRegisterOut33(EnableRegisterOut33), //**********************
    .EnableRegisterOut34(EnableRegisterOut34), //**********************
    .EnableRegisterOut41(EnableRegisterOut41), //**********************
    .EnableRegisterOut42(EnableRegisterOut42), //**********************
    .EnableRegisterOut43(EnableRegisterOut43), //**********************
    .EnableRegisterOut44(EnableRegisterOut44), //**********************
    .Listo(Listo),  //**********************
    .StartCalculo(StartCalculo),  //**********************
    .EnableCalculo(EnableCalculo), //**********************
    .ResetCalculo(ResetCalculo)   //**********************
    );
	 
	 
	 Registro8bits #(.Width(Width)) Registro11Real (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters),  //**********************
    .Enable(EnableRegisterOut11), //**********************
    .In(OutReal),   //**********************
    .Out(Out11Real)  //**********************
    );
	 
	  Registro8bits #(.Width(Width)) Registro11Imag (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters), //**********************
    .Enable(EnableRegisterOut11), //**********************
    .In(OutImag),           //**********************
    .Out(Out11Imag)         //**********************
    );
	 
	 
	 
	 Registro8bits #(.Width(Width)) Registro12Real (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters),  //**********************
    .Enable(EnableRegisterOut12), //**********************
    .In(OutReal),   //**********************
    .Out(Out12Real)  //**********************
    );
	 
	  Registro8bits #(.Width(Width)) Registro12Imag (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters), //**********************
    .Enable(EnableRegisterOut12), //**********************
    .In(OutImag),           //**********************
    .Out(Out12Imag)         //**********************
    );
	 
	 Registro8bits #(.Width(Width)) Registro13Real (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters),  //**********************
    .Enable(EnableRegisterOut13), //**********************
    .In(OutReal),   //**********************
    .Out(Out13Real)  //**********************
    );
	 
	  Registro8bits #(.Width(Width)) Registro13Imag (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters), //**********************
    .Enable(EnableRegisterOut13), //**********************
    .In(OutImag),           //**********************
    .Out(Out13Imag)         //**********************
    );
	 
	 Registro8bits #(.Width(Width)) Registro14Real (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters),  //**********************
    .Enable(EnableRegisterOut14), //**********************
    .In(OutReal),   //**********************
    .Out(Out14Real)  //**********************
    );
	 
	  Registro8bits #(.Width(Width)) Registro14Imag (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters), //**********************
    .Enable(EnableRegisterOut14), //**********************
    .In(OutImag),           //**********************
    .Out(Out14Imag)         //**********************
    );
	 
	 Registro8bits #(.Width(Width)) Registro21Real (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters),  //**********************
    .Enable(EnableRegisterOut21), //**********************
    .In(OutReal),   //**********************
    .Out(Out21Real)  //**********************
    );
	 
	  Registro8bits #(.Width(Width)) Registro21Imag (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters), //**********************
    .Enable(EnableRegisterOut21), //**********************
    .In(OutImag),           //**********************
    .Out(Out21Imag)         //**********************
    );
	 
	 Registro8bits #(.Width(Width)) Registro22Real (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters),  //**********************
    .Enable(EnableRegisterOut22), //**********************
    .In(OutReal),   //**********************
    .Out(Out22Real)  //**********************
    );
	 
	  Registro8bits #(.Width(Width)) Registro22Imag (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters), //**********************
    .Enable(EnableRegisterOut22), //**********************
    .In(OutImag),           //**********************
    .Out(Out22Imag)         //**********************
    );
	 
	 Registro8bits #(.Width(Width)) Registro23Real (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters),  //**********************
    .Enable(EnableRegisterOut23), //**********************
    .In(OutReal),   //**********************
    .Out(Out23Real)  //**********************
    );
	 
	  Registro8bits #(.Width(Width)) Registro23Imag (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters), //**********************
    .Enable(EnableRegisterOut23), //**********************
    .In(OutImag),           //**********************
    .Out(Out23Imag)         //**********************
    );
	 
	 Registro8bits #(.Width(Width)) Registro24Real (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters),  //**********************
    .Enable(EnableRegisterOut24), //**********************
    .In(OutReal),   //**********************
    .Out(Out24Real)  //**********************
    );
	 
	  Registro8bits #(.Width(Width)) Registro24Imag (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters), //**********************
    .Enable(EnableRegisterOut24), //**********************
    .In(OutImag),           //**********************
    .Out(Out24Imag)         //**********************
    );
	 
	 Registro8bits #(.Width(Width)) Registro31Real (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters),  //**********************
    .Enable(EnableRegisterOut31), //**********************
    .In(OutReal),   //**********************
    .Out(Out31Real)  //**********************
    );
	 
	  Registro8bits #(.Width(Width)) Registro31Imag (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters), //**********************
    .Enable(EnableRegisterOut31), //**********************
    .In(OutImag),           //**********************
    .Out(Out31Imag)         //**********************
    );
	 
	 Registro8bits #(.Width(Width)) Registro32Real (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters),  //**********************
    .Enable(EnableRegisterOut32), //**********************
    .In(OutReal),   //**********************
    .Out(Out32Real)  //**********************
    );
	 
	  Registro8bits #(.Width(Width)) Registro32Imag (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters), //**********************
    .Enable(EnableRegisterOut32), //**********************
    .In(OutImag),           //**********************
    .Out(Out32Imag)         //**********************
    );
	 
	 Registro8bits #(.Width(Width)) Registro33Real (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters),  //**********************
    .Enable(EnableRegisterOut33), //**********************
    .In(OutReal),   //**********************
    .Out(Out33Real)  //**********************
    );
	 
	  Registro8bits #(.Width(Width)) Registro33Imag (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters), //**********************
    .Enable(EnableRegisterOut33), //**********************
    .In(OutImag),           //**********************
    .Out(Out33Imag)         //**********************
    );
	 
	 Registro8bits #(.Width(Width)) Registro34Real (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters),  //**********************
    .Enable(EnableRegisterOut34), //**********************
    .In(OutReal),   //**********************
    .Out(Out34Real)  //**********************
    );
	 
	  Registro8bits #(.Width(Width)) Registro34Imag (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters), //**********************
    .Enable(EnableRegisterOut34), //**********************
    .In(OutImag),           //**********************
    .Out(Out34Imag)         //**********************
    );
	 
	 Registro8bits #(.Width(Width)) Registro41Real (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters),  //**********************
    .Enable(EnableRegisterOut41), //**********************
    .In(OutReal),   //**********************
    .Out(Out41Real)  //**********************
    );
	 
	  Registro8bits #(.Width(Width)) Registro41Imag (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters), //**********************
    .Enable(EnableRegisterOut41), //**********************
    .In(OutImag),           //**********************
    .Out(Out41Imag)         //**********************
    );
	 
	 Registro8bits #(.Width(Width)) Registro42Real (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters),  //**********************
    .Enable(EnableRegisterOut42), //**********************
    .In(OutReal),   //**********************
    .Out(Out42Real)  //**********************
    );
	 
	  Registro8bits #(.Width(Width)) Registro42Imag (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters), //**********************
    .Enable(EnableRegisterOut42), //**********************
    .In(OutImag),           //**********************
    .Out(Out42Imag)         //**********************
    );
	 
	 Registro8bits #(.Width(Width)) Registro43Real (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters),  //**********************
    .Enable(EnableRegisterOut43), //**********************
    .In(OutReal),   //**********************
    .Out(Out43Real)  //**********************
    );
	 
	  Registro8bits #(.Width(Width)) Registro43Imag (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters), //**********************
    .Enable(EnableRegisterOut43), //**********************
    .In(OutImag),           //**********************
    .Out(Out43Imag)         //**********************
    );
	 
	 Registro8bits #(.Width(Width)) Registro44Real (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters),  //**********************
    .Enable(EnableRegisterOut44), //**********************
    .In(OutReal),   //**********************
    .Out(Out44Real)  //**********************
    );
	 
	  Registro8bits #(.Width(Width)) Registro44Imag (
    .CLK(CLK), //**********************
    .reset(ResetOutRegisters), //**********************
    .Enable(EnableRegisterOut44), //**********************
    .In(OutImag),           //**********************
    .Out(Out44Imag)         //**********************
    );

     assign Error = ErrorIntermedio;

endmodule

