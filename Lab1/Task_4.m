v = zeros(101, 101);
v_linear = zeros(101, 101);
v_heaviside = zeros(101, 101);
v_sigmoid_exp = zeros(101, 101);
v_sigmoid_th = zeros(101, 101);

% набор на вход
for t = 1:1:101

    for dv = 1:1:101
        v(t, dv) = (t - 1) / 10 - 5 + (dv - 1) / 10;
    end

end

% получение результатов
for t = 1:1:101
    v_linear(t, :) = LinearActivation(v(t, :), false);
    v_heaviside(t, :) = HeavisideActivation(v(t, :), false);
    v_sigmoid_exp(t, :) = SigmoidExpActivation(v(t, :), 1, false);
    v_sigmoid_th(t, :) = SigmoidThActivation(v(t, :), 1, false);
end

% визуализация
T = 0:0.1:10;
DV = -5:0.1:5;

figure(1);
surf(T, DV, v_linear);
title('Linear');
xlabel('t');
ylabel('v');
zlabel('y_n');

figure(2);
surf(T, DV, v_heaviside);
title('Heaviside');
xlabel('t');
ylabel('v');
zlabel('y_n');

figure(3);
surf(T, DV, v_sigmoid_exp);
title('SigmoidExp');
xlabel('t');
ylabel('v');
zlabel('y_n');

figure(4);
surf(T, DV, v_sigmoid_th);
title('SigmoidTh');
xlabel('t');
ylabel('v');
zlabel('y_n');
