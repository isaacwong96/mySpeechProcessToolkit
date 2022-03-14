function sourcePeakIndexes = estimateTargetTDOAIndexesFromAngularSpectrum(angularSpectrum, microphoneSeparationInMetres, numTDOAs, numSources)
    %     a = [0,10,11,12,10,9,8,4,5,6,7,6,5,4,3,2,3,2]
    %     [peakValue,peakIndexes] = findpeaks(a);
    
    [peakValue,peakIndexes] = findpeaks(angularSpectrum);
    tdoasInSeconds = getTDOAsInSeconds(microphoneSeparationInMetres, numTDOAs);
    
    disp('========================================');
    if numSources
        disp(['numSources provided, taking first ',num2str(numSources),' peaks']);
        %sourcePeakIndexes = peakIndexes[ argsort(angularSpectrum[peakIndexes])[-numSources:] ]
        [~, temp] = sort(angularSpectrum(peakIndexes));
        sourcePeakIndexes = peakIndexes( temp );
        if length(sourcePeakIndexes) ~= numSources
            disp('didn''t find enough peaks in ITDFunctions.estimateTargetTDOAIndexesFromAngularSpectrum... aborting' );
            %exit();
        end
%     else
%         kMeans = KMeans(n_clusters=2, n_init=10)
%         kMeans.fit(angularSpectrum[peakIndexes][:, newaxis])
%         sourcesClusterIndex = argmax(kMeans.cluster_centers_)
%         sourcePeakIndexes = peakIndexes[where(kMeans.labels_ == sourcesClusterIndex)].astype('int32')
%         disp('numSources not provided, found %d sources' % len(sourcePeakIndexes) )
    end
    
%     % return sources ordered left to right
    sourcePeakIndexes = sort(sourcePeakIndexes);
     
    disp( ['Found target TDOAs: ', num2str(sourcePeakIndexes.') ]);