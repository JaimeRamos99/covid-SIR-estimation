function f = fun(Yo, pa, tobs, y0)
[~,Yk] = ode45(@(t,y)model(t,y,pa),tobs,y0); %Numerical solution 
%Yk = [x1(p) x2(p) ... xF(p)]
f = norm(Yk-Yo)^2;
end