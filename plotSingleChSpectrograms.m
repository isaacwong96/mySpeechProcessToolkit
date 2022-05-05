function plotSingleChSpectrograms(complexMixtureSpectrogram, numTime, numFrequencies)
    figure;

    imagesc(numTime,numFrequencies,complexMixtureSpectrogram.^(1/3.0));
    set(gca,'YDir','normal')%设置y轴数值为正常显示
    %ylim([0,35]);%y轴范围
    colorbar;%色标
    colormap(flipud( gray(256) ));
    xlabel('t/s');
    ylabel('f/Hz');
    title('double Ch');
    

% def plotMixtureSpectrograms(complexMixtureSpectrogram, frequenciesInkHz, durationInSeconds):
%     numChannels, numFrequencies, numTime = complexMixtureSpectrogram.shape
%     
%     magnitudeSpectrograms = abs(complexMixtureSpectrogram)
%     maxSpectrogramValue = max(magnitudeSpectrograms)
%     
%     phaseSpectrograms = angle(complexMixtureSpectrogram)
%     
%     subplot(211)
%     plotSpectrogram(magnitudeSpectrograms[0], maxSpectrogramValue, durationInSeconds, frequenciesInkHz, 'Left Magnitude Spectrogram')
%     subplot(212)
%     plotSpectrogram(magnitudeSpectrograms[1], maxSpectrogramValue, durationInSeconds, frequenciesInkHz, 'Right Magnitude Spectrogram')
%     xlabel('Time (s)')
%     
%     tight_layout()