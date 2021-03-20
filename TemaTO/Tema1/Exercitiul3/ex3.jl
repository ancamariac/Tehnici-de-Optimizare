using Plots;

function fibo(n)
    if n <= 1 return 1 end
    return fibo(n - 1) + fibo(n - 2)
  end

function MetodaLuiFibonacci(f, a, b, eps)
    iter = 0;
    Fn = (b - a)/eps;

    while fibo(iter) < Fn
       iter = iter + 1;
    end

    lambda = a + fibo(iter - 2)/fibo(iter) * (b - a)
    miu = a + fibo(iter - 1)/fibo(iter) * (b - a)
    n = iter;
    while abs(b-a) > eps
        n = n - 1;
        if f(lambda) > f(miu)
            a = lambda;
            lambda = miu
            miu = a + fibo(n - 1)/fibo(n) * (b - a)
        else
            b = miu;
            miu = lambda
            lambda = a + fibo(n - 2)/fibo(n) * (b - a)
        end
    end
    Xmin = (a + b)/2;
    return Xmin;
end

## EXERCITIUL 3 ##

f(x) = x^4 - 14 * x^3 + 60 * x^2 - 70 * x;
interval = range(0, stop = 2, length = 100);
a = 0;
b = 2;
eps = 0.3;

Xmin = MetodaLuiFibonacci(f, a, b, eps)

# VERIFICARE
func = f.(interval);

print("Xmin = ", Xmin); print("\n\n");

# Se calculeaza valoarea minima a functiei cu MetodaLuiFibonacci()
print("Valoarea minima a functiei in urma metodei lui Fibonacci este: ", f(Xmin)); print("\n\n");

# Se calculeaza minimul functiei cu o metoda predefinita
print("Minimul functiei folosind metoda predefinita este: ", findmin(func));       print("\n\n");

print("=>Se observa faptul ca cele doua valori de minim sunt aproximativ egale");
plot(f, interval, title = "Graficul functiei f(x) = x^4 - 14 * x^3 + 60 * x^2 - 70 * x")