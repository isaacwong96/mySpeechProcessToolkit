function plotMixtureSignal(stereoSamples, sampleRate)
    [numSamples, ~] = size(stereoSamples);

    t = 1:size(stereoSamples, 1);
    t = t ./ sampleRate;
    
    subplot(211);
    plot(t, stereoSamples(:,1));
    axis('tight');
    ylim([-0.1 0.1]);
    xlabel('Time(s)','FontSize',8);
    ylabel('Amplitude','FontSize',8);
    %title('Left channel');
    subplot(212);
    plot(t,stereoSamples(:,2));
    axis('tight');
    %title('Right channel');
    ylim([-0.1 0.1]);
    xlabel('Time(s)','FontSize',8);
    ylabel('Amplitude','FontSize',8);