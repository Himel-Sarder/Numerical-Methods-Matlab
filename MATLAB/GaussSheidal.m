clc, clear

%% Function
function [x, y, z] = GSheidal(f1, f2, f3)
    x = 0;
    y = 0;
    z = 0;

    x1 = f1(x, y, z);
    y1 = f2(x1, y, z);
    z1 = f3(x1, y1, z);

    fprintf("1 : \nx = %.6f\ny = %.6f\nz = %.6f\n", x, y, z);
    disp("----------------------------");

    count = 2;

    while x ~= x1 && y ~= y1 && z ~= z1
        x = x1;
        y = y1;
        z = z1;

        x1 = f1(x, y, z);
        y1 = f2(x1, y, z);
        z1 = f3(x1, y1, z);

        fprintf("%d : \nx = %.4f\ny = %.4f\nz = %.4f\n", count, x, y, z);
        disp("----------------------------");
        count = count + 1;
    end

    x = x1;
    y = y1;
    z = z1;

end

%% Equations
f1 = @(x, y, z) (-1 + 2*y - 3*z) / 5;
f2 = @(x, y, z) (2 + 3*x - z) / 9;
f3 = @(x, y, z) (3 - 2*x + y) / (-7);

%% Function call
[x, y, z] = GSheidal(f1, f2, f3);

%% Print
fprintf("Solution using G-Sheidal : \nx = %.6f\ny = %.6f\nz = %.6f\n", x, y, z);
