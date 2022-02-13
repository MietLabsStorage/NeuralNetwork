function SigmoidThActivation(V, a)

if nargin < 2
    a = 1;
end

U = tanh(V ./ a);

plot(V, U, '*');

grid on;
axis([V(1) V(end) -1.5 1.5]);
xlabel('arg');
ylabel('val');
title('Sigmoid Tanh Activation Function')

end
