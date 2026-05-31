pkg load symbolic;

format long;
clc;
warning off;
syms t;
x=linspace(0,1.5);%intervalo de x

t=x;
y=-t.^2 + 2*t;

hold on
subplot(2,1,1);
plot(t,y);
subplot(2,1,2);
plot(t,-y);
%}
#polyval(
axis([0,2.2,-1.5,1.5]);%intervalo de ejes