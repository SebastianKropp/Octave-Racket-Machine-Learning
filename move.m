function retval = move(x,y,theta)
	alpha = .001;
	M=rows(x);
	a=((alpha/M)* (x*theta-y)' *x);
retval =theta-a';
endfunction

x=[1,1;1,2;1,3];
theta=[0;0.5];
y=[1;2;3];
alpha = 0.5;
htheta = x*theta;

move(x,y,theta);
