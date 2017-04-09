function [y,iter] = newton(f,fx,x0)
n = 0;
format longE
x_new =  x0 - f(x0)/fx(x0);

if x_new == x0
    y = x0;
    iter = n;
else 
    x_new = x_new - f(x_new)/fx(x_new);
    err = abs(f(x_new));
    while err > eps
        x_new =  x_new - f(x_new)/fx(x_new);
        err_new = abs(f(x_new));
        if err_new > err
            disp('Shit happens');
            disp(x_new);
        end
        x_new = x_new;
        err = err_new;
        n = n + 1;
    end
end 
    y = x_new;
    iter = n;
end

