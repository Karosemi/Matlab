function s=moj_wektor(n,k)
%Funkcja moj_wektor(n,k) pobiera wartoœci w postaci dwóch wektorów tej samej
%d³ugoœci i zwraca wektor w którym ka¿dy element (wyraz) jest wynikiem symbolu Newtona 
%dla elementow wektorów n i k o tych samych indeksach.
%Funkcja zadzia³a jeœli:
%1. Ka¿dy element jednego wektora bêdzie wiêkszy b¹dŸ równy wartoœci elementów drugiego*:
%   n=n(j),k=k(j) i n(j)>=k(j),gdzie k(j)- j-ty element wektora k.
%2. Elementy wektorów bêd¹ liczbami naturalnymi.
% *Kolejnoœæ podania argumentów funkcji (wektorów) nie ma znaczenia. Funkcja za 
%  wektor n uzna ten o wiêkszych wyrazach.
%Przyk³ad:
%Funkcja moj_wektor([5,4,2],[20,5,4]) zwróci wektor [15504,5,6]
if length(n)~=length(k)
    error('Wektory musz¹ byæ takiej samej d³ugoœci.')
end
if (k>=n)==ones(1,length(k))
    %je¿eli wektory zosta³y podane w odwrotnej kolejnoœci
    %(to znaczy najpierw wektor z wartoœciami mniejszymi a potem z wiêkszymi)
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
    error('Wartoœæi wyrazów wektora musz¹ byæ naturalne (0 uznajemy za liczbê naturaln¹).')
end
if (j<p); %funckja symb_New jest tu funkcja pomocnicz¹ wiêc wyœwietlany b³¹d odnosi siê do funkcji moj_wektor
    error('Wszystkie elementy jednego z wektorów musz¹ byæ wiêksze lub równe elementom drugiego.')
end
if j==p | p==0;
    y=1;
else
    y=symb_New(j-1,p-1)+symb_New(j-1,p);
end
end