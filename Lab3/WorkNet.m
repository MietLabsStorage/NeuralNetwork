function Y = WorkNet()

load('MyNet.mat');
x = 0:5.e-2:1;
p = 0.2 * exp(- ((x - 0.8).^2/0.7));
Y = sim(net, p');

end
