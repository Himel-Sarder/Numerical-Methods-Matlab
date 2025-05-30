clear, clc, close all

function [Root, store] = RegulaF(f, x0, x1, tol)
    if f(x1) - f(x0) == 0
        error("Can't");
    end
    
    store = [];
    while abs(x1 - x0) > tol
        
        x2 = (x0 * f(x1) - x1 * f(x0)) / (f(x1) - f(x0));
        store(end+1) = x2;
        x0 = x1;
        x1 = x2;
    end
    Root = x2;
end


f = @(x) 2 * x - log10(x) - 7;
x0 = input("Enter initial guess x0 :");
x1 = input("Enter initial guess x1 :");
tol = input("Enter tol : ");


[Root, store] = RegulaF(f, x0, x1, tol);

fprintf("Root : %.6f", Root);

figure;
plot(1:length(store), store, 'o-b', 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
xlabel('Iteration');
ylabel('Approximate Root');
title('Regula Falsi Method');
grid on;
legend('Approximations');