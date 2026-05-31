%TAREA 1 
%ENTRADA DE DATOS

precio = input('Ingrese el precio por unidad del producto: ');
cantidad= input('Ingrese la cantidad de ese producto: ');

fprintf('\nSe mostrara el importe, descuento, valor venta, IGV y total de venta:\n');

%OPERACIONES
importe=precio*cantidad;
descuento = (9*importe)/100;
valorVenta=importe-descuento;
IGV= (18*valorVenta)/100;
TotalVenta=valorVenta+IGV;


%IMPRIMIR DATOS
fprintf('\nEl importe del producto es %f', importe);
fprintf('\nEl descuento del producto es %f', descuento);
fprintf('\nEl valor de venta del producto es %f', valorVenta);
fprintf('\nEl IGV del producto es %f', IGV);
fprintf('\nEl total de venta del producto es %f', TotalVenta);


fprintf('\nPrograma terminado');
