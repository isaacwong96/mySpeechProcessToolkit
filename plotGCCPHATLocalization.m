function plotGCCPHATLocalization(spectralCoherenceV, angularSpectrogram, meanAngularSpectrum, targetTDOAIndexes, microphoneSeparationInMetres, numTDOAs, durationInSeconds)
    maxTDOA = getMaxTDOA(microphoneSeparationInMetres);
    tdoasInSeconds = getTDOAsInSeconds(microphoneSeparationInMetres, numTDOAs);
    
    figure;
    subplot(121);
    rectifiedAngularSpectrogram = angularSpectrogram;
    %rectifiedAngularSpectrogram[rectifiedAngularSpectrogram < 0] = 0;
    imagesc( rectifiedAngularSpectrogram);
    set(gca,'YDir','normal')%设置y轴数值为正常显示
    %ylim([0,35]);%y轴范围
    colorbar;%色标
    colormap(flipud( gray(64) ));
    ylabel('TDOA (s)');
    xlabel('Time (s)');
    title('GCC-PHAT Angular Spectrogram');
    
    subplot(122);
    plot(tdoasInSeconds, meanAngularSpectrum);
    axis('tight');
    xlabel('TDOA (s)')
    title('Mean GCC-PHAT Angular Spectrum')
