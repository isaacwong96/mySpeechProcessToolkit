function plotTarget(targetSignalEstimates)
    %[numSamples, ~] = size(targetSignalEstimates);
    %sampleTimesInSeconds = 0:0.001:numSamples/sampleRate;
    %maxValue = max(abs(stereoSamples))*1.1;
    [tmp1, tmp2, tmp3] = size(targetSignalEstimates);
    figure;
    subplot(311);
    %plot(sampleTimesInSeconds, stereoSamples(:,1));
    
    plot(reshape(targetSignalEstimates(1,1,:), 1, tmp3));
    axis('tight');
    %ylim((-1*maxValue, maxValue));
    title('Channel 1');
    subplot(312);
    %plot(sampleTimesInSeconds, stereoSamples(:,2));
    plot(reshape(targetSignalEstimates(2,1,:), 1, tmp3));
    axis('tight');
    title('Channel 2');
    %ylim((-1*maxValue, maxValue));
    subplot(313);
    %plot(sampleTimesInSeconds, stereoSamples(:,2));
    plot(reshape(targetSignalEstimates(3,1,:), 1, tmp3));
    axis('tight');
    title('Channel 3');