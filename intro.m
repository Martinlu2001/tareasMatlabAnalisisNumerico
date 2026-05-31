clear
disp('Matriz a');
a=[1 2 3 4 5 6 7];
disp(a);
fprintf('\n');
disp('Matriz b');
b=[ 1 2 3; 4 5 6];
disp(b);
fprintf('\n');
disp('Matriz c');
c=ones*5*b;
disp(c);
x=linspace(-2*pi, 2*pi, 100);
y=cos(x)+x.^2 + 3*x;
plot(x,y);