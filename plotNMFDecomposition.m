function plotNMFDecomposition(V, W, H, freqsInkHz, durationInSeconds)
    wRootFactor = 1/3.0;
    hRootFactor = 1/1.2;
    [numFreq, ~] = size(W);
    [dictionarySize, numTime] = size(H);
    %stftTimesInSeconds = linspace(0, durationInSeconds*2, numWindows);
    
    figure;
    windowSize = 1024;
    overlap = 87.5;
    sampleRate = 16000;
    plot_title = 'dfsf';
    stftPlot(V.^(1/3.0),windowSize,overlap,sampleRate,plot_title);  
    
%     figure;
% %     imshow( V.^(1/3.0) ,[]);
%     imagesc(numFreq,numWindows,V.^(1/3.0));
%     set(gca,'YDir','normal')%����y����ֵΪ����ʾ
%     colorbar;
%     c_bound_lower = -160;
%     c_bound_higher = 0;
%     caxis([c_bound_lower c_bound_higher]) 
%     shading flat
%     colormap(hot);
%     %colormap(flipud(gray(256)));
%     %title('Input V');
%     %title('Input V (left and right spectrograms concatenated in time)');
%     ylabel('Frequency');
%     xlabel('Time');
    
    figure;
    subplot(121);
    %imshow( W.'.^wRootFactor ,[]);
    imagesc([1,dictionarySize],[1,numFreq],W.^wRootFactor);
    set(gca,'YDir','normal')%����y����ֵΪ����ʾ
    colorbar;
    %colormap(default);
    colormap(flipud(gray(256)));
    %title('Dictionary W');
    ylabel('Frequency');
    xlabel('Atom index');
    
    subplot(122);
    %imshow( H.^hRootFactor,[] );
    imagesc([1,numTime],[1,dictionarySize],H.^hRootFactor);
    set(gca,'YDir','normal')%����y����ֵΪ����ʾ
    colorbar;
    %colormap(default);
    colormap(flipud(gray(256)));
    %title('Coefficients H');
    %title('Coefficients H (left and right coefficients concatenated in time)');
    ylabel('Atom index');
    xlabel('Time');
% def plotNMFDecomposition(V, W, H, freqsInkHz, durationInSeconds, numAtomsToPlot, wRootFactor = 1/3.0, hRootFactor = 1/1.2):
%     numFreq, dictionarySize = W.shape
%     dictionarySize, numWindows = H.shape
%     stftTimesInSeconds = linspace(0, durationInSeconds*2, numWindows)
%     
%     plotColor = 'k'
%     scalingFactor = .9
%     
%     subplot(311)
%     imshow( V ** (1/3.0), extent=[0, durationInSeconds*2, freqsInkHz[0], freqsInkHz[-1]], cmap=cm.binary )
%     plot( (durationInSeconds, durationInSeconds), (freqsInkHz[0], freqsInkHz[-1]), '--' )
%     title('Input V (left and right spectrograms concatenated in time)')
%     ylabel('Frequency (kHz)')
%     xlabel('Time (s)')
%     
%     subplot(323)
%     imshow( W.T ** wRootFactor, extent=[freqsInkHz[0], freqsInkHz[-1], 0, dictionarySize], cmap=cm.binary )
%     title('Dictionary W')
%     ylabel('Atom index')
%     xlabel('Frequency (kHz)')
%     
%     # plot a subset of dictionary atoms in detail: columns of W
%     subplot(324)
%     title('Subset of dictionary atoms (detail)')
%     plotCols(freqsInkHz, W[:, :numAtomsToPlot] ** wRootFactor, plotColor, scalingFactor)
%     ylabel('Atom index')
%     xlabel('Frequency (kHz)')
%     
%     subplot(325)
%     imshow( H ** hRootFactor, extent=[0, durationInSeconds*2, 0, dictionarySize], cmap=cm.binary )
%     plot( (durationInSeconds, durationInSeconds), (0, dictionarySize), '--' )
%     ylim(0, dictionarySize-1)
%     title('Coefficients H (left and right coefficients concatenated in time)')
%     ylabel('Atom index')
%     xlabel('Time (s)')
%     
%     # plot a subset of dictionary atoms in detail (left): rows of H
%     subplot(326)
%     title('Subset of left and right atom coefficients H (detail)')
%     plotRows(stftTimesInSeconds, H[:numAtomsToPlot] ** hRootFactor, plotColor, scalingFactor)
%     plot( (durationInSeconds, durationInSeconds), (0, numAtomsToPlot), '--' )
%     ylabel('Atom index')
%     xlabel('Time (s)')
%     
%     tight_layout()