function m=trojkat_pas(N)
%Funkcja trojkat_pas(N) pobiera wartoœæ N i zwraca macierz kwadratow¹
%dolnotrójk¹tn¹ wymiaru NxN w której elementami niezerowymi s¹ liczby z trojk¹ta Pascala
%z przedzia³u [1,n] (nie wyœwietla zatem pierwszych wartoœci w rzedach w
%trojk¹cie Pascala bo wtedy przedzia³ musia³by siê zawieraæ siê w [0,n]).
%Przyk³ad:
%trojkat_pas(6)
% 1    0    0    0    0    0
% 2    1    0    0    0    0
% 3    3    1    0    0    0
% 4    6    4    1    0    0
% 5   10   10    5    1    0
% 6   15   20   15    6    1
if N~=fix(N) | N<=0
    error('Argument funkcji musi byæ liczb¹ naturaln¹ wieksz¹ lub równ¹ 1.')
end
macierz_zer=int8(zeros(N));
k=int8(cumsum(ones(N))');
n=int8(cumsum(ones(N)));
for j=[1:1:N]
    macierz_zer(j,:)=wektor_macierzy((n(j,:)),(k(j,:)));
end
m=macierz_zer;
end

function s=wektor_macierzy(n,k)
if length(n)~=length(k);
    error('Wektory musz¹ byæ takiej samej d³ugoœci')
end
miejsce=int8(zeros(1,length(n))); 
for i=[1:length(n)];
    if n(:,i)<k(:,i)%zmieni³am funkcje z poprzedniego zadania tak aby
    %nie pojawia³ siê b³¹d je¿eli k>n, a zamiast tego zwraca³ 0. Oszczêdzi³o 
    %to pisania kolejnej pêtli w funkcji trojkat_pascala.
        miejsce(:,i)=0;
    else
        miejsce(:,i)=symb_New((n(:,i)),(k(:,i)));
    end
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