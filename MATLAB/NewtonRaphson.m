clear; clc;

%% --- Function Declaration ---
function [Root, store] = NewtonR(f, g, x0, tol)

    store = [];  % Initialize store array 

    x1 = x0 - f(x0) / g(x0);  % First iteration guess

    while abs(x1 - x0) > tol

        store(end+1) = x1;

        x0 = x1;
        x1 = x0 - f(x0) / g(x0);

    end

    Root = x1;
end

%% --- Symbolic Function and Derivative ---
syms x;
fsym = sin(x) - x / 2;
f = matlabFunction(fsym);             % Convert to function handle
g = matlabFunction(diff(fsym, x));    % Derivative function handle

%% --- User Input ---
x0 = input("User initial guess: ");
tol = input("Tolerance: ");

%% --- Function Call ---
[Root, store] = NewtonR(f, g, x0, tol);

%% --- Output ---
fprintf("Root : %.6f\n", Root);

%% --- Plot ---
figure;
plot(store, 'o-b', 'LineWidth', 1.5);
xlabel("Iteration");
ylabel("Approximation");
title("Newton-Raphson Method");
grid on;
legend("x values");
