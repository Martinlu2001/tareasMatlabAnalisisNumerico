%METODO SECANTE
%ALUMNO: LUNA INFANTES FABRICIO
clc;
format long; %formato para que aparezcan hasta 15 decimales 
aprox1=0.5; %primera aproximacion
aprox2=pi/4; %segundaa aproximacion
tol=1; %tolerancia
iter=16; %numero maximo de iteraciones
i=2; %contador de iteraciones

function[const,pendiente]=calcularconstante(ab1,ord1,ab2,ord2)%encuentra la la pendiente de la recta que pasa por aproximaciones
  pendiente=(ord2-ord1)/(ab2-ab1);
  const=ord1-pendiente*ab1;
  return
endfunction

function[result1]=funcionlineal(d,const,pendiente)%calcula la recta que pasa por aprox iniciales
  result1=pendiente*d + const;
  return
endfunction

function[result]=funct(x) %funcion que se desea averiguar la aproximacion
  result=cos(x)-x;
return
endfunction

c=-1:0.1:1;%intervalo para graficar la funcion
 hold on
 plot(c,funct(c),'r-');%grafica la funcion en el intervalo
 d=aprox1:0.1:aprox2; %grafica la recta que pasa por las aprox iniciales
  [const,pendiente]=calcularconstante(aprox1,funct(aprox1),aprox2,funct(aprox2));
  plot(d,funcionlineal(d,const,pendiente),'b-');
 plot(aprox1,funct(aprox1),'g+');%grafica las aproximaciones iniciales
 text(aprox1,funct(aprox1),strcat("(",num2str(aprox1),",",num2str(funct(aprox1)),")"));
 plot(aprox2,funct(aprox2),'g+');
 text(aprox2,funct(aprox2),strcat("(",num2str(aprox2),",",num2str(funct(aprox2)),")"));

q0=funct(aprox1); %evalua la primera aproximacion en la funcion y se le asigna a otra variable
q1=funct(aprox2);%evalua la segunda aproximacion en la funcion y se le asigna a otra variable

while(i<=iter)
  p=aprox2-(q1*(aprox2-aprox1))/(q1-q0); %se halla el valor de la nueva aproximacion
  if(abs(p-aprox2)<tol) 
    disp(p); %imprime las aproximaciones
    plot(p,funct(p),'mo');%grafica el punto aproximado de color magenta
    text(p,funct(p),strcat("(",num2str(p),",",num2str(funct(p)),")"));
    pause(0.8);%para graficar la aproximacion de manera lenta
  endif
  i=i+1; %el contador aumenta
  aprox1=aprox2; %la primera aproximacion inicial toma el valor de la segunda
  q0=q1;
  aprox2=p;%la segunda aproximacion inicial toma el valor de la nueva aproximacion
  q1=funct(p);
endwhile
fprintf('El metodo fracaso despues de %d', iter); %muestra el numero de iteraciones
fprintf(' iteraciones');
hold off