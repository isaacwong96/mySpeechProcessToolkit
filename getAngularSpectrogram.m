function res = getAngularSpectrogram(spectralCoherenceV, frequenciesInHz, microphoneSeparationInMetres, numTDOAs)
    [numFrequencies, numTime] = size(spectralCoherenceV);
    tdoasInSeconds = getTDOAsInSeconds(microphoneSeparationInMetres, numTDOAs);%tdoasInSeconds:128*1

    expJOmega = zeros(numFrequencies,numTDOAs);
    for i=1:numFrequencies
        expJOmega(i,:) = frequenciesInHz(i)*( -(2j * pi) * tdoasInSeconds);
    end
    expJOmega = exp(expJOmega);
    res = spectralCoherenceV.' * expJOmega;
    res = real(res.');
