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


% SECCION SUSCEPTIBLES
figure
var=-4;
cont=1;

colores={'m','b--','r--','y--','g--'};
indicecolor=1;
for i=1:3:46
    
 subplot(3,4,cont),plot(t,x(:,i),char(colores(indicecolor))),title('S');
 hold on;

 if(cont==4 && i <27)
     cont = 1;
     indicecolor = indicecolor+1;
    
 end
 if(var==2)
     cont = cont+1;
     indicecolor = indicecolor+1;
     var=-1;
 end

 
 if(cont==5 && i > 27)
     cont = 4;
    
 end
 if(i<8)
      cont=cont+1;
 end
  fprintf("ESSS %d",cont)
  var = var+1;
  set(gca,'XTick',[0; 500; 1000],'YTick', 0:10000000:100000000,'ButtonDownFcn',@createnew_fig)
end

set(gca,'XTickMode', 'auto');
hold on

%SECCION INFECTADOS

var=-4;
cont=5;
colores={'m','b--','r--','y--','g--'};
indicecolor=1;
for i=2:3:47
    
 subplot(3,4,cont),plot(t,x(:,i),char(colores(indicecolor))),title('I');
 hold on;

 if(cont==8 && i <28)
     cont = 5;
     indicecolor = indicecolor+1;
 end
 if(var==2)
     cont = cont+1;
     indicecolor = indicecolor+1;
     var=-1;
 end
 if(cont==9 && i > 28)
     cont = 8;
 end
 if(i<9)
      cont=cont+1;
 end
  var = var+1;
  set(gca,'XTick',[0; 500; 1000],'YTick', 0:10000000:100000000,'ButtonDownFcn',@createnew_fig)
end

set(gca,'XTickMode', 'auto');
hold on

% SECCION RECUPERADOS
var=-4;
cont=9;

contveces=0;

indicecolor=1;
for i=3:3:48
 subplot(3,4,cont),plot(t,x(:,i),char(colores(indicecolor))),title('R ');
 hold on;
 if(cont==12 && i <32)
     cont = 8;
     indicecolor = indicecolor+1;  
 end
 if(var==2)
     cont = cont+1;
     indicecolor = indicecolor+1;
     var=-1;
 end
 if(cont==13 && i > 32)
     cont = 12;
 end
 if(i<13)
      cont=cont+1;
 end
  var = var+1;
  set(gca,'XTick',[0; 500; 1000],'YTick', 0:10000000:100000000,'ButtonDownFcn',@createnew_fig)
end

set(gca,'XTickMode', 'auto');

function createnew_fig(cb,evendata)

hh = copyobj(cb,figure);

set(hh,'ButtonDownFcn',[]);

set(hh, 'Position', get(0, 'DefaultAxesPosition'));
end

%SOLUCIÓN DE ECUACIONES DIFERENCIALES ORDINARIAS

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
