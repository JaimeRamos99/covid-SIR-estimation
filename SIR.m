function modeloSIR
%10 de abril 2020
% x = #susceptibles, y = #infectados, z = #recuperados
%me tocó hacer un ajuste para hace 24 días porque el valor de recuperados
%era 0 y eso hacía todo 0. Lo puse en 1.
clc;
N=50547214;

%10 de abril
gammalast=197/2473;
betalast=2.5*gammalast;
y0=2473;
z0=197;
x0=N-y0-z0;

y010=y0 + 3 * 10;
x010= N-y010-z0;
gamma010=197/y010;
beta010=2.5*gamma010;

y050=y0 + 3 * 50;
x050= N-y050-z0;
gamma050=197/y050;
beta050=2.5*gamma050;

y0100=y0 + 3 * 100;
x0100= N-y0100-z0;
gamma0100=197/y0100;
beta0100=2.5*gamma0100;



%6 días antes
gammamenos6=85/1406;
betamenos6=2.5*gammamenos6;
ymenos6=1406;
zmenos6=85;
xmenos6=N-ymenos6-zmenos6;

ymenos610=ymenos6 + 3 * 10;
xmenos610= N-ymenos610-zmenos6;
gammamenos610=85/ymenos610;
betamenos610=2.5*gammamenos610;

ymenos650=ymenos6 + 3 * 50;
xmenos650= N-ymenos650-zmenos6;
gammamenos650=85/ymenos650;
betamenos650=2.5*gammamenos650;

ymenos6100=ymenos6 + 3 * 100;
xmenos6100= N-ymenos6100-zmenos6;
gammamenos6100=85/ymenos6100;
betamenos6100=2.5*gammamenos6100;



%12 días antes
gammamenos12=10/702;
betamenos12=2.5*gammamenos12;
ymenos12=702;
zmenos12=10;
xmenos12=N-ymenos12-zmenos12;

ymenos1210=ymenos12 + 3 * 10;
xmenos1210= N-ymenos1210-zmenos12;
gammamenos1210=10/ymenos1210;
betamenos1210=2.5*gammamenos1210;

ymenos1250=ymenos12 + 3 * 50;
xmenos1250= N-ymenos1250-zmenos12;
gammamenos1250=10/ymenos1250;
betamenos1250=2.5*gammamenos1250;

ymenos12100=ymenos12 + 3 * 100;
xmenos12100= N-ymenos12100-zmenos12;
gammamenos12100=10/ymenos12100;
betamenos12100=2.5*gammamenos12100;



%24 días antes
gammamenos24=1/65;
betamenos24=2.5*gammamenos24;
ymenos24=65;
zmenos24=1;
xmenos24=N-ymenos24-zmenos24;

ymenos2410=ymenos24 + 3 * 10;
xmenos2410= N-ymenos2410-zmenos24;
gammamenos2410=1/ymenos2410;
betamenos2410=2.5*gammamenos2410;

ymenos2450=ymenos24 + 3 * 50;
xmenos2450= N-ymenos2450-zmenos24;
gammamenos2450=1/ymenos2450;
betamenos2450=2.5*gammamenos2450;

ymenos24100=ymenos24 + 3 * 100;
xmenos24100= N-ymenos24100-zmenos24;
gammamenos24100=1/ymenos24100;
betamenos24100=2.5*gammamenos24100;


tmax=1000;
[t,x]=ode45(@epi,[0 tmax],[x0,y0,z0,xmenos6,ymenos6,zmenos6,xmenos12,ymenos12,zmenos12,xmenos24,ymenos24,zmenos24,x010,y010,z0,x050,y050,z0,x0100,y0100,z0,xmenos610, ...
ymenos610,zmenos6,xmenos650,ymenos650,zmenos6,xmenos6100,ymenos6100,zmenos6,xmenos1210,ymenos1210,zmenos12,xmenos1250,ymenos1250,zmenos12,xmenos12100,ymenos12100,zmenos12, ...
xmenos2410,ymenos2410,zmenos24,xmenos2450,ymenos2450,zmenos24,xmenos24100,ymenos24100,zmenos24]);
subplot(3,4,1),plot(t,x(:,1),'m'),title('S')
hold on;
subplot(3,4,2),plot(t,x(:,4),'m'),title('S')
hold on;
subplot(3,4,3),plot(t,x(:,7),'m'),title('S')
hold on;
subplot(3,4,4),plot(t,x(:,10),'m'),title('S')
hold on;
subplot(3,4,1),plot(t,x(:,13),'b--'),title('S')
hold on;
subplot(3,4,1),plot(t,x(:,16),'b--'),title('S')
hold on;
subplot(3,4,1),plot(t,x(:,19),'b--'),title('S')
hold on;
subplot(3,4,2),plot(t,x(:,22),'r--'),title('S')
hold on;
subplot(3,4,2),plot(t,x(:,25),'r--'),title('S')
hold on;
subplot(3,4,2),plot(t,x(:,28),'r--'),title('S (-6)')
hold on;
subplot(3,4,3),plot(t,x(:,31),'y--'),title('S')
hold on;
subplot(3,4,3),plot(t,x(:,34),'y--'),title('S')
hold on;
subplot(3,4,3),plot(t,x(:,37),'y--'),title('S (-12)')
hold on;
subplot(3,4,4),plot(t,x(:,40),'g--'),title('S')
hold on;
subplot(3,4,4),plot(t,x(:,43),'g--'),title('S')
hold on;
subplot(3,4,4),plot(t,x(:,46),'g--'),title('S (-24)')




