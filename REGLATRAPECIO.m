pkg load symbolic;
warning off;
syms t;
format long;
  %k=input("funcion",'s');
  %f=inline(k);
  fprintf('INTERPOLACION DE LAGRANGE"\n\n\n');
x=input('Ingrese los x: ');%escribir en forma de vector
y=input('Ingrese los y: ');%escribir en forma de vector
%hold on;
%plot(x,y);%grafica los puntos
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
    %disp(p);
  endfor
  #p=simplify(p);%simplica la expresion
  disp(p);
  fprintf("Integral analitica\n");
  disp(int(p,2,10.66));
  
  a = input("límite inferior: ");
 b = input("límite superior: ");
 n=input('Ingrese el número de subintervalos: ');
 h=(b-a)/n;
 p1=0;
 
 for i=1:n
   t=x(1)+(i-1)*h;
   for j=1:2
     p1=p1+h*eval(p)/2;
     t=x(1)+i*h;
   endfor
 endfor
 fprintf('Area Trapezoide : %10.5f\n',p1);