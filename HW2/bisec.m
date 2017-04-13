function [y,iter] = bisec(f,a,b,tol)
n = 0;
format long
format compact
if f(a) * f(b) > 0
    disp('Not good choise of interval');
    y = NaN;
    iter = n;
else
    x_old = a;
    x_new = (a+b)/2;
    while err_cal(f,x_new,x_old) > tol
        n = n+1;
        if f(x_new) < 0
            if f(b) > 0
                a = x_new;
            else 
                b = x_new;
            end
        else 
            if f(b) > 0
                b = x_new;
            else
                a = x_new;
            end
        end
        print_iter(f, x_new, x_old);
        x_old = x_new;
        x_new = (a+b) / 2;
    end
    if x_old < tol
        y = 0;
    else
        y = x_old;
    end
    iter = n;
end
end


function y = err_cal(f, x_new, x_old)
if x_old == 0
    y = abs(f(x_new));
else 
    y = abs((x_new - x_old)/x_old);
end
end


function print_iter(f, x_new, x_old)
str = ['Root estimation: ',num2str(x_new, '%2.15f')...
      ' Function value: ', num2str( f(x_new) ,'%0.15f')...
      ' Relative precision: ', num2str( abs((x_new - x_old)/x_old), '%2.15f')];
disp(str);
end
