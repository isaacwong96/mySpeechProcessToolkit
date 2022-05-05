function plotSTFT(filaName)
    %==============================================================================%
    %% 1.Parameter definitions

    %%% Preprocessing params
    windowSize = 1024;
    overlap = 87.5; % overlap = 87.5per  <=equal to=> hopSize = 128;


    [stereoSamples, sampleRate] = loadMixtureSignal(filaName);

    %%% 2ͨ����160k������㣬16kHz�����ʣ���Ƶʱ��10s
    [numSamples, ~] = size(stereoSamples);




    %==============================================================================%
    %% 3. Complex mixture spectrogram

    %%% Compute complex mixture spectrograms from input signal with an STFT

    %%% complexMixtureSpectrogram :(2, 513, 1243)
    %%% ��һ��ά��Ϊ2���������ͨ���ĸ������
    complexMixtureSpectrogram = computeComplexMixtureSpectrogram(stereoSamples, windowSize, overlap); 
    %%% numChannels,numFrequencies, numTime�ֱ�Ϊ2,513,1243                                                             
    [numChannels, numFrequencies, numTime] = size(complexMixtureSpectrogram);
    frequenciesInHz = getFrequenciesInHz(sampleRate, numFrequencies);

    %%% mixture spectrograms:describe and plot
    describeMixtureSpectrograms(windowSize, overlap, complexMixtureSpectrogram)
    plotMixtureSpectrograms(complexMixtureSpectrogram, windowSize, overlap, sampleRate,numTime, numFrequencies);


