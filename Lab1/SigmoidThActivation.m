function U = SigmoidThActivation(V, a, needPlot)

if nargin < 2
    a = 1;
end

if nargin < 3
    needPlot = true;
end

U = tanh(V ./ a);

if needPlot
    plot(V, U, '*');
    grid on;
    axis([V(1) V(end) -1.5 1.5]);
    xlabel('arg');
    ylabel('val');
    title('Sigmoid Tanh Activation Function')
end

end
