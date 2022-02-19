f0 = 2000;
fdn = 2 * f0;
mvis = 4;
fdv = mvis * fdn;
dt = 1 / fdv;

time_df = [];
time_fft = [];

for e = 7:12
    pnt = 2^e;
    t = 0:dt:(pnt - 1) * dt;
    y_sin = sin(2 * pi * f0 * t);
    N = length(y_sin);

    k = 0:N - 1;
    tic;
    Ex = exp(-j * 2 * pi / N * k' * k);
    Y_sin = y_sin * Ex;
    time_df(end + 1) = toc;

    tic;
    Y_sin_fft = fft(y_sin);
    time_fft(end + 1) = toc;
end;

hold on;
grid on;
axis([0 2^12 0 time_df(end)]);
plot(2.^[7:12], time_df);
plot(2.^[7:12], time_fft);
legend('ДПФ', 'БПФ');
title('Зависимость времени обработки');
xlabel('Размерность исходного массива');
ylabel('Время, с');
