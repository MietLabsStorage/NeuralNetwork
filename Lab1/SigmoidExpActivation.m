function SigmoidExpActivation(V, a)

if nargin < 2
    a = 1;
end

U = 1 ./ (1 + exp(-a .* V));

plot(V, U, '*');

grid on;
axis([V(1) V(end) -0.5 1.5]);
xlabel('arg');
ylabel('val');
title('Sigmoid Exp Activation Function')

end
