pkg load symbolic;
clc;
%{
f=cos(x)-x^3;
df=diff(f,x);
disp(df);comentario multiple
disp(subs(f,x,3));
disp(subs(df,x,3.14));
%}
warning off;
%{
k=input('ingrese texto','s');
disp(k);
f=inline(k);%convierte el string a funcion
disp(f);
x=-2:2;
c=f(x);
disp(c);
%}
syms x
f=x^2+x+3;
disp(int(f,x));%integral indefinida
y=int(f,x);
disp(subs(y,x,1));%evaluando un punto
disp(int(f,0,1));%integral definida