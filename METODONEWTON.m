%METODO DE NEWTON
%ALUMNO: LUNA INFANTES FABRICIO

clc;
format long;
aprox=0.5;%aproximacion
tol=1;%tolerancia
iter=10;%mnumero max de iteraciones
p=0;
i=1;%contador de iteraciones

function [result]=funcion(num)%se evalua el numero en la funcion
  result=cos(num)- num.^3;
  return
endfunction

function [result1]=derivate(num)%funcion derivada
  result1=-sin(num)-3*num.^2;
  return
endfunction

hold on
c=linspace(0,2);
plot(c,funcion(c),'r-');
plot(aprox,funcion(aprox),'bx-');% grafica las aprox iniciales
text(aprox,funcion(aprox),strcat("(",num2str(aprox),",",num2str(funcion(aprox)),")"));

while(i<=iter)
  p=aprox-(funcion(aprox)/derivate(aprox)); %se busca la nueva aproximacion
  if(abs(p-aprox)<tol)
    disp(p);%imprime la nueva aproximacion
    plot(p,funcion(p),'mo');%grafica el punto aproximado de color magenta
    text(p,funcion(p),strcat("(",num2str(p),",",num2str(funcion(p)),")"));
    pause(0.8);
  end
  i=i+1;%contador aumenta
  aprox=p;%el valor de la nueva aproximacion se le asigna a otra variable
end

fprintf('El metodo fracaso despues de %d',iter);
fprintf(' iteraciones');
hold off