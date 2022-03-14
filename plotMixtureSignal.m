function plotMixtureSignal(stereoSamples, sampleRate)
    [numSamples, ~] = size(stereoSamples);
    %sampleTimesInSeconds = 0:0.001:numSamples/sampleRate;
    %maxValue = max(abs(stereoSamples))*1.1;
    
    subplot(211);
    %plot(sampleTimesInSeconds, stereoSamples(:,1));
    plot(stereoSamples(:,1));
    axis('tight');
    %ylim((-1*maxValue, maxValue));
    title('Left channel');
    subplot(212);
    %plot(sampleTimesInSeconds, stereoSamples(:,2));
    plot(stereoSamples(:,2));
    axis('tight');
    title('Right channel');
    %ylim((-1*maxValue, maxValue));