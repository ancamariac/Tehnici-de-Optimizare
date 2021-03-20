using Plots;

function SectiuneaDeAur(f, a, b, e)
    alfa = 0.618;
    iter = 0;
    lambda = a + (1 - alfa) * (b - a);
    miu = a + alfa * (b - a);

    while abs(b - a) > e
        iter = iter + 1;
        if f(lambda) > f(miu)
            a = lambda;
            lambda = miu;
            miu = a + alfa * (b - a);
        else
            b = miu;
            miu = lambda;
            lambda = a + (1 - alfa) * (b - a);
        end    
    end
    Xmin = (a + b) / 2;
    return Xmin;

end

## EXERCITIUL 2 ##

#f(x) = x^4 - 14 * x^3 + 60 * x^2 - 70 * x;
f(x) = sin(x) - cos(x); 
interval = range(-2, stop = 2, length = 100);
a = -2;
b = 2;
eps = 0.01;

Xmin = SectiuneaDeAur(f, a, b, eps)

# VERIFICARE
func = f.(interval);

print("Xmin = ", Xmin); print("\n\n");

# Se calculeaza valoarea minima a functiei cu SectiuneaDeAur()

print("Valoarea minima a functiei in urma metodei Sectiunii de Aur este: ", f(Xmin)); print("\n\n");

# Se calculeaza minimul functiei cu o metoda predefinita
print("Minimul functiei folosind metoda predefinita este: ", findmin(func));          print("\n\n");

print("=>Se observa faptul ca cele doua valori de minim sunt aproximativ egale");
plot(f, interval, title = "Graficul functiei f(x) = x^4 - 14 * x^3 + 60 * x^2 - 70 * x")