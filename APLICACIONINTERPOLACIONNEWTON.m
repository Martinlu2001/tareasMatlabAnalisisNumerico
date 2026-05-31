pkg load symbolic;
format long;
warning off;
syms x;
for i=1:4
n = input('Ingrese el numero de elementos:  ');
 matriz = zeros(n+1,n+1);%matriz de ceros
 vector=input('Ingrese los x: ');
 
 for i = 0:n
   fprintf('Ingrese f(x(%d)):  \n', i);
   matriz(i+1,1) = input(' ');
 endfor
  
 for i = 1:n
    for j = 1:i %se van rellenando las columnas
       matriz(i+1,j+1) = (matriz(i+1,j)-matriz(i,j))/(vector(i+1)-vector(i+1-j));
    endfor
 endfor
%{
 fprintf('Tabla de interpolacion: \n');
 for i = 0:n
    fprintf('%11.6f ', vector(i+1));
    for j = 0:i
       fprintf('%11.6f ', matriz(i+1,j+1));
    endfor
    fprintf('\n');
 endfor
 %}
 fprintf("\nObtencion del polinomio: \n");
 p=matriz(1,1);
 for i=1:(n+1)
    L=1;
    for j=1:(i-1)
        L=L*(x-vector(j)); %se van formando los productos q acompañan al coef
    endfor
    if(i==1)%el primer coef no se multiplica por x 
      L=0;
    endif
    p=p+L*matriz(i,i);%se va formando la suma del polinomio
  endfor
  disp(p);
  p=simplify(p);%simplificacion
  disp(p);
  itv1=input("Desde: ");
  itv2=input("Hasta: ");
  
  hold on;
  subplot(2,1,1);%divide  a dos ventanas para mostrar
  ezplot(p,[itv1,itv2]);%grafica de la funcion en cierto intervalo
  axis([0,8.25,0,3]);
endfor
for i=1:4
n = input('Ingrese el numero de elementos:  ');
 matriz = zeros(n+1,n+1);%matriz de ceros
 vector=input('Ingrese los x: ');
 
 for i = 0:n
   fprintf('Ingrese f(x(%d)):  \n', i);
   matriz(i+1,1) = input(' ');
 endfor
  
 for i = 1:n
    for j = 1:i %se van rellenando las columnas
       matriz(i+1,j+1) = (matriz(i+1,j)-matriz(i,j))/(vector(i+1)-vector(i+1-j));
    endfor
 endfor
 
 fprintf("\nObtencion del polinomio: \n");
 p=matriz(1,1);
 for i=1:(n+1)
    L=1;
    for j=1:(i-1)
        L=L*(x-vector(j)); %se van formando los productos q acompañan al coef
    endfor
    if(i==1)%el primer coef no se multiplica por x 
      L=0;
    endif
    p=p+L*matriz(i,i);%se va formando la suma del polinomio
  endfor
  disp(p);
  p=simplify(p);%simplificacion
  disp(p);
  itv1=input("Desde: ");
  itv2=input("Hasta: ");
  
  hold on;
  subplot(2,1,2);%divide  a dos ventanas para mostrar
  ezplot(p,[itv1,itv2]);%grafica de la funcion en cierto intervalo
  axis([0,8.25,0,-3]);
endfor
