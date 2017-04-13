function [y,iter] = newton(f,fp,x0)
format long
format compact

% Define iteration function
g = @(x) newton_iter(f,fp,x);

n = 0;
x_old = g(x0);
% x_plot= [];

if x_old ~= x0
    x_new = g(x_old);
    while err_cal(f,x_new,x_old) > eps
        x_old = x_new;
        x_new =  g(x_old);
        print_iter(f, x_new, x_old);
        n = n + 1;
    end 
end 
y = x_old;
iter = n;
end

function y = newton_iter(f,fp,x)
    if fp(x) == 0
        disp('Not a simple root');
        y = NaN;
    else 
        y = x - f(x)/fp(x);
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
