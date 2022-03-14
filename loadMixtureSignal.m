function [stereoSamples, sampleRate] = loadMixtureSignal(mixtureFileName)
	[stereoSamples, sampleRate] = audioread(mixtureFileName);