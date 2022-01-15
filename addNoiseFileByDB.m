function[y,noise] = addNoiseFileByDB(s,filepath_name,SNR,fs)
s=s(:);
[wavin,fs1,nbits]=audioread(filepath_name);
wavin = wavin(:);
if fs1~=fs
    wavin1 = resample(wavin,fs,fs1);
else
    wavin1 = wavin;
end
ns = length(s);
noise=wavin1(1:ns);
noise=noise-mean(noise);
signal_power=1/ns*sum(s.*s);
noise_power=1/ns*sum(noise.*noise);
noise_variance=signal_power/(10^(SNR/10));
noise = sqrt(noise_variance/noise_power)*noise;
y = s + noise;