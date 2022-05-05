function plotSpectrogram(spectrogram, maxValue, durationInSeconds, frequenciesInkHz, titleLabel)
    imshow((spectrogram / maxValue) ** (1/3.0),
           extent=[0, durationInSeconds, frequenciesInkHz[0], frequenciesInkHz[-1]],
           cmap=cm.binary)
    title(titleLabel)
    ylabel('Frequency (kHz)')
    xlabel('Time (s)')