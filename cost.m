function retval  = cost(x, y, theta)
retval= sum((x*theta-y).^2)*(1/ (2*rows(x)));
endfunction
x =[1,1;1,2;1,3];
theta=[0;.5];
y=[1;2;3];
alpha = 0.5;
htheta = x*theta;

cost(x,y,theta)
