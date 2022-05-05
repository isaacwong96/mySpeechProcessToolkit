function plotTargetSpectrogramEstimates(targetSpectrogramEstimates,windowSize, overlap, sampleRate, numTime, numFrequencies)
    RootFactor = 1/3.0;
    magnitudeSpectrogramEstimates = abs(targetSpectrogramEstimates);
    
    [numTargets, numChannels, numFrequencies, numTime] = size( targetSpectrogramEstimates);

    figure;
    subplot(611);
    plot_title = 'Source1 LEFT';
    stftPlot(reshape( magnitudeSpectrogramEstimates(1,1,:,:).^RootFactor,numFrequencies,numTime),windowSize,overlap,sampleRate,plot_title);  

    subplot(612);
    plot_title = 'Source1 RIGHT';
    stftPlot(reshape( magnitudeSpectrogramEstimates(1,2,:,:).^RootFactor,numFrequencies,numTime),windowSize,overlap,sampleRate,plot_title); 
    
    subplot(613);
    plot_title = 'Source2 LEFT';
    stftPlot(reshape( magnitudeSpectrogramEstimates(2,1,:,:).^RootFactor,numFrequencies,numTime),windowSize,overlap,sampleRate,plot_title); 
    
    subplot(614);
    plot_title = 'Source2 RIGHT';
    stftPlot(reshape( magnitudeSpectrogramEstimates(2,2,:,:).^RootFactor,numFrequencies,numTime),windowSize,overlap,sampleRate,plot_title); 
    
    subplot(615);
    plot_title = 'Source3 LEFT';
    stftPlot(reshape( magnitudeSpectrogramEstimates(3,1,:,:).^RootFactor,numFrequencies,numTime),windowSize,overlap,sampleRate,plot_title); 
    
    subplot(616);
    plot_title = 'Source3 RIGHT';
    stftPlot(reshape( magnitudeSpectrogramEstimates(3,2,:,:).^RootFactor,numFrequencies,numTime),windowSize,overlap,sampleRate,plot_title); 
    
function plotTargetSpectrogramEstimates(targetSpectrogramEstimates, durationInSeconds, frequenciesInkHz)
    RootFactor = 1/3.0;
    magnitudeSpectrogramEstimates = abs(targetSpectrogramEstimates);
    
    [numTargets, numChannels, numFrequencies, numTime] = size( targetSpectrogramEstimates);

    figure;
    subplot(611);
    imagesc( reshape( magnitudeSpectrogramEstimates(1,1,:,:).^RootFactor,numFrequencies,numTime) );
    set(gca,'YDir','normal')%设置y轴数值为正常显示
    %ylim([0,35]);%y轴范围
    colorbar;%色标
    colormap(flipud( gray(256) ));
    ylabel('Frequency');
    title('Source1,left');

    subplot(612);
    imagesc( reshape( magnitudeSpectrogramEstimates(1,2,:,:).^RootFactor,numFrequencies,numTime) );
    set(gca,'YDir','normal')%设置y轴数值为正常显示
    %ylim([0,35]);%y轴范围
    colorbar;%色标
    colormap(flipud( gray(256) ));
    ylabel('Frequency');
    title('Source1,right');

    subplot(613);
    imagesc( reshape( magnitudeSpectrogramEstimates(2,1,:,:).^RootFactor,numFrequencies,numTime) );
    set(gca,'YDir','normal')%设置y轴数值为正常显示
    %ylim([0,35]);%y轴范围
    colorbar;%色标
    colormap(flipud( gray(256) ));
    ylabel('Frequency');
    title('Source2,left');

    subplot(614);
    imagesc( reshape( magnitudeSpectrogramEstimates(2,2,:,:).^RootFactor,numFrequencies,numTime) );
    set(gca,'YDir','normal')%设置y轴数值为正常显示
    %ylim([0,35]);%y轴范围
    colorbar;%色标
    colormap(flipud( gray(256) ));
    ylabel('Frequency');
    title('Source2,right');

    subplot(615);
    imagesc( reshape( magnitudeSpectrogramEstimates(3,1,:,:).^RootFactor,numFrequencies,numTime) );
    set(gca,'YDir','normal')%设置y轴数值为正常显示
    %ylim([0,35]);%y轴范围
    colorbar;%色标
    colormap(flipud( gray(256) ));
    ylabel('Frequency');
    title('Source3,left');

    subplot(616);
    imagesc( reshape( magnitudeSpectrogramEstimates(3,2,:,:).^RootFactor,numFrequencies,numTime) );
    set(gca,'YDir','normal')%设置y轴数值为正常显示
    %ylim([0,35]);%y轴范围
    colorbar;%色标
    colormap(flipud( gray(256) ));
    ylabel('Frequency');
    title('Source3,left');
   

