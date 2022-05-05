clc;close all;
[input, Fs] = audioread('dev1_male3_liverec_130ms_1m_mix.wav');
input1 = input(:,1);
input2 = input(:,2);
snr = -14;
[y1, noise1] = gaussNoiseGen(input1, snr);
[y2, noise2] = gaussNoiseGen(input2, snr);
[len, dim] = size(y1);
output = zeros(len, 2);
output(:,1) = y1;
output(:,2) = y2;
audiowrite(['dev1_male3_liverec_130ms_1m_',num2str(snr),'dB_mix.wav'], output, Fs);

%about zhuanli  2022.3.20
% [input1,Fs] = audioread('myShow1.wav');
% [input2,Fs] = audioread('myShow2.wav');
% snr = 5;
% [y1,noise] = gaussNoiseGen(input1, 5);
% [y2,noise] = gaussNoiseGen(input1, 1);
% [y3,noise] = gaussNoiseGen(input2, 5);
% [y4,noise] = gaussNoiseGen(input2, 1);
% figure;
% 
% subplot(321);
% plot(input1);
% axis([0 10000 -1 1])
% 
% subplot(322);
% plot(input2);
% axis([0 10000 -1 1])
% 
% subplot(323);
% plot(y1);
% axis([0 10000 -1 1])
% 
% subplot(324);
% plot(y3);
% axis([0 10000 -1 1])
% 
% subplot(325);
% plot(y2);
% axis([0 10000 -1 1])
% 
% subplot(326);
% plot(y4);
% axis([0 10000 -1 1])
% 
% audiowrite(['myShow1_',int2str(5),'dB.wav'],y1,Fs);
% audiowrite(['myShow1_',int2str(1),'dB.wav'],y3,Fs);
% audiowrite(['myShow2_',int2str(5),'dB.wav'],y2,Fs);
% audiowrite(['myShow2_',int2str(1),'dB.wav'],y4,Fs);