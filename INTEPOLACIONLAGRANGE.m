%INTERPOLACION LAGRANGE
%Alumno: Fabricio Luna Infantes
pkg load symbolic;
clc;
warning off;
fprintf('INTERPOLACION DE LAGRANGE"\n\n\n');
x=input('Ingrese los x: ');%escribir en forma de vector
y=input('Ingrese los y: ');%escribir en forma de vector
hold on;
plot(x,y);%grafica los puntos
p=0;
n=length(x);%tamaño del vector
syms t;% variable simbolica t
  for i=1:n
    M=1;%multiplicador en la formacion del polinomio
    for j=1:n
      if(i~=j)%deben ser diferentes para que el denominador no sea 0
        M=M*(t-x(j))/(x(i)-x(j));%se calcula el producto en el numerador y denominador
        M=simplify(M);
      endif
    endfor
    p=p+M*y(i);%se va formando la suma del polinomio
  endfor
  p=simplify(p);%simplica la expresion
  disp(p);
  ezplot(p);%grafica el polinomio
  t=input('Ingrese el punto a aproximar: ');
  y=eval(p);%evalua el punto en el polinomio
  disp('La aproximacion a f(x) es:');
  disp(y);

hold off