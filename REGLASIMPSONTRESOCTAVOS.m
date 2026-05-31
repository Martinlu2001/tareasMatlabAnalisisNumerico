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
 #h=(b-a)/n;
 dx=(b-a)/(3*n);
 s=0;
 i=1;
 while(i<=n) 
 t=a+(3*i-2)*dx;
 f1=eval(p);#farea(a+(3*i-2)*dx);
 t=a+(3*i-1)*dx;
 f2=eval(p);#farea(a+(3*i-1)*dx);
 t=a+(3*i)*dx;
 f3=eval(p);#farea(a+(3*i)*dx);
 s=s+(3*f1+ 3*f2+ 2*f3);
 i=i+1;
end
t=a;
 AT=(3/8)*dx*(eval(p)+s); #(3/8)*dx*(farea(a)-farea(b)+s);
 t=b;
 AT=AT-(3/8)*dx*(eval(p));
 disp('Area Total :');
 disp(AT);