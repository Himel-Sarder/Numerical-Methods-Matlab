clc; clear;

% Defining the system of equations
A = [4 -1 1; 
     2 5 -2; 
     1 -3 6]; % Coefficient matrix

b = [7; -4; 6]; % Right-hand side

% Solve the system using Gaussian Elimination
x = A \ b;

% Display the result
fprintf('Gaussian Elimination Solution :\n');
fprintf('x = %0.4f, y = %0.4f, z = %0.4f\n', x(1), x(2), x(3));
