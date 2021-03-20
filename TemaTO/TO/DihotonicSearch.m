function [Xmin,Ymin, iter] = DihotonicSearch(f, a0, b0, eps, delta)

iter = 0;
while abs(b0 - a0) > eps
   
    miu = (a0 + b0)/2 + delta;
    lambda = miu - 2*delta;
    if feval(f, miu) > feval(f,lambda)
        b0 = miu;
    else
        a0 = lambda;
    end
    iter = iter + 1;
end

Xmin = (a0+b0)/2;
Ymin = feval(f, (a0+b0)/2);


end

