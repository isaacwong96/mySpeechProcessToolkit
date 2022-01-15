function [signal, noise] = addNoiseDataByDB(s, data, fs, fs1,snr)
s = s(:); %turn colonm to row
sL = length(s);
if fs~=fs1
    x=resample(data, fs, fs1);
else
    x = data;
end
x = x(:);
xL = length(x);
if xL >= sL
    x = x(1:sL);
else
    x = [x,zeros(sL-xL,1)];
end
Sr = snr;
Es = sum(s.*s);
Ev = sum(x.*x);
a=sqrt(Es/Ev/(10^(Sr/10)));
noise = a*x;
signal = s + noise;