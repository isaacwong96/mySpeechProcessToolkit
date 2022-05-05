function targetTDOAGCCNMFs = getTargetTDOAGCCNMFs(coherenceV, microphoneSeparationInMetres, numTDOAs, frequenciesInHz, targetTDOAIndexes, W, stereoH)
    numTargets = length(targetTDOAIndexes);
    
    hypothesisTDOAs = getTDOAsInSeconds(microphoneSeparationInMetres, numTDOAs);
    
    [numFrequencies, numTime] = size( coherenceV );
    [numChannels, numAtom, numTime] = size( stereoH );
    normalizedW = W ;%/ sqrt( sum(W**2, axis=1, keepdims=True) )
    
    expJOmegaTau = zeros( length(frequenciesInHz),numTDOAs);
    for i=1:length( frequenciesInHz)
        expJOmegaTau(i,:) = frequenciesInHz(i)*( -(2j * pi) * hypothesisTDOAs);
    end
    expJOmegaTau = exp(expJOmegaTau);
    
    targetTDOAGCCNMFs = zeros(numTargets,numAtom,numTime);
    for i = 1:length(targetTDOAIndexes)
        gccChunk = zeros(size(coherenceV));
        for j = 1:size(coherenceV,1)
            gccChunk(j,:) = coherenceV(j,:).*expJOmegaTau( j,targetTDOAIndexes(i) );
        end
        targetTDOAGCCNMFs(i,:,:) = real( reshape( (normalizedW.' * gccChunk),1,numAtom,numTime ));
    end
    
    