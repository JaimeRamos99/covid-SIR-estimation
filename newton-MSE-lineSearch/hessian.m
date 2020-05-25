function Hf = hessian(Yo, pa, tobs, y0, h)
p = length(pa);
e = eye(p,p);
Hf = zeros(p,p);
for i = 1:p
    ei = e(:,i);
    for j = 1:p
        ej = e(:,j);
        pat0 = pa + ej*h;
        pag0 = pa - ej*h;
        f1 = fun(Yo,pat0+ei*h,tobs,y0); 
        f2 = fun(Yo,pat0-ei*h,tobs,y0); 
        f3 = fun(Yo,pag0+ei*h,tobs,y0); 
        f4 = fun(Yo,pag0-ei*h,tobs,y0); 
        Hf(i,j) = (f1-f2-f3+f4)/(4*h^2);
    end
end
end