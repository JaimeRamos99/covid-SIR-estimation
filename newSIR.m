clc;
clear all;
%población colombiana estimada
N=50547214;
%la primera fila es para 'hoy', la segunda para 6 días atrás y así
%sucesivamente
inputsPorDia = [2473 197; 1406 85; 702 10; 65 1].';%2*4
perturbaciones = [0  10  50  100];%vector vertical(4*1)

                    %INICIALIZACIÓN%
yPerturbado = [];                  
xPerturbado = [];
gammaPerturbado = [];
betaPerturbado = [];
Ygorro = [];
Xgorro = [];
GAMMA =[];
BETA = [];


                    %OPERACIONES%
%crea las semillas (los 16 casos)
for c = 1:4
    yPerturbado =  [yPerturbado; (3*perturbaciones + inputsPorDia(1,c))'];%vector columna
    xPerturbado = [xPerturbado; (N - inputsPorDia(1,c) - 3*perturbaciones - inputsPorDia(2,c))'];
    gammaPerturbado = [gammaPerturbado;(ones(1,4)*inputsPorDia(2,c)./(3*perturbaciones + inputsPorDia(1,c)))'];
    betaPerturbado = 2.5 * gammaPerturbado;
end
contador=0;
for c=1:16
    if c > 13
        z0=1;
    elseif c > 9
        z0 = 10;
    elseif c > 5
        z0 = 85;
    else 
        z0 = 197;
    end
    if c ~= 1 && c ~= 5 && c~=9 && c~=13
        if c == 2 || c == 6 || c == 10 || c == 14
            nuevaFila = yPerturbado(c) * ones(1,1000)+10*randn(1,1000);
        elseif c == 3 || c == 7 || c == 11 || c == 15
            nuevaFila = yPerturbado(c) * ones(1,1000)+50*randn(1,1000);
        else
            nuevaFila = yPerturbado(c) * ones(1,1000)+100*randn(1,1000);
        end
        disp(yPerturbado)
        contador = contador+1;
        Ygorro(contador,:) = nuevaFila;
        Xgorro(contador,:) = N - nuevaFila - z0;
        GAMMA(contador,:) = z0./nuevaFila;
        BETA(contador,:) = 2.5*(z0./nuevaFila);
    end
end
