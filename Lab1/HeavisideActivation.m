function HeavisideActivation(V)

v0 = 0;
U = [];

for v = V

    if v <= v0
        U(end + 1) = 0;
        continue;
    end

    U(end + 1) = 1;
end

plot(V, U, '*');

grid on;
axis([V(1) V(end) -0.5 1.5]);
xlabel('arg');
ylabel('val');
title('Heaviside Activation Function')

end
