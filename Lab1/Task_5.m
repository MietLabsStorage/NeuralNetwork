syms v;
syms a;
u = 1 / (1 + exp(-a * v));

% Теоретическое вычисление
du = diff(u);

disp('Derivative of ' + string(u) + ' is ' + string(du));

% Численное
v_vals = -5:0.1:5;
du_vals = subs(subs(du, 'a', 1), 'v', v_vals);

% График
plot(v_vals, du_vals);
grid on;
xlabel('arg');
ylabel('val');
title('Derivative of ' + string(u) + ' with a = ' + 1);
