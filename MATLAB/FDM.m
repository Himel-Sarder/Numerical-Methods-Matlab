clc; clear; close all;

% Define the number of internal nodes
N = input('Enter the number of internal nodes (N): ');

% Define the domain [0,1] and step size
a = 0; b = 1;
h = (b - a) / (N + 1);  % Step size
x = linspace(a, b, N+2); % Including boundary points

% Define boundary conditions
y0 = 1; % y(0) = 1
yN = 2; % y(1) = 2

% Construct the finite difference matrix and right-hand side vector
A = zeros(N, N);
b = zeros(N, 1);

for i = 1:N
    xi = x(i+1);
    
    % Define coefficients based on central difference approximation
    A(i, i) = 2 + h^2;  % Central coefficient
    if i > 1
        A(i, i-1) = -1 + h; % Left coefficient
    end
    if i < N
        A(i, i+1) = -1 - h; % Right coefficient
    end
    
    % Right-hand side
    b(i) = h^2 * xi;
end

% Adjust for boundary conditions
b(1) = b(1) + (1 + h) * y0;
b(N) = b(N) + (1 - h) * yN;

% Display the finite difference matrix A and right-hand side vector b
disp('Finite Difference Matrix A:');
disp(A);

disp('Right-hand side vector b:');
disp(b);

% Solve the system of linear equations
y_internal = A \ b;

% Append boundary values
y = [y0; y_internal; yN];

% Display the numerical solution at all points
disp('Numerical solution at all points (x, y):');
for i = 1:length(x)
    fprintf('x = %.2f, y = %.4f\n', x(i), y(i));
end

% Plot the numerical solution
plot(x, y, 'bo-', 'LineWidth', 1.5);
xlabel('x');
ylabel('y(x)');
title('Solution of y'''' - 2y'' + y = x using Finite Difference Method');
grid on;
legend('Numerical Solution');
