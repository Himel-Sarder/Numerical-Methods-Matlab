clear, clc

function [Root] = SECANT(f, x0, x1)
    if f(x0) == f(x1)
        error("Can't same !");
    end
    x2 = 0;
    while x0 ~= x1
        x2 = x1 - ((x1 - x0) / (f(x1) - f(x0))) * f(x1);
        x0 = x1;
        x1 = x2;
    end
    Root = x2;
    return;
end




f = @(x) x^3 - 2 * x - 5;
x0 = input("Enter inital guess x0 : ");
x1 = input("Enter inital guess x1 : ");

[Root] = SECANT(f, x0, x1);

fprintf("Root is : %.6f\n", Root);

