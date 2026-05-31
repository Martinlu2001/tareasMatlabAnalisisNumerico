%INTRODUCIENDO LOS DATOS A LA MATRIZ
a=input('Ingrese el primer rango: ');
fprintf('\n');
b=input('Ingrese el segundo rango: ');
fprintf('\n');
c=input('Ingrese la amplitud: ');
fprintf('\n');
x=linspace(a, b, c);
y=x.^2 + 3;
plot(x,y);