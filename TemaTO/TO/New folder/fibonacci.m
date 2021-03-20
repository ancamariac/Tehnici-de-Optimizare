function Fn = fibonacci(n)
    
    if n <= 1
        Fn = 1;
        return;
    end
    f1 = 1;
    f2 = 1;
    while n >= 2
        Fn = f1 + f2;
        f1 = f2;
        f2 = Fn;
        n = n - 1;
    end
end