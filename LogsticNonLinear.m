options = optimset('Display','iter','GradObj','on','MaxIter',9500);
x=[1, .5, .5, .25, .25; 1,-.5,.5, .25, .25;1,-.5,.5, .25, .25;1, .5,-.5, .25, .25;1,1,1, 1, 1;1,0,2,0, 4;1,-1,1,1,1;1,-2,0,4,0]
y=[0;0;0;0;1;1;1;1];
theta=[-1;0;-.5;1;1];
#htheta=f(x*theta)
#just square the x1 and x2 rows and add
	
function [J, grad]=computingCost1(x,y,t)
 	m=length(y);
 	J = 1.0/(2.0*m)*sum((sigmoid(x*t)-y).^2);
 	grad= (1.0/m).*x'*(sigmoid( x*t)-y);
 	endfunction
#computingCost(x,y,theta)	

[J,grad]=computingCost1(x,y,theta)

[w, cost]=fminunc(@(t)(computingCost1(x,y,t)), theta,options)

#theta = [-.357 ; .190]
#theta= [-4.5 ;1];
w
sigmoid(x*w)
