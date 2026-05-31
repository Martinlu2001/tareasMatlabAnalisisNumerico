%TAREA 3
%BONIFICACION

num_horas= input('Ingrese el numero de horas: ');
tarifa= input('Ingrese la tarifa: ');

fprintf('\nSe determinara el salario, descuento, bonificacion y salario neto:\n');

salario_basico= num_horas*tarifa;

if(salario_basico>400)

  bonificacion= 12*salario_basico/100;
  descuento= 9*salario_basico/100;
  
 else
  if(salario_basico==250)
  
  bonificacion= 9*salario_basico/100;
  descuento= 7*salario_basico/100;
  end
  
  if(salario_basico==150)
  
  bonificacion= 6*salario_basico/100;
  descuento= 4*salario_basico/100;
  
  else
  bonificacion= 4*salario_basico/100;
  descuento= 0;
  end
 end
  
  
fprintf('El salario basico es: %f\n', salario_basico);
fprintf('La bonificacion es: %f\n', bonificacion);
fprintf('El descuento es: %f\n', descuento);