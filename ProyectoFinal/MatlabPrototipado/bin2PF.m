function [out] = bin2PF(in)
%FUNCION PARA GENERAR EL NUMERO PUNTO FIJO (SIGNO ENTERO-2BITS- FRACCION-13BITS-)
%Las entradas deben ser binario de 24 bits
%La salida es una cadena de caracteres
%
%     [SALIDA] =  bin2PF('ENTRADA')

%%
format long
pot=6;          %valor de la potencia Carlos aqui se pone la potencia mas alta de la magnitud
out=0; 
% Esta funcion elimina el bit de signo
%tmp1=[in(2) in(3) in(4) in(5) in(6) in(7) in(8) in(9) in(10) in(11) in(12)
%in(13) in(14) in(15) in(16)]; Asi lo teenia Mau
 
tmp1=[in(2) in(3) in(4) in(5) in(6) in(7) in(8) in(9) in(10) in(11) in(12) in(13) in(14) in(15) in(16) in(17) in(18) in(19) in(20) in(21) in(22) in(23) in(24) in(25) in(26) in(27) in(28) in(29) in(30) in(31) in(32)];
% CarlosSe pone que llegue hasta 24
if(in(1)=='1')
    signo=-1;
    tmp2=[];
    for i=1:31      % Esta funcion realiza el complemento a 2 Carlos se pone en numero de bits magnitud mas precision
       if(tmp1(i)=='1')
           tmp2=[tmp2 '0'];
       else
           tmp2=[tmp2 '1'];
       end
   end
   tmp=bin2dec(tmp2)+1;
   tmp1=dec2bin(tmp,31); % Carlos Se pone en numero de bits magnitud mas presicion
    
else 
        signo=1;
end

for i=1:31  % Carlos Se pone en numero de bits magnitud mas presicion
    if(tmp1(i)=='1')
       out=out+2^pot;
    end
    pot=pot-1;
 end
    
out=out*signo;
end


