using Plots;

function CautareDihotomica(f, a, b, eps, delta)
    iter = 0;
    while abs(b - a) > eps
       
        miu = (a + b)/2 + delta;
        lambda = miu - 2 * delta;
        if f(miu) > f(lambda)
            b = miu;
        else
            a = lambda;
        end
        iter = iter + 1;
    end
    
    Xmin = (a + b)/2;
    return Xmin;
end
 
## EXERCITIUL 1 ##

f(x) = x * (x - 1.5);
interval = range(0, stop = 1, length = 100);
delta = 0.01;
a = 0;
b = 1;
eps = 0.3;

Xmin = CautareDihotomica(f, a, b, eps, delta)
Ymin = f(Xmin);

# VERIFICARE
func = f.(interval);

print("Xmin =  ", Xmin); print("\n\n");

# Se calculeaza valoarea minima a functiei cu CautareDihotomica()
print("Valoarea minima a functiei in urma cautarii dihotomice este: ", Ymin); print("\n\n");

# Se calculeaza minimul functiei cu o metoda predefinita
print("Minimul functiei folosind metoda predefinita este: ", findmin(func));     print("\n\n");  

print("=> Se observa faptul ca cele doua valori de minim sunt aproximativ egale.");

plot(f, interval, title = "Graficul functiei f(x) = x * (x - 1.5)")

