% Формирование входных массивов  (входной массив  P) и (эталоны T)
function [P, T] = GenerateRandArrays(noiceCoef)

if nargin < 1
    noiceCoef = 0;
end

P = zeros(100, 21);
T = zeros(3, 100);
x = 0:5.e-2:1;
size_of_x = size(x);

for i = 1:100
    c = 0.9 * rand + 0.1;
    a = 0.9 * rand + 0.1;
    s = 0.9 * rand + 0.1;
    T(1, i) = c;
    T(2, i) = a;
    T(3, i) = s;
    P(i, :) = rand * 5;

    if noiceCoef ~= 0
        P(i, :) = P(i, :) + rand(1, size_of_x(2)) ./ noiceCoef;
    end

end;

P = P';
end
