 clc; clear; close all;

% Define the function f(x) = e^(-x^2)
f = @(x) exp(-x.^2);

% Accept user input for the interval and number of subintervals
a = input('Enter lower limit (a): ');
b = input('Enter upper limit (b): ');
n = input('Enter number of subintervals (even number): ');

% Ensure n is even (Simpson's Rule requires even subintervals)
if mod(n, 2) ~= 0
    disp('Number of subintervals must be even. Increasing by 1.');
    n = n + 1;
end

% Compute step size
h = (b - a) / n;

% Compute Simpson's 1/3 Rule
x = linspace(a, b, n+1);
% x = a:h:b;

y = f(x);
disp(y);

S = h/3 * (y(1) + 4 * sum(y(2:2:n)) + 2 * sum(y(3:2:n-1)) + y(end));
% S = (3 * h / 8) * (y(1) + 3 * sum(y(2:3:end-1)) + 3 * sum(y(3:3:end-1)) + 2 * sum(y(4:3:end-2)) + y(end));

% Display results
fprintf('Approximate Integral using Simpson''s 1/3 Rule: %.6f\n', S);

% Compare with MATLAB's integral function
actual_value = integral(f, a, b);
fprintf('Actual Integral Value using MATLAB integral function: %.6f\n', actual_value);

% Compute Error
error = abs(actual_value - S);
fprintf('Absolute Error: %.6f\n', error);
