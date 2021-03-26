options = optimset('Display','iter','GradObj','on','MaxIter',9500);
x=[1,0,0;1,0,1;1,1,0;1,1,1];
#y=[0,1;0,0;0,0;1,0;]
y1=[0;0;0;1];
y2=[1;0;0;0];
theta1=[-30;20;20];
theta2=[10;-20;-20];
#htheta=[1;0;0;1]

function retval=sigmoid(x)
	retval = (1.+exp(-1*x)).^-1
	endfunction

function [J, grad]=computingCost(x,y,t)
 	m=length(y);
 	J = 1.0/(2.0*m)*sum((sigmoid(x*t)-y).^2)
 	grad= (1.0/m).*x'*(sigmoid( x*t)-y)
 	endfunction
 	
a1 =computingCost(x,y1,theta1)
a2 =computingCost(x,y2,theta2)	

[J,grad]=computingCost(x,y1,theta1)
[J2,grad2]=computingCost(x,y2,theta2)

[w, cost]=fminunc(@(t)(computingCost(x,y1,theta1)), theta1,options)
[w2, cost2]=fminunc(@(t)(computingCost(x,y2,theta2)), theta2,options)

sigmoid(x*w)
sigmoid(x*w2)


