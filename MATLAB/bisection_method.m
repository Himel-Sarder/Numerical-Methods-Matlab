function [Root, iterations] = Bisectionn(a, b, tol, f, max_iter)
    if f(a) * f(b) > 0
        disp("Error! f(a) and f(b) should have opposite signs.");
        Root = NaN;
        iterations = 0;
        return;
    end

    iterations = 0;

    while abs(b - a) / 2 > tol && iterations < max_iter
        iterations = iterations + 1;
        c = (a + b) / 2;

        if f(c) == 0
            break;
        elseif f(a) * f(c) > 0
            a = c;
        else
            b = c;
        end
    end

    Root = (a + b) / 2;
end

% --- Main Script ---
f = @(x) x^3 - 6*x^2 + 11*x - 6;
a = input('Enter the lower bound of the interval (a): ');
b = input('Enter the upper bound of the interval (b): ');
tol = input('Enter the tolerance (tol): ');
max_iter = input('Enter the maximum number of iterations (max_iter): ');

[Root, iterations] = Bisectionn(a, b, tol, f, max_iter);

fprintf("Root : %.6f\n", Root);
fprintf("Iteration : %d\n", iterations);