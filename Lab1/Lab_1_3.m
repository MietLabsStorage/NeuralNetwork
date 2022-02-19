close all; clear all;

% *** a ***

disp('-----------------------------------------------------');
disp('*** Программа дискретизации и визуализации функций синуса и косинуса с частотой 2 кГц ***');

Tau = input('Введите интервал для наблюдения, мс: ') / 1000;
pnt = input('Введите количество точек для наблюдения: ');
f0 = 2000;

disp('-----------------------------------------------------');
disp('Введенные данные:');
disp(['Интервал для наблюдения (с)    = ' num2str(Tau)]);
disp(['Количество точек для наблюдения = ' num2str(pnt)]);
disp('-----------------------------------------------------');

fdn = 2 * f0; % Частота дискретизации
% в соответствии с критерием Найквиста
mvis = 4;
fdv = mvis * fdn; % Частота дискретизации длЯ визуализации
dt = 1 / fdv; % Интервал дискретизации по времени
T = 1 / f0; % Период сигнала
NT = f0 * Tau; % Количество периодов наблюдения

tt = 0:dt:NT * T; % Вектор времени, с
y_sin_t = sin(2 * pi * f0 * tt); % Вектор сигнала
y_cos_t = cos(2 * pi * f0 * tt); % Вектор сигнала

tn = 0:dt:(pnt - 1) * dt; % Вектор времени, с
y_sin_n = sin(2 * pi * f0 * tn); % Вектор сигнала
y_cos_n = cos(2 * pi * f0 * tn); % Вектор сигнала

figure(1);
subplot(2, 2, 1);
grid on;
plot(tt, y_sin_t, 'r');
axis([0 NT * T -1.1 1.1]);
title('Интервал наблюдения');
xlabel('t, ms');
ylabel('Sin');

subplot(2, 2, 2);
grid on;
plot(tn, y_sin_n, 'r');
axis([0 (pnt - 1) * dt -1.1 1.1]);
title('Количество точек наблюдения');
xlabel('t, ms');
ylabel('Sin');

subplot(2, 2, 3);
grid on;
plot(tt, y_cos_t, 'r');
axis([0 NT * T -1.1 1.1]);
xlabel('t, ms');
ylabel('Cos');

subplot(2, 2, 4);
grid on;
plot(tn, y_cos_n, 'r');
axis([0 (pnt - 1) * dt -1.1 1.1]);
xlabel('t, ms');
ylabel('Cos');

% *** b ***
Nt = length(y_sin_t);
Nn = length(y_sin_n);

kt = 0:Nt - 1;
Ex = exp(-j * 2 * pi / Nt * kt' * kt);
Y_sin_t = y_sin_t * Ex;
Y_cos_t = y_cos_t * Ex;
Y_sin_t_fft = fft(y_sin_t);
Y_cos_t_fft = fft(y_cos_t);

Y_sin_t_2 = Y_sin_t .* conj(Y_sin_t);
Y_cos_t_2 = Y_cos_t .* conj(Y_cos_t);
ft = kt * fdv / Nt; % Вектор частоты, Гц

kn = 0:Nn - 1;
Ex = exp(-j * 2 * pi / Nn * kn' * kn);
Y_sin_n = y_sin_n * Ex;
Y_cos_n = y_cos_n * Ex;
Y_sin_n_ffn = fft(y_sin_n);
Y_cos_n_ffn = fft(y_cos_n);

Y_sin_n_2 = Y_sin_n .* conj(Y_sin_n);
Y_cos_n_2 = Y_cos_n .* conj(Y_cos_n);
fn = kn * fdv / Nn; % Вектор частоты, Гц

% *** c ***

figure(2)
subplot(2, 2, 1);
grid on;
plot(ft, Y_sin_t_2, 'r');
title('Интервал наблюдения (sin)');
xlabel('Frequency, Hz');
ylabel('Fourier-image modulus squared');

subplot(2, 2, 2);
grid on;
plot(fn, Y_sin_n_2, 'r');
title('Количество точек наблюдения (sin)');
xlabel('Frequency, Hz');
ylabel('Fourier-image modulus squared');

subplot(2, 2, 3);
grid on;
plot(ft, Y_cos_t_2, 'r');
title('Интервал наблюдения (cos)');
xlabel('Frequency, Hz');
ylabel('Fourier-image modulus squared');

subplot(2, 2, 4);
grid on;
plot(fn, Y_cos_n_2, 'r');
title('Количество точек наблюдения (cos)');
xlabel('Frequency, Hz');
ylabel('Fourier-image modulus squared');

figure(3)
subplot(2, 2, 1);
grid on; hold on;
plot(kt, real(Y_sin_t), 'r');
axis([0 Nt -1.1 1.1]);
title('Интервал наблюдения (sin)');
xlabel('Time, s');
ylabel('Initial signal');
legend('real', 'imag');

subplot(2, 2, 2);
grid on; hold on;
plot(kn, real(Y_sin_n), 'r');
axis([0 Nn -1.1 1.1]);
title('Количество точек наблюдения (sin)');
xlabel('Time, s');
ylabel('Initial signal');
legend('real', 'imag');

subplot(2, 2, 3);
grid on; hold on;
plot(kt, real(Y_cos_t), 'r');
plot(kt, imag(Y_cos_t), 'b');
axis([0 Nt -1.1 1.1]);
title('Интервал наблюдения (cos)');
xlabel('Time, s');
ylabel('Initial signal');
legend('real', 'imag');

subplot(2, 2, 4);
grid on; hold on;
plot(kn, real(Y_cos_n), 'r');
plot(kn, imag(Y_cos_n), 'b');
axis([0 Nn -1.1 1.1]);
title('Количество точек наблюдения (cos)');
xlabel('Time, s');
ylabel('Initial signal');
legend('real', 'imag');

disp('**********   Конец работы   **********');
