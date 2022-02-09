% ��������� ����
% ������������ ������ 1
% ��������� ����������� ������� �������������� ������� � ��� ������������

close all; clear all;

disp('-----------------------------------------------------');
disp('*** ��������� ������������ �������������� ������� ***');

% ���� ������� � ��������� �������
f0 = input('������� ������� ������� � ������: ');
A = input('������� ��������� ������� � �������� ��������: ');
phi = input('������� ���� �������, ���: ');
NT = input('������� ���������� �������� ����������, ��.: ');
mvis = input('������� ����������� ���������� ��������� �������������: ');

% ����� ��������� ������
disp('-----------------------------------------------------');
disp('��������� ������:');
disp(['������� ������� (��)                           = ' num2str(f0)]);
disp(['��������� ������� (���.��.)                    = ' num2str(A)]);
disp(['���� �������, ���                              = ' num2str(phi)]);
disp(['���������� �������� �������                    = ' num2str(NT)]);
disp(['����������� ���������� ��������� ������������� = ' num2str(mvis)]);
disp('-----------------------------------------------------');

w = 2 * pi * f0; % ������� � �������� ������� (���/���)
T = 1 / f0; % ������ ��������� ������� (���)
dtn = pi / w; % �������� ������������� ��������� (������� ������������)
dtv = dtn / mvis; % �������� �������������, ��������� ��� ������������

Tnab = NT * T; % �������� ���������� (���)
disp(['�������� ���������� = ' num2str(Tnab) ' ���']);
Nn = Tnab / dtn; % ���������� ����� � ��������� ���������� ��� ������������� ���������
Nv = Tnab / dtv; % ���������� ����� � ��������� ���������� ��� ��������� �������������,
% ���������� ��� ������������
disp(['���������� ����� � ��������� ���������� ��� ������������� ��������� = ' num2str(Nn)]);
disp(['���������� ����� � ��������� ���������� ��� ��������� �������������, ���������� ��� ������������, = ' num2str(Nv)]);

tn = dtn * (0:Nn - 1); % ������ ������� (���), ������������������
% � ������������ � ��������� ���������
tv = dtv * (0:Nv - 1); % � c ���������� �������������,
% ��������� ��� ������������
y1n = A * cos(2 * pi * f0 * tn + phi);
y2n = A * sin(2 * pi * f0 * tn + phi);
% ������� ��������, ������������������
% � ������������ � ��������� ���������
y1v = A * cos(2 * pi * f0 * tv + phi);
y2v = A * sin(2 * pi * f0 * tv + phi);
% ������� ��������, ������������������
% c ���������� �������������,
% ��������� ��� ������������

figure(1);
subplot(2, 2, 1);
plot(tn, y1n, 'r-*');
axis([0 Tnab -1.1 * A 1.1 * A]);
title('������������� �� ���������', 'FontName', 'Courier');
xlabel('Time, sec');
ylabel('Signal');
subplot(2, 2, 2);
plot(tv, y1v, 'b');
axis([0 Tnab -1.1 * A 1.1 * A]);
title(['������������� � ', num2str(mvis), ' ��� ������'], 'FontName', 'Courier');
xlabel('Time, sec');
ylabel('Signal');
subplot(2, 2, 3);
plot(tn, y2n, 'r-*');
axis([0 Tnab -1.1 * A 1.1 * A]);
xlabel('Time, sec');
ylabel('Signal');
subplot(2, 2, 4);
plot(tv, y2v, 'b');
axis([0 Tnab -1.1 * A 1.1 * A]);
xlabel('Time, sec');
ylabel('Signal');

disp('**********   ����� ������   **********');
