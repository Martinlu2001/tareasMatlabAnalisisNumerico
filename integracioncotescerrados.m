%function Quadratura(f,a,b)
% Cuadraturas básicas
% % Datos
% f = el nombre de la función como string

%h = input("longitud del segmento");
%n = input("numero de segmentos");
% Resultados
% p=integración
pkg load symbolic;
warning off;
syms t;
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
 n=1;
 h = (b-a)/n;
 p1=0;
 p2=0;
 p3=0;
 p4=0;
 for i=1:2
   t=x(1)+(i-1)*h;
   p1=p1+h*eval(p)/2;
 endfor
 
 n=2;
 h = (b-a)/n;
 for i=1:3
   t=x(1)+(i-1)*h;
   if(i==2)
    p2=p2+4*h*eval(p)/3;
    else
      p2=p2+h*eval(p)/3;
   endif
 endfor
 
 n=3;
 h = (b-a)/n;
 for i=1:4
   t=x(1)+(i-1)*h;
   if(i==2 | i==3)
    p3=p3+9*h*eval(p)/8;
   else
    p3=p3+3*h*eval(p)/8;
   endif
 endfor
  
 n=4;
 h = (b-a)/n;
 for i=1:5
   t=x(1)+(i-1)*h;
   if(i==1 | i==5)
     p4=p4+2*h*7*eval(p)/45;
   endif
   if(i==2 | i==4)
      p4=p4+2*h*32*eval(p)/45;
   endif
   if(i==3)
      p4=p4+2*h*12*eval(p)/45;
   endif
 endfor
 %{
 n=1;
 h = (b-a)/n;
 p1=h*(feval(f,a)+feval(f,a+h))/2;
 n=2;
 h = (b-a)/n;
 p2=h*(feval(f,a)+4*feval(f,a+h)+feval(f,b))/3;
 n=3;
 h=(b-a)/n;
 p3=3*h*(feval(f,a)+3*feval(f,a+h)+3*feval(f,a+2*h)+feval(f,b))/8;
 n=4;
 h=(b-a)/n;
 p4=2*h*(7*feval(f,a)+32*feval(f,a+h)+12*feval(f,a+2*h)+32*feval(f,a+3*h)+7*feval(f,b))/45;
%}
 fprintf('Area Trapezoide : %10.5f\n',p1);
 fprintf('Area Simpson 1/3: %10.5f\n',p2);
 fprintf('Area Simpson 3/8: %10.5f\n',p3);
 fprintf('Area n=4: %10.5f\n',p4);
 %}