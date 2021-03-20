function [Xmin,Ymin,iter] = FibSearch(f, a, b, eps)

iter = 0;
Fn = (b-a)/eps;
%Metoda ineficienta de aflare a nr de iteratii
while fibonacci(iter) < Fn
    iter = iter + 1;
end
disp('Metoda lui Fibonacci');
lambda = a + fibonacci(iter-2)/fibonacci(iter) * (b - a)
miu = a + fibonacci(iter-1)/fibonacci(iter) * (b - a)
n = iter;
while abs(b-a) > eps
    n = n - 1;
    if feval(f, lambda) > feval(f, miu)
        a = lambda;
        lambda = miu
        miu = a + fibonacci(n-1)/fibonacci(n) * (b - a)
    else
        b = miu;
        miu = lambda
        lambda = a + fibonacci(n-2)/fibonacci(n) * (b - a)
    end
    s = sprintf('Intervalul de incertitudine [%d, %d]\n', a,b);
    display(s);
end
Xmin = (a+b)/2;
Ymin = feval(f, Xmin);
end