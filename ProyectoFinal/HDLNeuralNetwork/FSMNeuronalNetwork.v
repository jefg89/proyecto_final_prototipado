`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:43:33 11/30/2014 
// Design Name: 
// Module Name:    FSMNeuronalNetwork 
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
module FSMNeuronalNetwork(CLK, reset,Start,Read,Address,ResetInterfaz,ResetStart,ResetCoeffALUandInput,       
	 EnableCoeffALUandInput,SELCoeff,EnableSumALU,EnableMultALU,EnableAcumulador,ResetAcumulador,EnableFuncActivacion,
    EnableRegisterOutput,ResetRegisterOutput,Listo);
	 
	 input CLK;  
	 input reset;   
	 input Start;
	 input Read;
	 input [8:0] Address;
	 
	 output reg ResetInterfaz =0;  
	 output reg ResetStart=0;  
	 output reg ResetCoeffALUandInput=0;       
	 output reg EnableCoeffALUandInput=0; 
	 output reg [4:0] SELCoeff=0;  
	 output reg EnableSumALU=0;  
	 output reg EnableMultALU=0;  
	 output reg EnableAcumulador=0; 
	 output reg ResetAcumulador=0;
	 output reg EnableFuncActivacion=0;
	 output reg EnableRegisterOutput=0; 
	 output reg ResetRegisterOutput=0;
	 output reg Listo=0;
	 
	 
	 
	 //** Registros de la Maquina de Estados***********************************************************************************
	 reg[5:0] State = 0; 
	 reg [5:0] NextState = 0;
	 
	 parameter S1=5'd1, S2=5'd2, S3=5'd3, S4=5'd4, S5=5'd5, S6=5'd6, S7=5'd7, S8=5'd8, S9=5'd9, S10=5'd10,
	 S11=5'd11, S12=5'd12, S13=5'd13, S14=5'd14, S15=5'd15, S16=5'd16, S17=5'd17, S18=5'd18, S19=5'd19, S20=5'd20,
	 S21=5'd21, S22=5'd22, S23=5'd23, S24=5'd24, S25=5'd25, S26=5'd26, S27=5'd27, S28=5'd28, S29=5'd29, S30=5'd30,
	 S31=5'd31, RESETEADOR=5'd00;
	 //******************************** FIN DE DECLARACIÓN DE REGISTROS Y PAMAMETROS MAQUIINA DE ESTADOS***********************************
	 
	  // *********************Registro de estado *********************************************************
	 always @(posedge CLK) begin //or posedge reset) begin
		begin
			if(reset)	
				State<=RESETEADOR;
			else		
				State<=NextState;
		end 
	 end
	 
	 // Lógica combinacional de estado siguiente ************************************
	always @*
		begin
			case(State)
				RESETEADOR: begin  //***********ESTADO DE RESET DEL SISTEMA
					if (reset) NextState <= RESETEADOR;
					else NextState <= S1;
				end
				S1: begin  //***********ESTADO DE ESPERA  INICIO
					if (Start) NextState <= S2;
					else NextState <= S1;
				end
				S2: begin   // ****************ESTADO DE HABILITA EnableCoeffALUandInput
					NextState <= S3;
				end   
				S3: begin   // ***********SELCoeff = 00 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1       
					NextState <= S4;
				end
				S4: begin   // ***********SELCoeff = 01 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1       
					NextState <= S5;
				end
				S5: begin  // ***********SELCoeff = 02 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1 
					NextState <= S6;
				end
				S6: begin  // ***********SELCoeff = 03 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					NextState <= S7;
				end
				S7: begin   // ***********SELCoeff = 04 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					NextState <= S8;
				end   
				S8: begin  // ***********SELCoeff = 05 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1       
					NextState <= S9;
				end
				S9: begin   // ***********SELCoeff = 06 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1       
					NextState <= S10;
				end
				S10: begin  // ***********SELCoeff = 07 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					NextState <= S11;
				end
				S11: begin  /// ***********SELCoeff = 08 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					NextState <= S12;
				end
				S12: begin   // ***********SELCoeff = 09 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					NextState <= S13;
				end   
				S13: begin   // ***********SELCoeff = 10 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					NextState <= S14;
				end
				S14: begin   // ***********SELCoeff = 11 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					NextState <= S15;
				end
				S15: begin  // ***********SELCoeff = 12 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					NextState <= S16;
				end
				S16: begin  // ***********SELCoeff = 13 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					NextState <= S17;
				end
				S17: begin   // ***********SELCoeff = 14 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					NextState <= S18;
				end   
				S18: begin   // ***********SELCoeff = 15 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					NextState <= S19;
				end
				S19: begin   // ***********SELCoeff = 16 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					NextState <= S20;
				end
				S20: begin  // ***********SELCoeff = 17 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					NextState <= S21;
				end
				S21: begin  // ***********SELCoeff = 18 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					NextState <= S22;
				end
				S22: begin  // ***********SELCoeff = 19 y EnableSumALU = 1, EnableMultALU = 0, EnableAcum = 1
					NextState <= S23;
				end 
				S23: begin  // ***********SELCoeff = 20 y EnableSumALU = 1, EnableMultALU = 0, EnableAcum = 1
					NextState <= S24;
				end 
				S24: begin  // ***********SELCoeff = xx y EnableSumALU = 0, EnableMultALU = 0, EnableAcum = 0
					NextState <= S25;
				end
				S25: begin  // ***********EnableFuncActivation = 1  EnableAcum = 0
					NextState <= S26;
				end
				S26: begin  // ***********EnableFuncActivation = 1  EnableAcum = 0 EnableRegisterOutput = 1
					NextState <= S27;
				end
				S27: begin  // ***********EnableFuncActivation = 0  EnableAcum = 0 EnableRegisterOutput = 0, Listo = 1
					if(Address==9'h050 && Read == 1'b1) NextState <= S28; // Direccion de memoria donde se hace la ultima lectura
					else NextState <= S27;
				end
				S28: begin   // ***********EnableFuncActivation = 0  EnableAcum = 0 EnableRegisterOutput = 0, Listo = 1
					if(Address==9'h050 && Read == 1'b1) NextState <= S28; // Direccion de memoria donde se hace la ultima lectura
					else NextState <= S29;
				end  
				S29: begin   // Estado de resetea todos los registros excepto el reset
					NextState <= S1;
				end 
				default: begin  // Salidas por defecto iguales a la  del ResetInterfaz
					NextState <= RESETEADOR;
				end
			endcase		
		end
		
		//********************************************LOGICA DE SALIDA COMBINACIONAL*********************************************
		
		always @*
		begin
			case(State)
				RESETEADOR: begin  //***********ESTADO DE RESET DEL SISTEMA
					ResetInterfaz <=1;  
					ResetStart<=1;  
					ResetCoeffALUandInput<=1;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=0;  
					EnableSumALU<=0;  
					EnableMultALU<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=1;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=1;
					Listo<=0;
				end
				S1: begin  //***********ESTADO DE ESPERA  INICIO
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=0;  
					EnableSumALU<=0;  
					EnableMultALU<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S2: begin   // ****************ESTADO DE HABILITA EnableCoeffALUandInput
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=1; 
					SELCoeff<=0;  
					EnableSumALU<=0;  
					EnableMultALU<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end   
				S3: begin   // ***********SELCoeff = 00 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1       
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=0;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S4: begin   // ***********SELCoeff = 01 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1       
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=1;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S5: begin  // ***********SELCoeff = 02 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1 
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=2;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S6: begin  // ***********SELCoeff = 03 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=3;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S7: begin   // ***********SELCoeff = 04 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=4;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end   
				S8: begin  // ***********SELCoeff = 05 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1       
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=5;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S9: begin   // ***********SELCoeff = 06 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1       
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=6;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S10: begin  // ***********SELCoeff = 07 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=7;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S11: begin  /// ***********SELCoeff = 08 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=8;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S12: begin   // ***********SELCoeff = 09 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=9;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end   
				S13: begin   // ***********SELCoeff = 10 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=10;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S14: begin   // ***********SELCoeff = 11 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=11;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S15: begin  // ***********SELCoeff = 12 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=12;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S16: begin  // ***********SELCoeff = 13 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=13;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S17: begin   // ***********SELCoeff = 14 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=14;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end   
				S18: begin   // ***********SELCoeff = 15 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=15;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S19: begin   // ***********SELCoeff = 16 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=16;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S20: begin  // ***********SELCoeff = 17 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=17;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S21: begin  // ***********SELCoeff = 18 y EnableSumALU = 1, EnableMultALU = 1, EnableAcum = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=18;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S22: begin  // ***********SELCoeff = 19 y EnableSumALU = 1, EnableMultALU = 0, EnableAcum = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=19;  
					EnableSumALU<=1;  
					EnableMultALU<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end 
				S23: begin  // ***********SELCoeff = 20 y EnableSumALU = 1, EnableMultALU = 0, EnableAcum = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=20;  
					EnableSumALU<=1;  
					EnableMultALU<=0;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end 
				S24: begin  // ***********SELCoeff = xx y EnableSumALU = 0, EnableMultALU = 0, EnableAcum = 0
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=0;  
					EnableSumALU<=0;  
					EnableMultALU<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S25: begin  // ***********EnableFuncActivation = 1  EnableAcum = 0
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=0;  
					EnableSumALU<=0;  
					EnableMultALU<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=1;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S26: begin  // ***********EnableFuncActivation = 1  EnableAcum = 0 EnableRegisterOutput = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=0;  
					EnableSumALU<=0;  
					EnableMultALU<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=1;
					EnableRegisterOutput<=1; 
					ResetRegisterOutput<=0;
					Listo<=0;
				end
				S27: begin  // ***********EnableFuncActivation = 0  EnableAcum = 0 EnableRegisterOutput = 0, Listo = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=0;  
					EnableSumALU<=0;  
					EnableMultALU<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=1;
				end
				S28: begin   // ***********EnableFuncActivation = 0  EnableAcum = 0 EnableRegisterOutput = 0, Listo = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=0;  
					EnableSumALU<=0;  
					EnableMultALU<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=0;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=0;
					Listo<=1;
				end   
				S29: begin   // Estado de resetea todos los registros excepto el reset
					ResetInterfaz <=0;  
					ResetStart<=1;  
					ResetCoeffALUandInput<=1;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=0;  
					EnableSumALU<=0;  
					EnableMultALU<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=1;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=1;
					Listo<=0;
				end 
				default: begin  // Salidas por defecto iguales a la  del reset 
					ResetInterfaz <=1;  
					ResetStart<=1;  
					ResetCoeffALUandInput<=1;       
					EnableCoeffALUandInput<=0; 
					SELCoeff<=0;  
					EnableSumALU<=0;  
					EnableMultALU<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=1;
					EnableFuncActivacion<=0;
					EnableRegisterOutput<=0; 
					ResetRegisterOutput<=1;
					Listo<=0;
				end
			endcase		
		end
		
		
		
		
		

endmodule
