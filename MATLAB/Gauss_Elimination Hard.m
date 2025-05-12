% Define the augmented matrix
A = [3 2 -1 1; 
     2 -2 4 -2; 
     -1 0.5 -1 0];

n = size(A,1); % Number of equations
disp(n);

% Forward elimination
for i = 1:n-1
    for j = i+1:n
        factor = A(j,i) / A(i,i);
        A(j,i:end) = A(j,i:end) - factor * A(i,i:end);
    end
end

% Back substitution
x = zeros(n,1);
x(n) = A(n,end) / A(n,n);

for i = n-1:-1:1
    x(i) = (A(i,end) - A(i,i+1:n) * x(i+1:n)) / A(i,i);
end

% Display results in a table (Fixed Method)
Variables = {'x', 'y', 'z'};      % Row names
T = array2table(x, 'RowNames', Variables, 'VariableNames', {'Values'}); 
disp('Solution using Gaussian Elimination in Tabular Form:')
disp(T)

