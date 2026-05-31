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
 
%{
k=(n-1)/2;
%if(mod(n-1,2)==0)
  h=x(2)-x(1);
  A=0;
  j=1;
  for i=1:k
    S=(h/3)*(y(j)+4*y(j+1)+y(j+2));
    A=A+S;
    j=j+2;
  endfor
  fprintf("Valor aproximado de la integral");
  disp(A);
%endif
%}
a = input("límite inferior: ");
 b = input("límite superior: ");
 n=input('Ingrese el número de subintervalos: ');%par
 h=(b-a)/n;
sumai=0;
sumap=0;
for i=1:2:n-1
    t=h*i+a;
    sumai=sumai+eval(p);%feval(f,h*i+a);
end
for i=2:2:n-2
    t=h*i+a;
    sumap=sumap+eval(p);%feval(f,h*i+a);
end
t=a;
suma=(h/3)*(eval(p)+4*sumai+2*sumap);
%int=(h/3)*(feval(f,a)+4*sumai+2*sumap+feval(f,b));

t=b;
suma=suma+(h/3)*eval(p);
fprintf('Area Simpson 1/3: %10.5f\n',suma);
%disp(['El resultado de la integral es ' num2str(suma)])