function [Xmin, Fmin, pathToMin, i] = NewtonTema(f, X, eps)
syms x1 x2
nabla = gradient(f(x1,x2),[x1,x2]);
nabla = matlabFunction(nabla);
nablaAtX = nabla(X(1), X(2));
H = hessian(f(x1,x2), [x1,x2]);
H1 = inv(H);
%In varianta de mai jos nu mergea ok daca aveam 
%o derivata partiala in functie doar de x1 sau x2
%pentru ca in calcularea gradientului pasam in acest
%caz un parametru in plus
%{
n1 = diff(f,x1);
n2 = diff(f,x2);
nablaFx1 = matlabFunction(n1);
nablaFx2 = matlabFunction(n2);
nablaAtX = [nablaFx1(X(1),X(2)), nablaFx2(X(1),X(2))];
H = double([diff(n1,x1) diff(n1,x2); diff(n2,x1) diff(n2,x2)]);
H1 = inv(H);
%}
i = 0
pathToMin(:,i+1) = X;
while norm(nablaAtX) > eps
    
    %nablaAtX = [nablaFx1(X(1),X(2)); nablaFx2(X(1),X(2))]
    X = X - H1 * nablaAtX
    nablaAtX = nabla(X(1), X(2));
    i = i + 1
    pathToMin(:,i+1) = X;
end
Xmin = X;
Fmin = f(Xmin(1), Xmin(2));
end