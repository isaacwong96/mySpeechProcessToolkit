[input,Fs] = audioread('test.wav');
input = input(:,1);
snr = 5;
[y,noise] = gaussNoiseGen(input, snr);
audiowrite(['speechWithNoise_',int2str(snr),'dB.wav'],y,Fs);