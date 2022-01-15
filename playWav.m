[input, Fs] = audioread('test.wav');
input = input(:,1);
N=length(input);
time=(0:N-1)/Fs;
plot(time,input,'b'); grid; axis tight;
xlabel('时间/s');ylabel('幅度');