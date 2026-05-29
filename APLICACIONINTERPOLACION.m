%APLICACION DE LA INTERPOLACION DE LAGRANGE EN LA SILUETA DEL JARRON
%Alumno: Fabricio Luna Infantes
pkg load symbolic;
format long;
clc;
warning off;
fprintf('APLICACION DE LA INTERPOLACION DE LAGRANGE"\n\n\n');
%{
DATOS PARA LOS TRAZOS
TRAZO 1:
X=[0.2494919117236 0.3259087077635 0.4262377205254]
Y=[0.0149414104248 1.4986887717054 0.0310108764314]
Itv1=0.2494919117236
Itv2=0.3239711970223
TRAZO 2:
X=[0.0820689793047 0.5499909260479 1.1696713420052]
Y=[1.1096512424219 1.6406637632098 1.0533279728713]
Itv1=0.3239711970223
Itv2=0.6753081302369
TRAZO 3:
X=[0.6969431342457 1.7163166685488 2.6021032691945]
Y=[1.6132881878944 0.9939271996474 1.5111563734748]
Itv1=0.6753081302369
Itv2=2.5928282062066
TRAZO 4:
X=[2.9068813192717 3.571157444104 4.5484631899235 6.0187985567303 7.1155676892528]
Y=[2.0198315092093 2.5814301614046 2.6607146770086 2.1717934974504 1.1939511383339]
Itv1=2.5928282062066
Itv2=7.1968576309634
TRAZO 5:
X=[6.7847813038708 7.5475316042569 8.3473747875332]
Y=[0.3383144714429 1.2874338909685 0.3606787657396]
Itv1=7.1968576309634
Itv2=7.798360399351
TRAZO 6:
X=[7.3092741067274 7.6489077940549 8.0928949763243]
Y=[0.0335459880586 1.267752074867 0.0144762296038]
Itv1=7.798360399351
Itv2=8.0928949763243
De lo contrario se puede abrir la imagen (jarron(imagen)) que esta en el drive mediante el comando figure(1) desde octave
%}

for i=1:6 %6 iteraciones debido a que se dividio en 6 partes el jarron
x=input('Ingrese los x: ');%escribir en forma de vector
y=input('Ingrese los y: ');
hold on;

p=0;
n=length(x);
syms t;% variable simbolica t
  for i=1:n
    M=1;
    for j=1:n
      if(i~=j)
        M=M*(t-x(j))/(x(i)-x(j));%se calcula el producto en el numerador y denominador
        M=simplify(M);
      endif
    endfor
    p=p+M*y(i);%se va formando la suma del polinomio
  endfor
  
  %p=simplify(p);%simplica la expresion
  disp(p);%polinomio obtenido en ese trazo
  itv1=input("Desde: ");%se debe graficar en cierto intervalo
  itv2=input("Hasta: ");
  
  hold on;
  %subplot(2,1,1);%divide  a dos ventanas para mostrar
  ezplot(p,[itv1,itv2]);%grafica de la funcion en cierto intervalo
  axis([0,8.25,0,3]);
endfor  