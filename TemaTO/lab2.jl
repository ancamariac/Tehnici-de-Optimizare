using Statistics;
using Plots;
using LinearAlgebra;

f(x) = x^2 + x + 1;
eps = 0.01
alfa = 0.618

a = []
b = []

append!(a,-3)
append!(b,3)

miu = []
lambda = []

append!(miu,-3 + alfa * 6)
append!(lambda, a[1] + (1 - alfa) * 6)

function MetodaSectiuniiDeAur()
    iter = 1
    while abs(b[iter] - a[iter]) >= eps
            if f(lambda[iter]) >= f(miu[iter])
                append!(a, lambda[iter])
                append!(b, b[iter])
                append!(lambda, miu[iter])
                append!(miu, a[iter + 1] + alfa * (b[iter + 1] - a[iter + 1]))
            else
                append!(a, a[iter])
                append!(b, miu[iter])
                append!(lambda, a[iter + 1] + (1 - alfa) * (b[iter + 1] - a[iter + 1]))
                append!(miu, lambda[iter])
        end
        iter = iter + 1
    end

    println(a[iter])
    
end

MetodaSectiuniiDeAur();

interval = range(-3, stop = 3, length = 100);
plot(f, interval, title = "Graficul functiei f(x) = x^2 + x + 1")

