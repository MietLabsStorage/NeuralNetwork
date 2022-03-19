function TrainNet(noiceCoef)

if nargin < 1
    noiceCoef = 0;
end

%[P, T] = GenerateInputArrays(noiceCoef);
[P, T] = GenerateRandArrays();
net = newff(minmax(P), [21, 15, 3], {'logsig' 'logsig' 'purelin'}, 'trainlm');
net.performFcn = 'sse';
net.trainParam.goal = 0.01;
net.trainParam.epochs = 1000;
[net, tr] = train(net, P, T);

save MyNet net;
end
