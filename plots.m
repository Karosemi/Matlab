%Rysuje trzy wykresy
subplot(4,2,1:4)
%Legende wprowadzam tylko na jednym wykresie
spirals(12,1)
%Zmieniam zakresy aby wykresy nie "urywa³y siê" wewn¹trz okna
lim = axis;
lim(:,4) = 40;
axis([lim]);
hold on
title('Porównanie spirali Fibonacciego ze z³ot¹ spiral¹','FontWeight','Normal')

subplot(4,2,[5;7])
spirals(7)
xlim([-14 10]);
ylim([-4.5 7.5]);
title('Przybli¿enie 1.','FontWeight','Normal')

subplot(4,2,[6;8])
spirals(5)
xlim([-2.5 5.5]);
ylim([-2.5 1.5]);
title('Przybli¿enie 2.','FontWeight','Normal')

%Zapisuje wykres w formacie png
print('plot','-dpng')
