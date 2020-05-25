clc
close all
clear
N = 50576581;
I = 7006;
R = 1551;
S = N - I - R;
I = I/ N;
R = R / N;
S = S / N;
y0 = [S I R]; %variables
pr = [2.5 ; 1/14]; % beta and gamma respectively (params)
tobs = 0:1:100; % times intervals
[T,Y] = ode45(@(t,y)model(t, y, pr), tobs, y0);%estimar parametros!
%plot(T,Y(:,1));
%plot(T,Y(:,2));
%plot(T,Y(:,3));
% % sigobs = [10 50 100]; eventually we´ll work with 3 obs, as planned in the group meetings
sigobs = 0.1;
[N,n] = size(Y);
Yo = Y + sigobs * randn(N,n);
h = 0.01;
pak = [3 ; 1/30];% altered params
for k = 1:10
    PK(:,k) = pak;
    gk = gradient(Yo, pak, tobs, y0, h); %gradiente
    Hk = hessian(Yo, pak, tobs, y0, h); %hessiano
    dk = -Hk\gk; %paso de newton
    eta = line_search (0, 1, 20, Yo, pak, dk, tobs, y0); % valor eta para linesearch
    pak = pak + eta * dk % nuevo valor aproximo para los parametros *
    DK(:,k) = dk; %valor del paso de newton
end