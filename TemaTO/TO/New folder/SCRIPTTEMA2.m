f = @(x) (x^4 - 14*x^3 + 60*x^2 - 70*x )
eps = 0.3;
a = 0;
b = 2;
[Xmin1, Ymin1, iter1] = GoldenSection(f,a,b,eps);
[Xmin2, Ymin2, iter2] = FibSearch(f, a, b, eps);
Ymin2
%Din cauza valorii mari a lui eps, algoritmii
%de mai sus nu gasesc cea mai buna aproximare
%a minimului, daca setam eps mai mic atunci
%valoarea gasita va fi mult mai buna
subplot(2,1,1);
ezplot(f,[a,b]);
hold on
plot(Xmin1,Ymin1, 'X');
subplot(2,1,2);
ezplot(f, [a,b]);
hold on;
plot(Xmin2, Ymin2, 'X');


