function plotSingleChSpectrograms(complexMixtureSpectrogram, numTime, numFrequencies)
    figure;

    imagesc(numTime,numFrequencies,complexMixtureSpectrogram.^(1/3.0));
    set(gca,'YDir','normal')%����y����ֵΪ������ʾ
    %ylim([0,35]);%y�᷶Χ
    colorbar;%ɫ��
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