
f = @(x1, x2) (4*x1^2 + 3*x2^2 -5*x1*x2 - 8*x1 + 10);
X1 = [1,1]';

[Xmin, Ymin] = MCMC(f, X1, 0.00005);
[Xmin1, Ymin1, i] = NewtonTema(f, X1);