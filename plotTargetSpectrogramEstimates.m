function plotTargetSpectrogramEstimates(targetSpectrogramEstimates,windowSize, overlap, sampleRate, numTime, numFrequencies)
    RootFactor = 1/3.0;
    magnitudeSpectrogramEstimates = abs(targetSpectrogramEstimates);
    
    [numTargets, numChannels, numFrequencies, numTime] = size( targetSpectrogramEstimates);

    figure;
    
    subplot(321);
    plot_title = 'Source1 LEFT';
    stftPlot(reshape( magnitudeSpectrogramEstimates(1,1,:,:).^RootFactor,numFrequencies,numTime),windowSize,overlap,sampleRate,plot_title);  

    subplot(322);
    plot_title = 'Source1 RIGHT';
    stftPlot(reshape( magnitudeSpectrogramEstimates(1,2,:,:).^RootFactor,numFrequencies,numTime),windowSize,overlap,sampleRate,plot_title); 
    
    subplot(323);
    plot_title = 'Source2 LEFT';
    stftPlot(reshape( magnitudeSpectrogramEstimates(2,1,:,:).^RootFactor,numFrequencies,numTime),windowSize,overlap,sampleRate,plot_title); 
    
    subplot(324);
    plot_title = 'Source2 RIGHT';
    stftPlot(reshape( magnitudeSpectrogramEstimates(2,2,:,:).^RootFactor,numFrequencies,numTime),windowSize,overlap,sampleRate,plot_title); 
    
    subplot(325);
    plot_title = 'Source3 LEFT';
    stftPlot(reshape( magnitudeSpectrogramEstimates(3,1,:,:).^RootFactor,numFrequencies,numTime),windowSize,overlap,sampleRate,plot_title); 
    
    subplot(326);
    plot_title = 'Source3 RIGHT';
    stftPlot(reshape( magnitudeSpectrogramEstimates(3,2,:,:).^RootFactor,numFrequencies,numTime),windowSize,overlap,sampleRate,plot_title); 
  