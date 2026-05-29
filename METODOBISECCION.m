%METODO SECANTE
%ALUMNO: LUNA INFANTES FABRICIO
clc;
format long; %formato para que aparezcan hasta 15 decimales 
i=0;%contador de iteraciones
n=16;%numero maximo de iteraciones
tol=1;%tolerancia
p=0;
FP=0;
FA=0;
a=input('Limite inferior del intervalo:');%ingresa el limite inferior del intervalo
b=input('Limite superior del intervalo:');%ingresa el limite inferior del intervalo

function[result]=funci(x)%funcion que se desea averiguar la aproximacion
 result=x.^3+4*x.^2 - 10;
 return
endfunction

c=linspace(a,b);%guarda el intervalo
hold on %mantiene la grafica en la pantalla
plot(c,funci(c),'r-');%grafica la funcion en el intervalo


plot(a,funci(a),'b+-');%grafica el punto del limite inferior de la funcion
text(a,funci(a),strcat("(",num2str(a),",",num2str(funci(a)),")"));%num2str convierte a string un numero %strcat los concatena
plot(b,funci(b),'b+-');%grafica el punto del limite superior de la funcion
text(b,funci(b),strcat("(",num2str(b),",",num2str(funci(b)),")"));
title("METODO BISECCION");
FA=funci(a);%evalua el limite inferior del intervalo en la funcion y se le asigna a otra variable
while(i<n)
  p=a+(b-a)/2; %se halla el valor de la nueva aproximacion
  FP=func(p);%evalua la aproximacion en la funcion y se le asigna a otra variable
  if(FP==0 | (b-a)/2<tol)
  
    disp(p);%imprime las aproximaciones
    plot(p,funci(p),'mo');%grafica el punto aproximado de color magenta
    text(p,funci(p),strcat("(",num2str(p),",",num2str(funci(p)),")"));
    pause(0.8);%para graficar la aproximacion de manera lenta
  endif
  i=i+1; %el contador aumenta
  if(FA*FP>0)%si 
    a=p;%el limite inferior queda asignado por la nueva aproximacion
    FA=FP;
  else
  b=p;%el limite superior queda asignado por la nueva aproximacion
  endif
  hold on
  plot(a,funci(a),'bx-'); %marca los nuevos intervalos de color azul en forma de x
  plot(b,funci(b),'bx-');
endwhile
fprintf('El metodo fracaso despues de %d', n);
fprintf(' iteraciones');
hold off