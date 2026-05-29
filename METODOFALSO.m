%METODO FALSO
%ALUMNO: LUNA INFANTES FABRICIO
clc;
format long;
aprox0=0.5;%primera aproximacion
aprox1=pi/4;%segundaa aproximacion
tol=1; %tolerancia
iter=16;%numero maximo de iteraciones
i=2;%contador de iteraciones
q=0;
function[result]=funcfalso(x)%funcion que se desea averiguar la aproximacion
  result=cos(x)-x;
return
endfunction

c=linspace(aprox0,aprox1);%guarda el intervalo para la grafica
hold on %mantiene la grafica en la pantalla
plot(c,funcfalso(c),'r-');%grafica la funcion en el intervalo
plot(aprox0,funcfalso(aprox0),'bx-');%grafica las primeras aprox
text(aprox0,funcfalso(aprox0),strcat("(",num2str(aprox0),",",num2str(funcfalso(aprox0)),")"));
plot(aprox1,funcfalso(aprox1),'bx-');
text(aprox1,funcfalso(aprox1),strcat("(",num2str(aprox1),",",num2str(funcfalso(aprox1)),")"));
q0=funcfalso(aprox0);%evalua la primera aproximacion en la funcion y se le asigna a otra variable
q1=funcfalso(aprox1);%evalua la segunda aproximacion en la funcion y se le asigna a otra variable

while(i<=iter)
  p=aprox1-(q1*(aprox1-aprox0))/(q1-q0); %se halla el valor de la nueva aproximacion
  
  if(abs(p-aprox1)<tol)
    disp(p);%imprime las aproximaciones
    plot(p,funcfalso(p),'mo');%grafica el punto aproximado de color magenta
    text(p,funcfalso(p),strcat("(",num2str(p),",",num2str(funcfalso(p)),")"));
    pause(0.8);%para graficar la aproximacion de manera lenta
  endif
  i=i+1;%el contador aumenta
  q=funcfalso(p);%evalua la aproximacion en la funcion y se le asigna a una nueva variable
  
  if(q*q1<0)
    aprox0=aprox1;%la primera aproximacion inicial toma el valor de la segunda
    q0=q1;
  endif
  aprox1=p;%la segunda aproximacion inicial toma el valor de la nueva aproximacion
  q1=q;
endwhile
fprintf('El metodo fracaso despues de %d', iter);
fprintf(' iteraciones');
hold off