function describeMixtureSpectrograms(windowSize, overlap, complexMixtureSpectrogram)
    disp('========================================');
    disp('STFT:');
    disp(['    windowSize: ', num2str(windowSize)]);
    disp(['    overlap: ', num2str(overlap),'%']);
    disp(['    complexMixtureSpectrogram.shape = (numChannels, numFreq, numFrequencies): ',num2str( size(complexMixtureSpectrogram))]);
    disp(['    complexMixtureSpectrogram.dtype = ',class(complexMixtureSpectrogram)]);