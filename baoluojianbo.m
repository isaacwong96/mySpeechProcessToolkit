clear all;close all;clc;
[xx, Fs] = audioread('data/input/dev1_male3_liverec_250ms_5cm_mix.wav');

xx = xx(:,1);

[up,lo] = envelope(xx,200,'peak');

figure;
hold on
plot(xx);
hold off

figure;
hold on
plot(up);
plot(lo);
hold off

L = length(xx);
f = Fs*(0:(L/2))/L;
figure;
P2 = fft(xx);
P1 = P2(1:L/2+1);

plot(f,abs(P1));
xlabel('f(Hz)');
ylabel('|*|');

L = length(xx);
f = Fs*(0:(L/2))/L;
figure;
P3 = fft(up);
P4 = P3(1:L/2+1);
f1=1:500;
P4 = P4(f1);
plot(f1,abs(P4));
xlabel('f(Hz)');
ylabel('|*|');
