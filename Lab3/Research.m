close all;

coef = [0, 100, 20, 5];
Y = zeros(3, 4);

for i = 1:1:4
    delete 'MyNet.mat'
    TrainNet(coef(i));
    TestNet();
    q = WorkNet;
    Y(:, i) = q;
end

x = 1:1:4;

figure()
subplot(3, 1, 1);
plot(x, Y(1, :), '*b');
line([0 5], [0.2 0.2], 'color', 'b');
legend('C');

subplot(3, 1, 2);
plot(x, Y(2, :), '*r');
line([0 5], [0.8 0.8], 'color', 'r');
legend('A');

subplot(3, 1, 3);
plot(x, Y(3, :), '*m');
line([0 5], [0.7 0.7], 'color', 'm');
legend('S');
