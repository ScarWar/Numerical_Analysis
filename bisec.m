function [y,iter] = bisec(f,a,b,tol)
n = 0;
format long
if f(a) * f(b) > 0
    disp('Not good choise of interval')
else
    p = (a+b)/2;
    err = abs(f(p));
    while err > tol
        n = n+1;
        if f(a) * f(b) < 0
            b = p;
        else 
            a = p;
        end
        p = (a+b)/2;
        err = abs(f(p));
    end
end
y = (a+b)/2;
iter = n;
end