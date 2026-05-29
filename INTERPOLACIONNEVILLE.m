%INTERPOLACION NEVILLE
%Alumno: Fabricio Luna Infantes
clc;
 n = input('Ingrese el numero de elementos:  ');%escribir un valor menos al numero de elementos deseado
 vector = zeros(1,n+1);% se crea un vector de ceros
 matriz = zeros(n+1,n+1);% se crea una matriz de ceros
 
 for i = 0:n
   fprintf('ingrese x(%d): ', i);%se rellena el vector de ceros con los x que se desea
   vector(i+1) = input(' ');
   fprintf('ingrese f(x(%d)): ', i);%se rellena la matriz de ceros con los y que se desea
   matriz(i+1,1) = input(' ');
 endfor
 x = input('Ingrese el x a ser evaluado, x = ');%ingresar un valor a evaluar
  
 new_vector = zeros(1,n+1);%este nuevo vector contendra las diferencias entre el x a evaluar y cada uno de los x en el vector anterior
 new_vector(1) = x-vector(1);%primer elemento del vector es la diferencia entre el x a evaluar y el primer elemento del vector anterior
 for i = 1:n
    new_vector(i+1) = x-vector(i+1);%los ceros se van reemplazando por la dif entre el punto a evaluar y los elementos del vector original
    for j = 1:i %se van rellenando las columnas de la matriz con los valores de las interpolaciones de los x
       matriz(i+1,j+1) = (new_vector(i+1)*matriz(i,j)-new_vector(i-j+1)*matriz(i+1,j))/(new_vector(i+1)-new_vector(i-j+1));
    endfor
 endfor

 fprintf('Tabla de interpolacion x = %.3f: \n', x);%muestra la tabla de interpolacion
 for i = 0:n
    fprintf('%11.6f ', vector(i+1));
    for j = 0:i
       fprintf('%11.6f ', matriz(i+1,j+1));
    endfor
    fprintf('\n');
 endfor
