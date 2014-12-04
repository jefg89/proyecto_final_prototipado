%Instituto Tecnologico de Costa Rica
%Mauricio Carvajal Delgado
function [outb] = d2bFijo(in)
%FUNCION PARA GENERAR EL NUMERO BINARIO (SIGNO ENTERO-2BITS- FRACCION-13BITS-)
%
%     [SALIDA] = d2bFijo(ENTRADA)
%
format long
entero = abs(fix(in));  %toma la parte entera del numero de entrada

if(in>=0)
    signo = 0;
else
    signo = 1;
end

tmp1=dec2bin(entero,7); %Voy a cambiar aqui aun 4 Carlos, se debe poner en el número de bits que se desea la presición

out=[num2str(tmp1)];

tmp2= abs(in - fix(in));  %toma la parte fraccionaria del numero de entrada

for i=1:24             %Voy a cambiar aqui aun 19 en lugar de 13 Carlos se debe poner en el numero que se desea la precision
    tmp1=fix(tmp2/(2^(-i)));
    out=[out num2str(tmp1)];
    if(tmp1==1)
        tmp2=tmp2-(2^(-i));
    end    
end
if(in<0)
    tmp2=[];
    for i=1:31      % Esta funcion realiza el complemento a 2
                % Cambie el 15 por un 23 Se debe poner en el numero de bits
                % utilidos sin incluir el signo ejemplo Palabra 2 bits sin
                % contar signo son 23
       if(out(i)=='1')
           tmp2=[tmp2,'0'];
       else
           tmp2=[tmp2,'1'];
       end
   end
   tmp=bin2dec(tmp2)+1;
   out=dec2bin(tmp,23); % Se debe poner en el numero de bits de magnitud y presicion no contar signo
end

outb=[num2str(signo) out];
out=outb;
out4={out(13) out(14) out(15) out(16)};
out4=strcat(out(13),out(14),out(15),out(16));
out3={out(9) out(10) out(11) out(12)};
out3=strcat(out(9),out(10),out(11),out(12));
out2={out(5) out(6) out(7) out(8)};
out2=strcat(out(5),out(6),out(7),out(8));
out1={out(1) out(2) out(3) out(4)};
out1=strcat(out(1),out(2),out(3),out(4));

mat_1=['0000';
    '0001';
    '0010';
    '0011';
    '0100';
    '0101';
    '0110';
    '0111';
    '1000';
    '1001';
    '1010';
    '1011';
    '1100';
    '1101';
    '1110';
    '1111';];

mat_2='0123456789ABCDEF';

for i=1:16
    if(out4==mat_1(i,:))
        out4H=mat_2(i);
    end
end
for i=1:16
    if(out3==mat_1(i,:))
        out3H=mat_2(i);
    end
end
for i=1:16
    if(out2==mat_1(i,:))
        out2H=mat_2(i);
    end
end
for i=1:16
    if(out1==mat_1(i,:))
        out1H=mat_2(i);
    end
end

%out={out1H,out2H,out3H,out4H};
outh=strcat(out1H,out2H,out3H,out4H);

end
