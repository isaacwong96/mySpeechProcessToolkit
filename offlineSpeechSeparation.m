clear;
clc;
close all;
tic;
%==============================================================================%
%% 0.Basic paras
global NMF_FLAG
global GCC_TYPE_CHOOSE
global GCC_TYPE_CAL_METHOD
NMF_FLAG = 0;           %1 for myNMF(from python GCC_NMF project);
                        %0 for Matlab NMF function
GCC_TYPE_CHOOSE = 0;    %0 for PHAT
                        %1 for ROTH
                        %2 for SCOT
GCC_TYPE_CAL_METHOD = 1;    %0 for paper
                            %1 for book
IF_PLOTTING = 1;        %1 for ploting
                        %0 for not
IF_SAVINGTARGETS=0;     %1 for saving targets
                        %0 for not
%%% Input and Output Dir    0
%%% test4_2020_12_11__12_43_29.wav_sensor4_7_noAll  dev1_female3_liverec_130ms_1m
mixtureFileNamePrefix = 'data/input/dev1_female3_liverec_130ms_1m';
outputDir = 'data/output/dev1_female3_liverec_130ms_1m';
%==============================================================================%
%% 1.Parameter definitions

%%% Preprocessing params
windowSize = 1024;
fftSize = windowSize;
overlap = 87.5; % overlap = 87.5per  <=equal to=> hopSize = 128;

%%% TDOA params
numTDOAs = 128;

%%% NMF params
dictionarySize = 128;
numIterations = 100;
sparsityAlpha = 0;

%%% microphone array and sources params
microphoneSeparationInMetres = 1;
numSources = 3;


%==============================================================================%
%% 2. Input mixture signal

%%% Load mixture signal from the wav file
mixtureFileName = getMixtureFileName(mixtureFileNamePrefix);
[stereoSamples, sampleRate] = loadMixtureSignal(mixtureFileName);

%%% 2ͨ����160k������㣬16kHz�����ʣ���Ƶʱ��10s
[numSamples, ~] = size(stereoSamples);
durationInSeconds = numSamples / sampleRate;

%%% MixtureSignal:describe and plot and play
describeMixtureSignal(stereoSamples, sampleRate);
if(IF_PLOTTING)
    plotMixtureSignal(stereoSamples, sampleRate);
end
%sound(stereoSamples, sampleRate);


%==============================================================================%
%% 3. Complex mixture spectrogram

%%% Compute complex mixture spectrograms from input signal with an STFT

%%% complexMixtureSpectrogram :(2, 513, 1243)
%%% ��һ��ά��Ϊ2���������ͨ���ĸ������
complexMixtureSpectrogram = computeComplexMixtureSpectrogram(stereoSamples, windowSize, overlap); 
%%% numChannels,numFrequencies, numTime�ֱ�Ϊ2,513,1243                                                             
[numChannels, numFrequencies, numTime] = size(complexMixtureSpectrogram);
frequenciesInHz = getFrequenciesInHz(sampleRate, numFrequencies);
frequenciesInkHz = frequenciesInHz / 1000.0;

%%% mixture spectrograms:describe and plot
describeMixtureSpectrograms(windowSize, overlap, complexMixtureSpectrogram)
if(IF_PLOTTING)
    plotMixtureSpectrograms(complexMixtureSpectrogram, windowSize, overlap, sampleRate,numTime, numFrequencies);
end


%==============================================================================%
%% 4. Perform source localization with GCC-PHAT

%%% Localize target TDOA indexes

%spectralCoherenceV = ( reshape(complexMixtureSpectrogram(1,:,:),numFrequencies,numTime) .* reshape( conj(complexMixtureSpectrogram(2,:,:)),numFrequencies,numTime)) ./ (reshape( abs(complexMixtureSpectrogram(1,:,:) ),numFrequencies,numTime) .* reshape( abs(complexMixtureSpectrogram(2,:,:) ),numFrequencies,numTime));
spectralCoherenceV = reshape(complexMixtureSpectrogram(1,:,:),numFrequencies,numTime) .* reshape( conj(complexMixtureSpectrogram(2,:,:)),numFrequencies,numTime);
%spectralCoherenceV = reshape(spectralCoherenceV, numTime, numFrequencies);
%ѡ��ͬ��GCCƵ�ʼ�Ȩ����0 for GCC-PHAT, 1 for GCC-ROTH, 2 for GCC-SCOT
switch(GCC_TYPE_CHOOSE)
    case 0  %for PHAT
        %Ƶ�ʼ�Ȩ����ľ�����㷽ʽ��"Blind Source```"�����롶�������롤���������в�һ��
        %0 for paper
        %1 for book
        if(~GCC_TYPE_CAL_METHOD)%������ļ��㷽ʽ
            tmp = reshape( abs(complexMixtureSpectrogram(1,:,:) ),numFrequencies,numTime) .* reshape( abs(complexMixtureSpectrogram(2,:,:) ),numFrequencies,numTime);
        else
            tmp = reshape( complexMixtureSpectrogram(1,:,:), numFrequencies,numTime) .* reshape( conj(complexMixtureSpectrogram(2,:,:) ),numFrequencies,numTime);
            tmp = abs(tmp);
        end
    case 1  %for ROTH
        if(~GCC_TYPE_CAL_METHOD)
            tmp = reshape( abs(complexMixtureSpectrogram(1,:,:) ),numFrequencies,numTime) .* reshape( abs(complexMixtureSpectrogram(1,:,:) ),numFrequencies,numTime); 
        else
            tmp = reshape( complexMixtureSpectrogram(1,:,:), numFrequencies,numTime) .* reshape( conj(complexMixtureSpectrogram(1,:,:) ),numFrequencies,numTime);
        end
    case 2  %for SCOT
        if(~GCC_TYPE_CAL_METHOD)
            tmp = reshape( abs(complexMixtureSpectrogram(1,:,:) ),numFrequencies,numTime) .* reshape( abs(complexMixtureSpectrogram(2,:,:) ),numFrequencies,numTime);
            tmp = sqrt(tmp.*tmp);
        else
            tmp1 = reshape( complexMixtureSpectrogram(1,:,:), numFrequencies,numTime) .* reshape( conj(complexMixtureSpectrogram(1,:,:)), numFrequencies, numTime);
            tmp2 = reshape( complexMixtureSpectrogram(2,:,:), numFrequencies,numTime) .* reshape( conj(complexMixtureSpectrogram(2,:,:)), numFrequencies, numTime);
            tmp = sqrt(tmp1.*tmp2);
        end
end
spectralCoherenceV = spectralCoherenceV./tmp;
angularSpectrogram = getAngularSpectrogram( spectralCoherenceV, frequenciesInHz,microphoneSeparationInMetres, numTDOAs );
meanAngularSpectrum = mean(angularSpectrogram,2);

targetTDOAIndexes = estimateTargetTDOAIndexesFromAngularSpectrum( meanAngularSpectrum,microphoneSeparationInMetres,numTDOAs, numSources);

%%% target localization:describe and plot
if(IF_PLOTTING)
    plotGCCPHATLocalization( spectralCoherenceV, angularSpectrogram, meanAngularSpectrum,targetTDOAIndexes, microphoneSeparationInMetres, numTDOAs,durationInSeconds ); %#ok<*UNRCH>
end