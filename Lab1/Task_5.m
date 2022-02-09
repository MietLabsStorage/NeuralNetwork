syms v;
syms a;
u = 1 / (1 + a * exp(v));

du = diff(u);

disp('Derivative of ' + string(u) + ' is ' + string(du));

ezplot(subs(du, 'a', 1));

grid on;
xlabel('arg');
ylabel('val');
title('Derivative of ' + string(u) + ' with a = ' + 1);
