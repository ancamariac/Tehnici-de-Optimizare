function [Xmin, Ymin, iter, aV, bV] = GoldenSection(f, a, b, e)

alfa = 0.618;
display('Metoda Sectiunii de Aur');
iter = 0;
lambda = a + (1-alfa)*(b - a);
miu = a + alfa*(b - a);
aV(iter+1) = a;
bV(iter+1) = b;
while abs(b-a) > e
    iter = iter + 1;
    if feval(f,lambda) > feval(f,miu)
        a = lambda;
        lambda = miu;
        miu = a + alfa*(b-a);
        aV(iter+1) = a;
bV(iter+1) = b;
    else
        b = miu;
        miu = lambda;
        lambda = a + (1-alfa)*(b-a);
        aV(iter+1) = a;
        bV(iter+1) = b;
    end
    %s = sprintf('Intervalul de incertitudine [%d, %d]\n', a,b);
    %display(s);
    
end
Xmin = (a+b)/2;
Ymin = feval(f,Xmin);
end