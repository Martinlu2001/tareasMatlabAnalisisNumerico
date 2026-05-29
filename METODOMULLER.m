%metodo Muller
%ALUMNO: LUNA INFANTES FABRICIO
%aproximaciones
clc;
format long;
p0=1.5;%primera aproximacion
p1=2;%segundaa aproximacion
p2=2.5;%tercera aproximacion
tol=1;%tolerancia
iter=10;%numero maximo de iteraciones
%p=0;%solucion aproximada
function[result]=funcion(x)%funcion que se desea averiguar la aproximacion
 result=x.^4 - 3*x.^3 +x.^2 + x + 1;
 return
endfunction

hold on
c=linspace(1,3);
plot(c,funcion(c),'r-');
plot(p0,funcion(p0),'bx-');% grafica las aprox iniciales
text(p0,funcion(p0),strcat("(",num2str(p0),",",num2str(funcion(p0)),")"));
plot(p1,funcion(p1),'bx-');
text(p1,funcion(p1),strcat("(",num2str(p1),",",num2str(funcion(p1)),")"));
plot(p2,funcion(p2),'bx-');
text(p2,funcion(p2),strcat("(",num2str(p2),",",num2str(funcion(p2)),")"));
title("METODO MULLER");
h1=p1-p0;%se le asigna el valor de la resta de las dos primeras aproximaciones
h2=p2-p1;%se le asigna el valor de la resta de las dos ultimas aproximaciones
delta1=(funcion(p1)-funcion(p0))/h1;
delta2=(funcion(p2)-funcion(p1))/h2;
d=(delta2-delta1)/(h1+h2);
i=3;%contador de iteraciones
while(i<=iter)
  b=delta2+h2*d;
  D=sqrt(b^2-4*funcion(p2)*d);
  if(abs(b-D)<abs(b+D))%si esto ocurre
    E=b+D;%E toma el valor de la suma
  else%de lo contrario
    E=b-D;%E toma el valor de la diferencia
  end
  h=-2*funcion(p2)/E;
  p=p2+h;%la aproximacion toma un nuevo valor
  if(abs(h)<tol)
    disp(p);%imprime las aproximaciones
    plot(p,funcion(p),'mo');%grafica el punto aproximado de color magenta
    text(p,funcion(p),strcat("(",num2str(p),",",num2str(funcion(p)),")"));
    pause(0.8);
  endif
  p0=p1;%la primera aproximacion inicial toma el valor de la segunda
  p1=p2;%la segunda aproximacion inicial toma el valor de la tercera
  p2=p;%la tercera aproximacion inicial toma el valor de la nueva aproximacion
  h1=p1-p0;
  h2=p2-p1;
  delta1=(funcion(p1)-funcion(p0))/h1;
  delta2=(funcion(p2)-funcion(p1))/h2;
  d=(delta2-delta1)/(h1+h2);
  i=i+1;%el contador aumenta
endwhile
fprintf('El metodo se detuvo despues de %d',iter);
fprintf(' iteraciones');
hold off