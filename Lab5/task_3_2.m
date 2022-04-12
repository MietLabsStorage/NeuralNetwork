close all; clear;

w = [-1 0 0.5 1 1.5]

for i = w
    figure()
    hold on;
    grid on;
    plot(OutputSignal(1, 15, i));
end
