function [  ] = GraficarFuncActivationAprox( min,max,delta )

format long;
in = min:delta:max;
[col,fil]= size(in);


for i=1:fil
  outAprox(i)= FuncionActivacionAprox( in(1,i) );
end

for i=1:fil
  outReal(i)= sigmf(in(1,i), [1 0]);
end







plot(in,outAprox,in,outReal) 
grid 
%xlabel(entrada');ylabel('Aproximación') 


end

