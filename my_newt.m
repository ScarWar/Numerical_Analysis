
function y = f(x)
y = x^2 - 3;
end

function y = g(x)
y = x - f(x)/diff(f(x));
end

g(2);