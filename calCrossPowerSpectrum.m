clc;close all;clear all;
[input, Fs] = audioread('output.wav');
input1 = input(:,1);
input2 = input(:,2);
[pxy,F] = cpsd(input1,input2,1024,512,1024,16000);
plot(F,angle(pxy));