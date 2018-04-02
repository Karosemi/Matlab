function r = spirals(n,s)
%Funkcja spirals(n,s) rysuje dwie spirale: spirale Fibonacciego (czerwony wykres) 
%i z³ot¹ spiralê (niebieski wykres).Funkcja pobiera argument n, który odpowiada za iloœæ
%narysowanych æwiartek wykresu i argument s ,który jest opcjonalny i odpowiada za rysowanie
%legendy. Dla s=1 funkcja rysuje legende w prawym gornym roku wykresu.
    if ~exist('s','var')
        s = 0;
    end
    for i = 1:n %Pêtla rysuje cwiartki okregu o promieniach rownych kolejnym wyrazom ci¹gu Fibonacciego i srodku w punkcie (0,0)
        fib(:,i) = Fib(i);
    end 
    a = n*pi/2;
    Angles = 0: pi/2 : a;
    
    for j = 2:n+1
        number = fib(:,j-1);
        range = Angles(:,j-1):pi/100:Angles(:,j);
        [x y] = pol2cart(range,number);
        p(j-1,:) = x;
        g(j-1,:) = y;
    end
    for j = 1:n %Pêtla ,,skleja'' æwiartki
        if j ~= n & p(j+1,1) ~= p(j,end);
            variable = p(j,end)-p(j+1,1);
            p(j+1,:)= p(j+1,:)+variable;
        else
            continue
        end
        if j ~= n & g(j+1,1) ~= g(j,end);
            variable = g(j,end)-g(j+1,1);
            g(j+1,:)= g(j+1,:)+variable;
        else
           continue
        end
        
    end
    for j=1:n 
        
%Rysuje spirale Fibonacciego
        
        fibb = plot( p(j,:),g(j,:),'color','r','linewidth',1);
        hold on
        
    end
    
    theta = 0:pi/100:a+pi/11;
    fi = (1+sqrt(5))/2;
    b = log(fi)/(pi/2);
    a = b*fi;
    [x y] = pol2cart(theta,a*exp(1).^(theta.*b));
   
%Rysuje zlot¹ spiralê 

    gold = plot(x+0.5,y,'color','b','linewidth',1);

%Gdy zadeklarujemy drug¹ zmienn¹ s = 1 funkcja naniesie legendê na wykres

    if s == 1 
        legend([fibb gold],'Spirala Fibonacciego','Z³ota spirala','Location','northeast','fontsize',1)
    end

    axis equal 
%Kwadraty w ktorych wpisane sa æwiartki
    x = 0;
    y = 0;
    rectangle('Position', [x y Fib(1) Fib(1)]);
    for i = 2:n
        vari = mod(i,4);
            if vari == 1;
                y = y+Fib(i-1);
                if (i-2) ~= 0;
                    x = x-Fib(i-2);
                end
            elseif vari == 2;
                if (i-2) ~= 0;
                    y = y-Fib(i-2);
                end
                x = x-Fib(i);
            elseif vari == 3;
                y = y-Fib(i);
            elseif vari == 0;
                x = x+Fib(i-1);
            end
            rectangle('Position', [x y Fib(i) Fib(i)]);
    end
    
   
%Zmieniam zakres aby linie ,,nie wychodzi³y'' poza obszar wykresu
    lim = axis;
    lim(:,1) = lim(:,1)-0.1;
    lim(:,2) = lim(:,2)+0.1;
    lim(:,3) = lim(:,3)-0.1;
    lim(:,4) = lim(:,4)+0.1;
    axis([lim]);

end
        