subplot(3,4,5),plot(t,x(:,2),'m'),title('I')
hold on;
subplot(3,4,6),plot(t,x(:,5),'m'),title('I')
hold on;
subplot(3,4,7),plot(t,x(:,8),'m'),title('I')
hold on;
subplot(3,4,8),plot(t,x(:,11),'m'),title('I')
hold on;
subplot(3,4,5),plot(t,x(:,14),'b--'),title('I')
hold on;
subplot(3,4,5),plot(t,x(:,17),'b--'),title('I')
hold on;
subplot(3,4,5),plot(t,x(:,20),'b--'),title('I')
hold on;
subplot(3,4,6),plot(t,x(:,23),'r--'),title('I')
hold on;
subplot(3,4,6),plot(t,x(:,26),'r--'),title('I')
hold on;
subplot(3,4,6),plot(t,x(:,29),'r--'),title('I (-6)')
hold on;
subplot(3,4,7),plot(t,x(:,32),'y--'),title('I')
hold on;
subplot(3,4,7),plot(t,x(:,35),'y--'),title('I')
hold on;
subplot(3,4,7),plot(t,x(:,38),'y--'),title('I (-12)')
hold on;
subplot(3,4,8),plot(t,x(:,41),'g--'),title('I')
hold on;
subplot(3,4,8),plot(t,x(:,44),'g--'),title('I')
hold on;
subplot(3,4,8),plot(t,x(:,47),'g--'),title('I (-24)')



subplot(3,4,9),plot(t,x(:,3),'m'),title('R ')
hold on;
subplot(3,4,10),plot(t,x(:,6),'m'),title('R')
hold on;
subplot(3,4,11),plot(t,x(:,9),'m'),title('R')
hold on;
subplot(3,4,12),plot(t,x(:,12),'m'),title('R')
hold on;
subplot(3,4,9),plot(t,x(:,15),'b--'),title('R')
hold on;
subplot(3,4,9),plot(t,x(:,18),'b--'),title('R')
hold on;
subplot(3,4,9),plot(t,x(:,21),'b--'),title('R')
hold on;
subplot(3,4,10),plot(t,x(:,24),'r--'),title('R')
hold on;
subplot(3,4,10),plot(t,x(:,27),'r--'),title('R')
hold on;
subplot(3,4,10),plot(t,x(:,30),'r--'),title('R (-6)')
hold on;
subplot(3,4,11),plot(t,x(:,33),'y--'),title('R')
hold on;
subplot(3,4,11),plot(t,x(:,36),'y--'),title('R')
hold on;
subplot(3,4,11),plot(t,x(:,39),'y--'),title('R (-12)')
hold on;
subplot(3,4,12),plot(t,x(:,42),'g--'),title('R')
hold on;
subplot(3,4,12),plot(t,x(:,45),'g--'),title('R')
hold on;
subplot(3,4,12),plot(t,x(:,48),'g--'),title('R (-24)')
hold on;

function dx = epi(~,x)
dx = zeros(48,1);
longitud = size(dx,1);
cont = 1;
for i=1:longitud
    
     if(mod(i,12)==0)
         dx(i-2) = -betamenos24*x(i-2)*x(i-1)/N;
        dx(i-1) = +betamenos24*x(i-2)*x(i-1)/N-gammamenos24*x(i-1);
        dx(i)= +gammamenos24*x(i-1);
        cont=0;
    end   
   
    if(cont==9)
     dx(i-2) = -betamenos12*x(i-2)*x(i-1)/N;
     dx(i-1) = +betamenos12*x(i-2)*x(i-1)/N-gammamenos12*x(i-1);
     dx(i) = +gammamenos12*x(i-1);

    end
    
    if(cont==6)   
      dx(i-2) = -betamenos6*x(i-2)*x(i-1)/N;
      dx(i-1) = +betamenos6*x(i-2)*x(i-1)/N-gammamenos6*x(i-1);
      dx(i) = +gammamenos6*x(i-1);   
   
    end
    
     if(cont==3)   
     dx(i-2) = -betalast*x(i-2)*x(i-1)/N;
     dx(i-1) = +betalast*x(i-2)*x(i-1)/N-gammalast*x(i-1);
     dx(i) = +gammalast*x(i-1);
  
    end
    
    cont = cont+1;

end

 end
end