function complexMixtureSpectrograms = computeComplexMixtureSpectrogram(stereoSamples, windowSize, overlap)
    fftSize = windowSize;

    stereoSamples1 = zeroPad(stereoSamples(:,1),fftSize,overlap);
    stereoSamples2 = zeroPad(stereoSamples(:,2),fftSize,overlap);
    [complexMixtureSpectrograms1,~] = my_stft(stereoSamples1, fftSize, overlap);
    [complexMixtureSpectrograms2,~] = my_stft(stereoSamples2, fftSize, overlap);

    [x, y]=size(complexMixtureSpectrograms1);
    complexMixtureSpectrograms = zeros(2,x,y);
    complexMixtureSpectrograms(1,:,:) = complexMixtureSpectrograms1;
    complexMixtureSpectrograms(2,:,:) = complexMixtureSpectrograms2;
