%PROGRAMA UTILIZANDO EL BUCLE WHILE

variable=5;
suma=0;%INICIALIZO LA VARIABLE EN 0
while(variable<=10)
disp(variable);
fprintf('\n');
if(variable==10)
    fprintf('--------------\n');
end
suma=suma+variable;
variable=variable+1;

end

fprintf('Total %d\n',suma);
