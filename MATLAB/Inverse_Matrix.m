% Define the coefficient matrix A and the constant matrix B
A = [3 2 -1; 
     2 -2 4; 
    -2 0.5 -1];

B = [1; -2; 0];

% Check if the matrix is invertible
if det(A) ~= 0

    % Solve using the inverse matrix
    X = A \ B;

    invert = A';

    disp('Inverse matrix :');
    disp(invert);

    disp('Solution using inverse matrix method:');
    disp(X);
else
    disp('Matrix is singular and cannot be inverted.');
end
