function s=moj_wektor(n,k)
%Funkcja moj_wektor(n,k) pobiera warto�ci w postaci dw�ch wektor�w tej samej
%d�ugo�ci i zwraca wektor w kt�rym ka�dy element (wyraz) jest wynikiem symbolu Newtona 
%dla elementow wektor�w n i k o tych samych indeksach.
%Funkcja zadzia�a je�li:
%1. Ka�dy element jednego wektora b�dzie wi�kszy b�d� r�wny warto�ci element�w drugiego*:
%   n=n(j),k=k(j) i n(j)>=k(j),gdzie k(j)- j-ty element wektora k.
%2. Elementy wektor�w b�d� liczbami naturalnymi.
% *Kolejno�� podania argument�w funkcji (wektor�w) nie ma znaczenia. Funkcja za 
%  wektor n uzna ten o wi�kszych wyrazach.
%Przyk�ad:
%Funkcja moj_wektor([5,4,2],[20,5,4]) zwr�ci wektor [15504,5,6]
if length(n)~=length(k)
    error('Wektory musz� by� takiej samej d�ugo�ci.')
end
if (k>=n)==ones(1,length(k))
    %je�eli wektory zosta�y podane w odwrotnej kolejno�ci
    %(to znaczy najpierw wektor z warto�ciami mniejszymi a potem z wi�kszymi)
    %funkcja policzy wtedy dwumian dla (k;n)
    a=n;
    b=k;
    n=b;
    k=a;
end
miejsce=zeros(1,length(n)); 
for i=[1:length(n)];
    miejsce(:,i)=symb_New((n(:,i)),(k(:,i)));
end
s=miejsce;
end
function y=symb_New(j,p)
if fix(j)~=j | fix(p)~=p | p<0 | j<0;
    error('Warto��i wyraz�w wektora musz� by� naturalne (0 uznajemy za liczb� naturaln�).')
end
if (j<p); %funckja symb_New jest tu funkcja pomocnicz� wi�c wy�wietlany b��d odnosi si� do funkcji moj_wektor
    error('Wszystkie elementy jednego z wektor�w musz� by� wi�ksze lub r�wne elementom drugiego.')
end
if j==p | p==0;
    y=1;
else
    y=symb_New(j-1,p-1)+symb_New(j-1,p);
end
end