%metodo Steffensen
%ALUMNO: LUNA INFANTES FABRICIO
clc;
format long;
p0=1.5;%aprox inicial
tol=1;%tolerancia
iter=10;%numero iteraciones
p=0;%solucion aprox
i=1;%contador de iteraciones
function [result]=funcions(x)%funcion que se desea averiguar la aproximacion
  result=sqrt(10./(x + 4));
  return
endfunction

c=1:0.1:2;%guarda el intervalo para la grafica

hold on
plot(c,funcions(c),'r-');%grafica la funcion en el intervalo
plot(p0,funcions(p0),'bx-');
text(p0,funcions(p0),strcat("(",num2str(p0),",",num2str(funcions(p0)),")"));

while(i<=iter)
  p1=funcions(p0);%recibe el valor de la funcion evaluada en la aproximacion inicial
  p2=funcions(p1);%recibe el valor de la funcion evaluada en el resultado de la aproximacion inicial
  p=p0-(((p1-p0)^2)/(p2-2*p1+p0)); %se halla el valor de la nueva aproximacion
  if(abs(p-p0)<tol)
    disp(p);%imprime las aproximaciones
    plot(p,funcions(p),'mo');%grafica el punto aproximado de color magenta
    text(p,funcions(p),strcat("(",num2str(p),",",num2str(funcions(p)),")"));
    pause(0.8);%para graficar la aproximacion de manera lenta
    fprintf('\n');
  end
  i=i+1; %el contador aumenta
  p0=p;%la aproximacion inicial toma el valor de la nueva aproximacion
end
fprintf('El metodo se detuvo despues de %d',iter);
fprintf(' iteraciones');
hold off