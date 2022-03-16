function TestNet()

load('MyNet.mat');
[P, T] = GenerateInputArrays();
y = sim(net, P);
figure(1)
[m, b, r] = postreg(y(1, :), T(1, :));
figure(2)
[m, b, r] = postreg(y(2, :), T(2, :));
figure(3)
[m, b, r] = postreg(y(3, :), T(3, :));

end
