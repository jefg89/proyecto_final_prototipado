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
module FSMNeuralNetwork(CLK, reset,Start,Read,Address,ResetInterfaz,ResetStart,ResetCoeffALUandInput,       
	  EnableCoeffALUandInput,EnableMulX,SELCoeffX,EnableRegOutMultCoeffX,EnableFuctAct,EnableRegActFunc,
	  EnableMulY,EnableRegDesplazamiento,EnableSum,SELCoeffY,SELOffset,EnableAcumulador,ResetAcumulador,
	  Listo);
	 
	 input CLK;  
	 input reset;   
	 input Start;
	 input Read;
	 input [8:0] Address;
	 
	 output reg ResetInterfaz =0;  
	 output reg ResetStart=0;  
	 output reg ResetCoeffALUandInput=0;       
	 output reg EnableCoeffALUandInput=0; 
	 output reg EnableMulX=0;
    output reg [3:0] SELCoeffX=0;	 
	 output reg EnableRegOutMultCoeffX=0;
	 output reg EnableFuctAct=0;
	 output reg EnableRegActFunc=0;
	 output reg EnableMulY=0;
	 output reg EnableRegDesplazamiento=0;
	 output reg EnableSum=0;
	 output reg [3:0] SELCoeffY=0;
	 output reg SELOffset=0;  
	 output reg EnableAcumulador=0; 
	 output reg ResetAcumulador=0;
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
				S3: begin   // **********EnableMultX = 01 and EnableRegOutMultCoeffX = 01 SELCoeffX= 00
					NextState <= S4;
				end
				S4: begin   // **********EnableMultX = 01 and EnableRegOutMultCoeffX = 01 SELCoeffX= 01, EnableFuctAct=1, EnableRegFuctAct=1,    
					NextState <= S5;
				end
				S5: begin  // **********EnableMultX = 1 and EnableRegOutMultCoeffX = 1 SELCoeffX= 02, EnableFuctAct=1, EnableRegFuctAct=1, SELCoeffY =00, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1
					NextState <= S6;
				end
				S6: begin  // **********EnableMultX = 1 and EnableRegOutMultCoeffX = 1 SELCoeffX= 03, EnableFuctAct=1, EnableRegFuctAct=1, SELCoeffY =01, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1
					NextState <= S7;
				end
				S7: begin   // **********EnableMultX = 1 and EnableRegOutMultCoeffX = 1 SELCoeffX= 04, EnableFuctAct=1, EnableRegFuctAct=1, SELCoeffY =02, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1
					NextState <= S8;
				end   
				S8: begin  // **********EnableMultX = 1 and EnableRegOutMultCoeffX = 1 SELCoeffX= 05, EnableFuctAct=1, EnableRegFuctAct=1, SELCoeffY =03, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1      
					NextState <= S9;
				end
				S9: begin   // **********EnableMultX = 1 and EnableRegOutMultCoeffX = 1 SELCoeffX= 06, EnableFuctAct=1, EnableRegFuctAct=1, SELCoeffY =04, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1        
					NextState <= S10;
				end
				S10: begin  // **********EnableMultX = 1 and EnableRegOutMultCoeffX = 1 SELCoeffX= 07, EnableFuctAct=1, EnableRegFuctAct=1, SELCoeffY =05, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1 
					NextState <= S11;
				end
				S11: begin  // **********EnableMultX = 1 and EnableRegOutMultCoeffX = 1 SELCoeffX= 08, EnableFuctAct=1, EnableRegFuctAct=1, SELCoeffY =06, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1 
					NextState <= S12;
				end
				S12: begin   // **********EnableMultX = 1 and EnableRegOutMultCoeffX = 1 SELCoeffX= 09, EnableFuctAct=1, EnableRegFuctAct=1, SELCoeffY =07, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1
					NextState <= S13;
				end   
				S13: begin   // **********EnableMultX = 0 and EnableRegOutMultCoeffX = 0 SELCoeffX= 00, EnableFuctAct=1, EnableRegFuctAct=1, SELCoeffY =08, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1
					NextState <= S14;
				end
				S14: begin   // **********EnableMultX = 0 and EnableRegOutMultCoeffX = 0 SELCoeffX= 00, EnableFuctAct=0, EnableRegFuctAct=0, SELCoeffY =09, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1
					NextState <= S15;
				end
				S15: begin  // **********EnableMultX = 0 and EnableRegOutMultCoeffX = 0 SELCoeffX= 00, EnableFuctAct=0, EnableRegFuctAct=0, SELCoeffY =00, EnableMultY=0,EnableSum=1,EnableRegDesplazamientro=0,SELOffset =1, Enable Acum=1
					NextState <= S16;
				end
				S16: begin  // **********EnableMultX = 0 and EnableRegOutMultCoeffX = 0 SELCoeffX= 00, EnableFuctAct=0, EnableRegFuctAct=0, SELCoeffY =00, EnableMultY=0,EnableSum=0,EnableRegDesplazamientro=0,SELOffset =0, Enable Acum=0, Listo = 1
					if(Address==9'h050 && Read == 1'b1) NextState <= 17; // Direccion de memoria donde se hace la ultima lectura
					else NextState <= S16;
				end
				S17: begin   // **********EnableMultX = 0 and EnableRegOutMultCoeffX = 0 SELCoeffX= 00, EnableFuctAct=0, EnableRegFuctAct=0, SELCoeffY =00, EnableMultY=0,EnableSum=0,EnableRegDesplazamientro=0,SELOffset =0, Enable Acum=0, Listo = 1
					if(Address==9'h050 && Read == 1'b1) NextState <= S17; // Direccion de memoria donde se hace la ultima lectura
					else NextState <= S18;
				end  
				S18: begin   // Estado de resetea todos los registros excepto el resetInterfaz
					NextState <= S1;
				end 
				default: begin  // Salidas por defecto iguales a la  del reset
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
					EnableMulX<=0;
					SELCoeffX<=0;	 
					EnableRegOutMultCoeffX<=0;
					EnableFuctAct<=0;
					EnableRegActFunc<=0;
					EnableMulY<=0;
					EnableRegDesplazamiento<=0;
					EnableSum<=0;
					SELCoeffY<=0;
					SELOffset<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=1;
					Listo<=0;
				end
				S1: begin  //***********ESTADO DE ESPERA  INICIO
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					EnableMulX<=0;
					SELCoeffX<=0;	 
					EnableRegOutMultCoeffX<=0;
					EnableFuctAct<=0;
					EnableRegActFunc<=0;
					EnableMulY<=0;
					EnableRegDesplazamiento<=0;
					EnableSum<=0;
					SELCoeffY<=0;
					SELOffset<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=0;
					Listo<=0;
				end
				S2: begin   // ****************ESTADO DE HABILITA EnableCoeffALUandInput
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=1; 
					EnableMulX<=0;
					SELCoeffX<=0;	 
					EnableRegOutMultCoeffX<=0;
					EnableFuctAct<=0;
					EnableRegActFunc<=0;
					EnableMulY<=0;
					EnableRegDesplazamiento<=0;
					EnableSum<=0;
					SELCoeffY<=0;
					SELOffset<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=0;
					Listo<=0;
				end   
				S3: begin   // **********EnableMultX = 01 and EnableRegOutMultCoeffX = 01 SELCoeffX= 00
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					EnableMulX<=1;
					SELCoeffX<=0;	 
					EnableRegOutMultCoeffX<=1;
					EnableFuctAct<=0;
					EnableRegActFunc<=0;
					EnableMulY<=0;
					EnableRegDesplazamiento<=0;
					EnableSum<=0;
					SELCoeffY<=0;
					SELOffset<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=0;
					Listo<=0;
				end
				S4: begin   // **********EnableMultX = 01 and EnableRegOutMultCoeffX = 01 SELCoeffX= 01, EnableFuctAct=1, EnableRegFuctAct=1,    
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					EnableMulX<=1;
					SELCoeffX<=1;	 
					EnableRegOutMultCoeffX<=1;
					EnableFuctAct<=1;
					EnableRegActFunc<=1;
					EnableMulY<=0;
					EnableRegDesplazamiento<=0;
					EnableSum<=0;
					SELCoeffY<=0;
					SELOffset<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=0;
					Listo<=0;
				end
				S5: begin  // **********EnableMultX = 1 and EnableRegOutMultCoeffX = 1 SELCoeffX= 02, EnableFuctAct=1, EnableRegFuctAct=1, SELCoeffY =00, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					EnableMulX<=1;
					SELCoeffX<=2;	 
					EnableRegOutMultCoeffX<=1;
					EnableFuctAct<=1;
					EnableRegActFunc<=1;
					EnableMulY<=1;
					EnableRegDesplazamiento<=1;
					EnableSum<=1;
					SELCoeffY<=0;
					SELOffset<=0;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					Listo<=0;
				end
				S6: begin  // **********EnableMultX = 1 and EnableRegOutMultCoeffX = 1 SELCoeffX= 03, EnableFuctAct=1, EnableRegFuctAct=1, SELCoeffY =01, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					EnableMulX<=1;
					SELCoeffX<=3;	 
					EnableRegOutMultCoeffX<=1;
					EnableFuctAct<=1;
					EnableRegActFunc<=1;
					EnableMulY<=1;
					EnableRegDesplazamiento<=1;
					EnableSum<=1;
					SELCoeffY<=1;
					SELOffset<=0;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					Listo<=0;
				end
				S7: begin   // **********EnableMultX = 1 and EnableRegOutMultCoeffX = 1 SELCoeffX= 04, EnableFuctAct=1, EnableRegFuctAct=1, SELCoeffY =02, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					EnableMulX<=1;
					SELCoeffX<=4;	 
					EnableRegOutMultCoeffX<=1;
					EnableFuctAct<=1;
					EnableRegActFunc<=1;
					EnableMulY<=1;
					EnableRegDesplazamiento<=1;
					EnableSum<=1;
					SELCoeffY<=2;
					SELOffset<=0;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					Listo<=0;
				end   
				S8: begin  // **********EnableMultX = 1 and EnableRegOutMultCoeffX = 1 SELCoeffX= 05, EnableFuctAct=1, EnableRegFuctAct=1, SELCoeffY =03, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1      
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					EnableMulX<=1;
					SELCoeffX<=5;	 
					EnableRegOutMultCoeffX<=1;
					EnableFuctAct<=1;
					EnableRegActFunc<=1;
					EnableMulY<=1;
					EnableRegDesplazamiento<=1;
					EnableSum<=1;
					SELCoeffY<=3;
					SELOffset<=0;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					Listo<=0;
				end
				S9: begin   // **********EnableMultX = 1 and EnableRegOutMultCoeffX = 1 SELCoeffX= 06, EnableFuctAct=1, EnableRegFuctAct=1, SELCoeffY =04, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1        
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					EnableMulX<=1;
					SELCoeffX<=6;	 
					EnableRegOutMultCoeffX<=1;
					EnableFuctAct<=1;
					EnableRegActFunc<=1;
					EnableMulY<=1;
					EnableRegDesplazamiento<=1;
					EnableSum<=1;
					SELCoeffY<=4;
					SELOffset<=0;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					Listo<=0;
				end
				S10: begin  // **********EnableMultX = 1 and EnableRegOutMultCoeffX = 1 SELCoeffX= 07, EnableFuctAct=1, EnableRegFuctAct=1, SELCoeffY =05, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1 
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					EnableMulX<=1;
					SELCoeffX<=7;	 
					EnableRegOutMultCoeffX<=1;
					EnableFuctAct<=1;
					EnableRegActFunc<=1;
					EnableMulY<=1;
					EnableRegDesplazamiento<=1;
					EnableSum<=1;
					SELCoeffY<=5;
					SELOffset<=0;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					Listo<=0;
				end
				S11: begin  // **********EnableMultX = 1 and EnableRegOutMultCoeffX = 1 SELCoeffX= 08, EnableFuctAct=1, EnableRegFuctAct=1, SELCoeffY =06, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1 
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					EnableMulX<=1;
					SELCoeffX<=8;	 
					EnableRegOutMultCoeffX<=1;
					EnableFuctAct<=1;
					EnableRegActFunc<=1;
					EnableMulY<=1;
					EnableRegDesplazamiento<=1;
					EnableSum<=1;
					SELCoeffY<=6;
					SELOffset<=0;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					Listo<=0;
				end
				S12: begin   // **********EnableMultX = 1 and EnableRegOutMultCoeffX = 1 SELCoeffX= 09, EnableFuctAct=1, EnableRegFuctAct=1, SELCoeffY =07, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					EnableMulX<=1;
					SELCoeffX<=9;	 
					EnableRegOutMultCoeffX<=1;
					EnableFuctAct<=1;
					EnableRegActFunc<=1;
					EnableMulY<=1;
					EnableRegDesplazamiento<=1;
					EnableSum<=1;
					SELCoeffY<=7;
					SELOffset<=0;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					Listo<=0;
				end   
				S13: begin   // **********EnableMultX = 0 and EnableRegOutMultCoeffX = 0 SELCoeffX= 00, EnableFuctAct=1, EnableRegFuctAct=1, SELCoeffY =08, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					EnableMulX<=0;
					SELCoeffX<=0;	 
					EnableRegOutMultCoeffX<=0;
					EnableFuctAct<=1;
					EnableRegActFunc<=1;
					EnableMulY<=1;
					EnableRegDesplazamiento<=1;
					EnableSum<=1;
					SELCoeffY<=8;
					SELOffset<=0;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					Listo<=0;
				end
				S14: begin   // **********EnableMultX = 0 and EnableRegOutMultCoeffX = 0 SELCoeffX= 00, EnableFuctAct=0, EnableRegFuctAct=0, SELCoeffY =09, EnableMultY=1,EnableSum=1,EnableRegDesplazamientro=1,SELOffset =0, Enable Acum=1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					EnableMulX<=0;
					SELCoeffX<=0;	 
					EnableRegOutMultCoeffX<=0;
					EnableFuctAct<=0;
					EnableRegActFunc<=0;
					EnableMulY<=1;
					EnableRegDesplazamiento<=1;
					EnableSum<=1;
					SELCoeffY<=9;
					SELOffset<=0;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					Listo<=0;
				end
				S15: begin  // **********EnableMultX = 0 and EnableRegOutMultCoeffX = 0 SELCoeffX= 00, EnableFuctAct=0, EnableRegFuctAct=0, SELCoeffY =00, EnableMultY=0,EnableSum=1,EnableRegDesplazamientro=0,SELOffset =1, Enable Acum=1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					EnableMulX<=0;
					SELCoeffX<=0;	 
					EnableRegOutMultCoeffX<=0;
					EnableFuctAct<=0;
					EnableRegActFunc<=0;
					EnableMulY<=0;
					EnableRegDesplazamiento<=0;
					EnableSum<=1;
					SELCoeffY<=0;
					SELOffset<=1;  
					EnableAcumulador<=1; 
					ResetAcumulador<=0;
					Listo<=0;
				end
				S16: begin  // **********EnableMultX = 0 and EnableRegOutMultCoeffX = 0 SELCoeffX= 00, EnableFuctAct=0, EnableRegFuctAct=0, SELCoeffY =00, EnableMultY=0,EnableSum=0,EnableRegDesplazamientro=0,SELOffset =0, Enable Acum=0, Listo = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					EnableMulX<=0;
					SELCoeffX<=0;	 
					EnableRegOutMultCoeffX<=0;
					EnableFuctAct<=0;
					EnableRegActFunc<=0;
					EnableMulY<=0;
					EnableRegDesplazamiento<=0;
					EnableSum<=0;
					SELCoeffY<=0;
					SELOffset<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=0;
					Listo<=1;
				end
				S17: begin   // **********EnableMultX = 0 and EnableRegOutMultCoeffX = 0 SELCoeffX= 00, EnableFuctAct=0, EnableRegFuctAct=0, SELCoeffY =00, EnableMultY=0,EnableSum=0,EnableRegDesplazamientro=0,SELOffset =0, Enable Acum=0, Listo = 1
					ResetInterfaz <=0;  
					ResetStart<=0;  
					ResetCoeffALUandInput<=0;       
					EnableCoeffALUandInput<=0; 
					EnableMulX<=0;
					SELCoeffX<=0;	 
					EnableRegOutMultCoeffX<=0;
					EnableFuctAct<=0;
					EnableRegActFunc<=0;
					EnableMulY<=0;
					EnableRegDesplazamiento<=0;
					EnableSum<=0;
					SELCoeffY<=0;
					SELOffset<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=0;
					Listo<=1;
				end  
				S18: begin   // Estado de resetea todos los registros excepto el resetInterfaz
					ResetInterfaz <=0;  
					ResetStart<=1;  
					ResetCoeffALUandInput<=1;       
					EnableCoeffALUandInput<=0; 
					EnableMulX<=0;
					SELCoeffX<=0;	 
					EnableRegOutMultCoeffX<=0;
					EnableFuctAct<=0;
					EnableRegActFunc<=0;
					EnableMulY<=0;
					EnableRegDesplazamiento<=0;
					EnableSum<=0;
					SELCoeffY<=0;
					SELOffset<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=1;
					Listo<=0;
				end 
				default: begin  // Salidas por defecto iguales a la  del reset
					ResetInterfaz <=1;  
					ResetStart<=1;  
					ResetCoeffALUandInput<=1;       
					EnableCoeffALUandInput<=0; 
					EnableMulX<=0;
					SELCoeffX<=0;	 
					EnableRegOutMultCoeffX<=0;
					EnableFuctAct<=0;
					EnableRegActFunc<=0;
					EnableMulY<=0;
					EnableRegDesplazamiento<=0;
					EnableSum<=0;
					SELCoeffY<=0;
					SELOffset<=0;  
					EnableAcumulador<=0; 
					ResetAcumulador<=1;
					Listo<=0;
				end
			endcase			
		end
		
		
		
		
		

endmodule
