function LinearActivation(V)

v0_min = -1;
v0_max = 1;
U = [];

for v = V

    if v < v0_min
        U(end + 1) = 0;
        continue;
    end

    if v > v0_max
        U(end + 1) = 1;
        continue;
    end

    U(end + 1) = 0.5 + v / 2;
end

plot(V, U, '*');

grid on;
axis([V(1) V(end) -0.5 1.5]);
xlabel('arg');
ylabel('val');
title('Linear Activation Function');

end
