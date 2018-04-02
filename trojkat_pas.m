function m=trojkat_pas(N)
%Funkcja trojkat_pas(N) pobiera warto�� N i zwraca macierz kwadratow�
%dolnotr�jk�tn� wymiaru NxN w kt�rej elementami niezerowymi s� liczby z trojk�ta Pascala
%z przedzia�u [1,n] (nie wy�wietla zatem pierwszych warto�ci w rzedach w
%trojk�cie Pascala bo wtedy przedzia� musia�by si� zawiera� si� w [0,n]).
%Przyk�ad:
%trojkat_pas(6)
% 1    0    0    0    0    0
% 2    1    0    0    0    0
% 3    3    1    0    0    0
% 4    6    4    1    0    0
% 5   10   10    5    1    0
% 6   15   20   15    6    1
if N~=fix(N) | N<=0
    error('Argument funkcji musi by� liczb� naturaln� wieksz� lub r�wn� 1.')
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
    error('Wektory musz� by� takiej samej d�ugo�ci')
end
miejsce=int8(zeros(1,length(n))); 
for i=[1:length(n)];
    if n(:,i)<k(:,i)%zmieni�am funkcje z poprzedniego zadania tak aby
    %nie pojawia� si� b��d je�eli k>n, a zamiast tego zwraca� 0. Oszcz�dzi�o 
    %to pisania kolejnej p�tli w funkcji trojkat_pascala.
        miejsce(:,i)=0;
    else
        miejsce(:,i)=symb_New((n(:,i)),(k(:,i)));
    end
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