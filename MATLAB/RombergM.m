clear; clc;

syms x;
f = @(x) 1 / (1 + x);  % Define the function
a = 0;                 % Lower limit
b = 1;                 % Upper limit

sol = integral(f, a, b);  % Compute definite integral

fprintf("Solution : %.6f\n", sol);  % Output the result
