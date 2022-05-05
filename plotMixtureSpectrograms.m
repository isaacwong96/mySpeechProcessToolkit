function plotMixtureSpectrograms(complexMixtureSpectrogram, windowSize, overlap, sampleRate, numTime, numFrequencies)
    %figure;
    subplot(211);
    plot_title = 'Mixture spectrogram LEFT';
    stftPlot(reshape( complexMixtureSpectrogram(1,:,:).^(1/3.0),numFrequencies,numTime),windowSize,overlap,sampleRate,plot_title);  
    subplot(212);
    plot_title = 'Mixture spectrogram RIGHT';
    stftPlot(reshape( complexMixtureSpectrogram(2,:,:).^(1/3.0),numFrequencies,numTime),windowSize,overlap,sampleRate,plot_title);  

