f = @(x1,x2) (1-x1)^2 + (x1-x2)^2;
%f = @(x1,x2) (9*x1^2 + 16*x2^2 - 90*x1 -128*x2);
%Plotarea celor doua grafice cerute
%figure;
%ezmesh(f);
%figure;
%ezcontour(f);
%Aplicarea metodei Newton pe functia aleasa
X1 = [-5; -8];
[Xmin1, Fmin1, pathToMin, i] = NewtonTema(f, X1, 1e-11);
%Stergem ce apare in consola, daca vreti sa vedeti o 
%parte din pasii metodei Newton, comentati clc
clc;
Xmin1 = double(Xmin1);
Fmin1 = double(Fmin1);
mesaj = sprintf('Mininul functiei se afla in punctul X =[%f, %f]\nIar valoarea functiei in acel punct este %f',Xmin1(1),Xmin1(2), Fmin1);
display(mesaj);












