clc, clear

function [find] = Tropi(f, a, b, n, h)

    x = linspace(a, b, n+1);
    y = f(x);
    disp(y);

    find = (h/2) * (y(1) + 2 * sum(y(2:n)) + y(end));
end

f = @(x) cos(x);
a = input("Enter lower bound : ");
b = input("Enter upper bound : ");
h = input("Enter step size : ");

n = (b - a) / h;

[find] = Tropi(f, a, b, n, h);

actual = integral(f, a, b);

fprintf("Answer : %.6f\n", find);
fprintf("Actual Answer : %.6f\n", actual);
