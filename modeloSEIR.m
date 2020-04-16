function modeloSEIR
    clc;
    %15 de abril el 'hoy'
    inputsPorDia = [3105 452 131; 2223 174 69; 1267 55 25 ; 235 3 2].';%2*4
    perturbaciones = [0  10  50  100];
    %población colombiana estimada 15 abril según https://countrymeters.info/es/Colombia
    N=50555885;
    %aprox tasa de natalidad colombia
    B=1.98;
    Epsilon = 1/5.2;
    Gamma = 1/14;
    beta = 2.5;
    %semillas
    I = []; R = [];  MIU = [];
    Sgorro = []; Egorro = []; Igorro = []; Rgorro = []; Sgorro = [];  MIUgorro = [];
    for c = 1:4
        semillas = (3 * perturbaciones + inputsPorDia(1,c))';
        I = [I; semillas];%vector columna
        R = [R; ones(4,1) * inputsPorDia(2,c)];
        MIU = [MIU; ones(4,1) * inputsPorDia(3,c)/inputsPorDia(1,c)];
    end
    contador=0;
    for c=1:16
        if c ~= 1 && c ~= 5 && c~=9 && c~=13
            if c == 2 || c == 6 || c == 10 || c == 14
                nuevaFila = I(c) * ones(1,1000) + 10 * randn(1,1000);
            elseif c == 3 || c == 7 || c == 11 || c == 15
                nuevaFila = I(c) * ones(1,1000) + 50 * randn(1,1000);
            else
                nuevaFila = I(c) * ones(1,1000) + 100 * randn(1,1000);
            end
            contador = contador+1;
            Igorro(contador,:) = nuevaFila;
            Egorro(contador,:) = nuevaFila * 4;
            Sgorro(contador,:) = N - nuevaFila * 5 - R(c);
            MIUgorro(contador,:) = 1./nuevaFila * MIU(c);
        end
    end
    for i=1:12
        if i > 9
            r = R(13);
        elseif i > 6
            r = R(9);
        elseif i > 3
            r = R(5);
        else
            r = R(1);
        end
        for j=1:1000
            fila=i;
            columna=j;
            [t,y]=ode45(@epi,[0 200],[Sgorro(i,j),Egorro(i,j),Igorro(i,j),r]);
            plot(t,y(:,1), 'g')
            plot(t,y(:,2), 'b')
            plot(t,y(:,3), 'r')
            plot(t,y(:,4), 'y')
            xlabel('días siguientes') 
            ylabel('Colombianos') 
            hold on;
        end
    end
    function dy = epi(~,y)
        dy = zeros(4,1);
        dy(1) = -beta * y(1) * y(3) / N; %susceptibles EDO
        dy(2) = +beta * y(1) * y(3) / N - Epsilon * y(2);%expuestos EDO
        dy(3) = +Epsilon * y(2) - Gamma * y(3);%infectados EDO
        dy(4) = +Gamma * y(3);%recobrados EDO
    end
end
