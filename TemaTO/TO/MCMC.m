function [Xmin, Ymin] = MCMC(f, X, e)

k = 0
%nablaFx1 =  @(x1,x2)8*x1 - 5*x2 - 8;
%nablaFx2 = @(x1,x2)6*x2 - 5*x1;
syms x1 x2
n1 = diff(f,x1);
n2 = diff(f,x2)
nablaFx1 = matlabFunction(n1);
nablaFx2 = matlabFunction(n2);
nablaAtX = [nablaFx1(X(1),X(2)), nablaFx2(X(1),X(2))]'
syms f1(x) x
% Precizia pentru sectiunea de aur
eps = 1e-6;
while norm(nablaAtX) > e
    f1 = f(X(1) - x * nablaAtX(1), X(2) - x*nablaAtX(2)); 
    lambda = GoldenSection(matlabFunction(f1), -20,20 ,eps)
    X = X - lambda * nablaAtX
    k = k + 1
    nablaAtX = [nablaFx1(X(1),X(2)), nablaFx2(X(1),X(2))]'
    
end

Xmin = X;
Ymin = f(X(1),X(2));
end