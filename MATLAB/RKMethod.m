clc, clear

function [find] = RK(f, x0, y0, h, xn)

    k1 = h * f(x0, y0);
    k2 = h * f(x0 + h/2, y0 + k1/2);
    k3 = h * f(x0 + h/2, y0 + k2/2);
    k4 = h * f(x0 + h, y0 + k3);
    k = 1/6 * (k1 + 2 * k2 + 2 * k3 + k4);

    y1 = y0 + k;
    x1 = x0 + h;


    while x1 ~= xn
        y0 = y1;
        x0 = x1;

        k1 = h * f(x0, y0);
        k2 = h * f(x0 + h/2, y0 + k1/2);
        k3 = h * f(x0 + h/2, y0 + k2/2);
        k4 = h * f(x0 + h, y0 + k3);
        k = 1/6 * (k1 + 2 * k2 + 2 * k3 + k4);

        y1 = y0 + k;
        x1 = x0 + h;

    end
    find = y1;
end


f = @(x, y) x^2 + y^2;
x0 = input("Enter x0 : ");
y0 = input("Enter y0 : ");
h = input("Enter step size h : ");
xn = input("Enter xn : ");


[find] = RK(f, x0, y0, h, xn);

fprintf("Ans : %.6f", find);
