function targetSpectrogramEstimates = getTargetSpectrogramEstimates(targetCoefficientMasks, complexMixtureSpectrogram, W, stereoH)
    numTargets = size(targetCoefficientMasks,1);
    [temp1,temp2,temp3] = size(targetCoefficientMasks);
    targetSpectrogramEstimates = zeros([numTargets,size(complexMixtureSpectrogram)]);
    [temp4,temp5,temp6,temp7] = size(targetSpectrogramEstimates);
    [temp8,temp9,temp10] = size(stereoH);
    for i = 1:numTargets
        for j = 1:size(stereoH,1)
            targetSpectrogramEstimates(i,j,:,:) = W * reshape(  reshape(stereoH(j,:,:),temp9,temp10).* reshape( targetCoefficientMasks(i,:,:),temp9,temp10),temp2,temp3 );
        end
    end
    temp = exp( 1j.*angle(complexMixtureSpectrogram));
    for i = 1:numTargets
        for j = 1:size(stereoH,1)
            targetSpectrogramEstimates(i,j,:,:) = targetSpectrogramEstimates(i,j,:,:) .* reshape(temp(j,:,:),1,1,temp6,temp7); 
        end
    end
