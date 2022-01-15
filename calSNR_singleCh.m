%input:I-pure speech;In-speech with noise
%output:snr-signal/noise
function snr = calSNR_singleCh(I, In)
Ps = sum((I-mean(I)).^2);
Pn = sum((I-In).^2);
snr = 10*log10(Ps/Pn);