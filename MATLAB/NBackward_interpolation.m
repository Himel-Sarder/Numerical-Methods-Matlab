clc; clear;

%% Data points
x = [1, 3, 5, 7];
y = [24, 120, 336, 720];

%% Length of n
n = length(x);

%% Forward difference table (only first row used)
backward_diff = zeros(n, n);
backward_diff(:, 1) = y';

for j = 2:n
    for i = n:-1:j
        backward_diff(i, j) = backward_diff(i, j - 1) - backward_diff(i - 1, j - 1);
    end
end

%% Co-efficients
coeff = backward_diff(n, :);  % last row

%% Interpolation input
x_value = input('Enter x to interpolate: ');

%% Calculate u
h = x(2) - x(1);
u = (x_value - x(n)) / h;

%% Newton forward interpolation Formula
p = coeff(1) + u * coeff(2) + u *(u+1) / 2 * coeff(3) + ((u * (u + 1) * (u + 2)) / 6) * coeff(4);

%% Print
fprintf('Estimated y at x = %.2f: %.4f\n', x_value, p);

%% Simple plot
plot(x, y, 'ro-', 'LineWidth', 1.5); hold on;
plot(x_value, p, 'bs', 'MarkerSize', 10, 'LineWidth', 2);
xlabel('x'); 
ylabel('y');
title('Newton Forward Interpolation');
legend('Data Points', 'Interpolated Point');
grid on;