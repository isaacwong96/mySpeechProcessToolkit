[input, Fs] = audioread('F007_Ba_L1_BA.wav');
input = input(:,1);
input = input(1:8000);
N=length(input);
time=(0:N-1)/Fs;
plot(time,input,'b'); grid; axis tight;
xlabel('时间/s');ylabel('幅度');