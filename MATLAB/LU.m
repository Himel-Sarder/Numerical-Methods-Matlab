function x = SolveLU(A, b)
    [L, U] = LUdecomp(A);
    
    % Forward substitution: L * y = b
    n = length(b);
    y = zeros(n,1);
    for i = 1:n
        sumL = 0;
        for j = 1:i-1
            sumL = sumL + L(i,j) * y(j);
        end
        y(i) = b(i) - sumL;
    end

    % Backward substitution: U * x = y
    x = zeros(n,1);
    for i = n:-1:1
        sumU = 0;
        for j = i+1:n
            sumU = sumU + U(i,j) * x(j);
        end
        x(i) = (y(i) - sumU) / U(i,i);
    end
end

function [L, U] = LUdecomp(A)
    n = size(A,1);
    L = eye(n);
    U = zeros(n);

    for i = 1:n
        for j = i:n
            sumU = 0;
            for k = 1:i-1
                sumU = sumU + L(i,k) * U(k,j);
            end
            U(i,j) = A(i,j) - sumU;
        end
        for j = i+1:n
            sumL = 0;
            for k = 1:i-1
                sumL = sumL + L(j,k) * U(k,i);
            end
            L(j,i) = (A(j,i) - sumL) / U(i,i);
        end
    end
end

A = [2 -1 1; 3 3 9; 3 3 5];
b = [2; -1; 4];

x = SolveLU(A, b);
disp('Solution x =');
disp(x);



%% Easiest

% Define matrix A and vector b
A = [2 -1 1;
     3  3 9;
     3  3 5];
b = [2; -1; 4];

% LU decomposition
[L, U] = lu(A);

disp(L);
disp(U);
% Solve Ly = b using forward substitution
y = L \ b;

% Solve Ux = y using backward substitution
x = U \ y;

% Display solution
disp('Solution x =');
disp(x);

