%INTERPOLACION NEWTON O DIFERENCIAS DIVIDIDAS
%Alumno: Fabricio Luna Infantes
%{
TABLA DE DATOS PARA INGRESAR, copiar y pegar (tabla 3.10 libro Richard burden)
x=[1 1.3 1.6 1.9 2.2]
f(x(0))=0.7651977
f(x(1))=0.6200860
f(x(2))=0.4554022
f(x(3))=0.2818186
f(x(4))=0.1103623
%}
pkg load symbolic;
clc;
syms x;
warning off;
n = input('Ingrese el numero de elementos:  ');%se ingresa un valor menos al numero de elementos que se desea
 matriz = zeros(n+1,n+1);% se crea una matriz de ceros
 vector=input('Ingrese los x: ');%se ingresan los valores x en forma de vector []
 
 for i = 0:n
   fprintf('Ingrese f(x(%d)):  \n', i);
   matriz(i+1,1) = input(' ');%se ingresan los valores Y
 endfor
  
 for i = 1:n
    for j = 1:i %se van rellenando las columnas de la matriz
       matriz(i+1,j+1) = (matriz(i+1,j)-matriz(i,j))/(vector(i+1)-vector(i+1-j));%se realizan las diferencias entre los Y y los X
    endfor
 endfor

 fprintf('Tabla de interpolacion: \n');%se imprime los valores de la interpolacion en una tabla
 for i = 0:n
    fprintf('%11.6f ', vector(i+1));
    for j = 0:i
       fprintf('%11.6f ', matriz(i+1,j+1));
    endfor
    fprintf('\n');
 endfor
 
 fprintf("\nObtencion del polinomio: \n");
 p=matriz(1,1);%el primer elemento de la matriz se asigna
 for i=1:(n+1)
    L=1;
    for j=1:(i-1)
        L=L*(x-vector(j)); %se van formando los productos q acompañan al coeficiente
    endfor
    if(i==1)%el primer coeficiente no se multiplica por x 
      L=0;
    endif
    p=p+L*matriz(i,i);%se va formando la suma del polinomio
endfor
p=simplify(p);%simplificacion
disp(p);
  