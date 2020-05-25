function df = gradient(Yo, pa, tobs, y0, h)
p = length(pa);
e = eye(p,p);
df = zeros(p,1);
for k = 1:p % cada k es para un parametro
   ff = fun(Yo,pa+e(:,k)*h,tobs,y0); %f(a+h)
   fb = fun(Yo,pa-e(:,k)*h,tobs,y0); %f(a-h)
   df(k) = (ff-fb)/(2*h);
end
end