clear; close all;

[alphabet, targets] = mr_2();
[R, Q] = size(alphabet);
[S2, Q] = size(targets);

S0 = 15;
S1 = 50;
net = newff(minmax(alphabet), [S0, S1, S2], {'logsig', 'logsig', 'logsig'}, 'traingdx');
net.LW{2, 1} = net.LW{2, 1} * 0.01;
net.b{2} = net.b{2} * 0.01;

P = alphabet;
T = targets;
net.performFcn = 'sse';
net.trainParam.goal = 0.1;
net.trainParam.show = 20;
net.trainParam.epochs = 5000;
net.trainParam.mc = 0.95;
[net, tr] = train(net, P, T);

netn = net;
netn.trainParam.goal = 0.6;
netn.trainParam.epochs = 300;
T = [targets targets targets targets];

for pass = 1:10
    P = [alphabet, alphabet, (alphabet + randn(R, Q) * 0.1), (alphabet + randn(R, Q) * 0.2)];
    [netn, tr] = train (netn, P, T);
end

netn.trainParam.goal = 0.1;
% Предельная среднеквадратичная погрешность
netn.trainParam.epochs = 500;
% Максимальное количество циклов обучения
net.trainParam.show = 5;
% Частота вывода результатов на экран
[netn, tr] = train(netn, P, T);

noise_range = 0:.05:.5;
max_test = 100;
networkl = [];
network2 = [];
T = targets;

% Выполнить тест
for noiselevel = noise_range
    errors1 = 0;
    errors2 = 0;

    for i = 1:max_test
        P = alphabet + randn(35, 9) * noiselevel;

        % Тест для сети 1
        A = sim(net, P);
        AA = compet(A);
        errors1 = errors1 + sum(sum(abs (AA - T))) / 2;

        % Тест для сети 2
        An = sim(netn, P);
        AAn = compet(An);
        errors2 = errors2 + sum(sum(abs(AAn - T))) / 2;
        echo off
    end

    % Средние значения ошибок (100 последовательностей
    % из 26 векторов целей)
    networkl = [networkl errors1 / 9/100];
    network2 = [network2 errors2 / 9/100];
end

hold on
grid on
plot(noise_range, networkl * 100, 'g');
plot(noise_range, network2 * 100, 'r');
legend('Обучение без шума', 'Обучение с шумом')