

function [  ] = sigmoidalfunc(min,max,delta )

format long;

 
 x = (min:delta:max)';
 % sigmf(X, [A, C]) = 1./(1 + EXP(-A*(X-C)))
 y1 = sigmf(x, [1 0]);
 plot(x, y1);
 
 
 fd1=fopen('RangoEntrada.txt','wt');
 
 cont = min;
 format long;
 while(cont<=max+0.00000000001)
     fprintf(fd1,'%d\n',cont);
     %fprintf('Variable cont que se almacena: %d\n',cont);
     out=sigmf(x, [1 0]);
     cont = cont + delta;
     %fprintf('Variable cont que se almacena despues incremento: %d\n',cont);
 end
 fclose(fd1);
 
 
 fd2=fopen('RangoSalida.txt','wt');
 largo=length(out);
 for i=1:largo
     fprintf(fd2,'%d\n',out(i));
 end
 fclose(fd2);
 
end