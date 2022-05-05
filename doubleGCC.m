clear;
clc;
close all;

%==============================================================================%
%% 0.Basic paras
global NMF_FLAG
global GCC_TYPE_CHOOSE
global GCC_TYPE_CAL_METHOD
NMF_FLAG = 1;           %1 for myNMF(from python GCC_NMF project);
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
RANDOM = 0;
RANDOM_ACOL = 1;
RANDOM_C = 2;
RANDOM_INFI = 3;

NMF_INIT_METHOD = RANDOM_INFI;

IF_TEST_AND_RECORD_NMF_INIT = 0;


%%% Input and Output Dir    0
%%% test4_2020_12_11__12_43_29.wav_sensor4_7_noAll  dev1_female3_liverec_130ms_1m
mixtureFileName = 'data/input/section5_delay_1ms.wav';
outputDir = 'data/output/twoCh_delay_2ms_-2ms';
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
numIterations = 10000;
sparsityAlpha = 0;

%%% microphone array and sources params
microphoneSeparationInMetres = 1;
numSources = 3;

set(0,'defaultfigurecolor','w');
%==============================================================================%
%% 2. Input mixture signal

%%% Load mixture signal from the wav file
[stereoSamples, sampleRate] = loadMixtureSignal(mixtureFileName);

%%% 2ͨ����160k������㣬16kHz�����ʣ���Ƶʱ��10s
[numSamples, ~] = size(stereoSamples);
durationInSeconds = numSamples / sampleRate;

%%% MixtureSignal:describe and plot and play
describeMixtureSignal(stereoSamples, sampleRate);
if(IF_PLOTTING)
    %plotMixtureSignal(stereoSamples, sampleRate);
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
    %plotMixtureSpectrograms(complexMixtureSpectrogram, windowSize, overlap, sampleRate,numTime, numFrequencies);
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

tic;
%angularSpectrogram = [1,1,1,1,1,1;2,2,2,2,2,2;3,3,3,3,3,3;4,4,4,4,4,4;5,5,5,5,5,5;6,6,6,6,6,6;7,7,7,7,7,7;8,8,8,8,8,8;9,9,9,9,9,9];
angularSpectrogram_Integrated_Basic = IntegrateAngularSpectrogram(angularSpectrogram, 15);
toc;
tic;
angularSpectrogram_Integrated_Prefix = IntegrateAngularSpectrogram_Prefix(angularSpectrogram, 15);
toc;
%compare = angularSpectrogram_Integrated_Basic-angularSpectrogram_Integrated_Prefix;

meanAngularSpectrum = mean(angularSpectrogram,2);

[tao, t] = size(angularSpectrogram_Integrated_Prefix);

meanAngularSpectrum_Integrated = mean(angularSpectrogram_Integrated_Basic,2);

targetTDOAIndexes = estimateTargetTDOAIndexesFromAngularSpectrum( meanAngularSpectrum,microphoneSeparationInMetres,numTDOAs, numSources);
targetTDOAIndexes = [21,56,81];
%targetTDOAIndexes = [21,56,81,105];
%targetTDOAIndexes = [21,108]; %2,-2
%targetTDOAIndexes = [64,75]; %0.5 0
%targetTDOAIndexes = [86,97]; %1.5 1

targetTDOAIndexes_Integrated = estimateTargetTDOAIndexesFromAngularSpectrum_Integrated(meanAngularSpectrum_Integrated);
%%% target localization:describe and plot
if(IF_PLOTTING)
    plotGCCPHATLocalization( spectralCoherenceV, angularSpectrogram, meanAngularSpectrum,targetTDOAIndexes, microphoneSeparationInMetres, numTDOAs,durationInSeconds ); %#ok<*UNRCH>
    plotGCCPHAT_Integration_Localization(angularSpectrogram_Integrated_Basic, meanAngularSpectrum_Integrated, microphoneSeparationInMetres, numTDOAs);
end

