%metodo Horner
clc;
n=4;
a0=2;
a1=0;
a2=-3;
a3=3;
a4=-4;
x0=-2;
function[result]=funct(x)
  result=cos(x)-x;
return
endfunction

y=a4;
z=a4;
j=n-1;
while(j>=1)
  
  y=x0*y+;
  z=x0*z+y;
  j=j-1;
end

y=x0*y+a0;
disp(y);
disp(z);
