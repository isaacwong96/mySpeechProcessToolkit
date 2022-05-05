function sourcePeakIndexes = estimateTargetTDOAIndexesFromAngularSpectrum_Integrated(angularSpectrogram_Integrated, meanAngularSpectrum_Integrated)
    [peakValue,peakIndexes] = findpeaks(angularSpectrogram_Integrated);
    [~, temp1] = sort(angularSpectrogram_Integrated(peakIndexes));
    sourcePeakIndexes = peakIndexes( temp1 );
    sourcePeakIndexes = sort(sourcePeakIndexes);