
x = -2:.1:2;
y = myfunc(x);
plot(x,y);


function y = myfunc(x)
y = 2 * x .^2 - 3* x + 1;
end
