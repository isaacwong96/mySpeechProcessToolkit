function FrequenciesInHz = getFrequenciesInHz(sampleRate, numFrequencies)
    FrequenciesInHz = linspace(0, sampleRate/2, numFrequencies);