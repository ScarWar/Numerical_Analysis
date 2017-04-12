function [y,iter] = newton(f,fx,x0)
n = 0;
format longE
    function y = newton_iter(x)
        y = double(x) - f(double(x))/fx(double(x));
    end

g = @newton_iter;

x_old = g(x0)

if x_old == x0
    y = x0;
    iter = n;
else 
    x_new = g(x_old);
    err = abs(f(x_new));
    x_old = x_new;
    
    while err >= eps
        
        x_new =  g(x_old);
        err = abs(double(f(x_new)));
        x_old = x_new;
        n = n + 1;
        Info = [num2str(x_new),'     ', num2str(x_new^10)];
        disp(Info);
        % if err > e
        %     disp('Shit happens');
        %     disp(x_new);
        % end
        % err = err_new;
    end
end 
    y = x_old;
    iter = n;
end


