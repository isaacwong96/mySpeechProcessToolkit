function plotGCCPHAT_Integration_Localization(angularSpectrogram_Integrated, meanAngularSpectrum,microphoneSeparationInMetres,numTDOAs)
    tdoasInSeconds = getTDOAsInSeconds(microphoneSeparationInMetres, numTDOAs);
    subplot(223);
    rectifiedAngularSpectrogram = angularSpectrogram_Integrated;
    %rectifiedAngularSpectrogram[rectifiedAngularSpectrogram < 0] = 0;
    imagesc( rectifiedAngularSpectrogram);
    set(gca,'YDir','normal')%����y����ֵΪ����ʾ
    %ylim([0,35]);%y�᷶Χ
    colorbar;%ɫ��
    colormap(flipud( gray(64) ));
    ylabel('TDOA');
    xlabel('Time');
    %title('GCC-PHAT Angular Spectrogram');
    
    subplot(224);
    plot(tdoasInSeconds, meanAngularSpectrum);
    axis('tight');
    xlabel('TDOA');
    ylabel('Amplitude');
    %title('Mean GCC-PHAT Angular Spectrum')
