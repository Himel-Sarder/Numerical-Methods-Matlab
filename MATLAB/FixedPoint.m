clear, clc

%% Function
function [Root, store] = FixedP(f, x0, tol)
    store = [];
    x1 = f(x0);
    while abs(x1 - x0) > tol
        store(end+1) = x1;
        x0 = x1;
        x1 = f(x0);
    end
    Root = x1;
end

%% Input
syms x;
f = @(x) sqrt(1 / (x + 1));
x0 = input("Enter initial guess : ");
tol = input("Enter tolerance : ");

%% Function call
[Root, store] = FixedP(f, x0, tol);

%% Print Root
fprintf("Root : %.6f", Root);

%% Plot
figure;
plot(store);
xlabel("X");
ylabel("Y");
title("Fixed point iteration");
grid on;
