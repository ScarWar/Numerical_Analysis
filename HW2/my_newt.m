f1 = @(x) tan(x) -2 *x;
f1p = @(x) 1/cos(x)^2 - 2;
a1 = 1; b1 = 1.4; x1 = 1.4;

f2 = @(x) x.^3 - 6 * x.^2 + 12 * x - 8;
f2p = @(x) 3*x.^2 + 12 * x + 12;
a2 = 1; b2 = 3; x2 = 2;

f3 = @(x) x*(x - 2) + 1;
f3p = @(x) 2 * x - 2;
a3 = 0.5; b3 = 1.5; x3 = 1.5;

tol = 1e-12;

[y1b, iter1b] = bisec(f1, a1, b1, tol)
disp('');
[y2b, iter2b] = bisec(f2, a2, b2, tol)
disp('');
[y3b, iter3b] = bisec(f3, a3, b3, tol)
disp('');

[y1n, iter1n] = newton(f1,f1p, x1);
disp('');
[y2n, iter2n] = newton(f2,f2p, x2);
disp('');
[y3n, iter3n] = newton(f3,f3p, x3);
disp('');

root1b = f1(y1b); root1n = f1(y1n);
root2b = f2(y2b); root2n = f2(y2n);
root3b = f3(y3b); root3n = f3(y3n);

