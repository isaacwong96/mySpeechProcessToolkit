function describeMixtureSignal(stereoSamples, sampleRate)
    [numSamples, numChannels] = size(stereoSamples);
    
    disp('========================================');
    disp('Input mixture signal:');
    disp(['    sampleRate: ', num2str(sampleRate), 'samples/sec']);
    disp(['    numChannels:', num2str(numChannels)]);
    disp(['    numSamples:', num2str(numSamples)]);
    disp(['    dtype: ' , class(stereoSamples)]);
    disp(['    duration: ', num2str(numSamples/sampleRate), ' seconds']);