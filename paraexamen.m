pkg load symbolic;
syms x
#fprintf("Integral analitica\n");
  #disp(int(p,2,10.66));
  %f=(x^2)*exp(x);
%disp(int(f,x));%integral indefinida
%y=int(f,x);
%disp(subs(y,x,1));%evaluando un punto
k=input('ingrese texto','s');
disp(k);
f=inline(k);%convierte el string a funcion
disp(int(f,x));%integral indefinida
y=int(f,x);
disp(int(f,0,1));%integral definida
a = input("límite inferior: ");
 b = input("límite superior: ");
 n=input('Ingrese el número de subintervalos: ');%par
 h=(b-a)/n;
sumai=0;
sumap=0;
for i=1:2:n-1
    t=h*i+a;
    sumai=sumai+feval(f,h*i+a);
end
for i=2:2:n-2
    t=h*i+a;
    sumap=sumap+feval(f,h*i+a);
end
%t=a;
%suma=(h/3)*(eval(p)+4*sumai+2*sumap);
suma=(h/3)*(feval(f,a)+4*sumai+2*sumap+feval(f,b));

%t=b;
%suma=suma+(h/3)*eval(p);
fprintf('Area Simpson 1/3: %10.5f\n',suma);