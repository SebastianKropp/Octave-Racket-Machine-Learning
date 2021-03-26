x =[1,1;1,2;1,3];
theta=[0;0.5];
y=[1;2;3];
alpha = 0.5;
htheta = x*theta;



thetanew= move(x,y,theta);
thetaold=theta;
costnew=cost(x,y,thetanew)
costold=cost(x,y,thetaold)


while(costnew<costold)
thetaold = thetanew;
thetanew = move(x,y,thetaold);
costnew = cost(x,y,thetanew);
costold = cost(x,y,thetaold);
disp(thetanew);
endwhile

thetanew

