function plotGCCPHATLocalization(spectralCoherenceV, angularSpectrogram, meanAngularSpectrum, targetTDOAIndexes, microphoneSeparationInMetres, numTDOAs, durationInSeconds)
    maxTDOA = getMaxTDOA(microphoneSeparationInMetres);
    tdoasInSeconds = getTDOAsInSeconds(microphoneSeparationInMetres, numTDOAs);
    
    %figure;
    subplot(221);
    rectifiedAngularSpectrogram = angularSpectrogram;
    %rectifiedAngularSpectrogram[rectifiedAngularSpectrogram < 0] = 0;
    imagesc( rectifiedAngularSpectrogram);
    set(gca,'YDir','normal')%����y����ֵΪ����ʾ
    %ylim([0,35]);%y�᷶Χ
    colorbar;%ɫ��
    colormap(flipud( gray(64) ));
    ylabel('TDOA','FontSize', 8);
    xlabel('Time','FontSize', 8);
    %title('GCC-PHAT Angular Spectrogram');
    
    subplot(222);
    plot(tdoasInSeconds, meanAngularSpectrum, 'k');
    axis('tight');
    xlabel('TDOA','FontSize', 8);
    ylabel('Amplitude','FontSize', 8);
    %title('Mean GCC-PHAT Angular Spectrum')
