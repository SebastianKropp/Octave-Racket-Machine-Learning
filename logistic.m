options = optimset('Display','iter','GradObj','on','MaxIter',100);
x=[1 1;1 2;1 3;1 4;1 5;1 6;1 7;1 8];
y=[0;0;0;0;1;1;1;1];
theta= [-4.5 ;1];
#theta=pinv(x'*x)*x'*y
#htheta=f(x.*theta)
#theta=log(1/y-1)/x	
#x*theta;


sigmoid = (1+exp(-1*(x*theta))).^-1;
   
 function [J, grad]=computingCost(x,y,t)
 	m=length(y);
 	J = 1/(2*m)*sum((x*t-y).^2);
 	grad= (1/m).*x'*(x*t-y);
 	endfunction

[J,grad]=computingCost(x,y,theta)

[theta, cost]=fminunc(@(t)(computingCost(x,y,t)), theta,options)

#theta = [-.357 ; .190]
#theta= [-4.5 ;1];
x*theta

