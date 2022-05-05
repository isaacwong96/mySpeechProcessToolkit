function targetSignalEstimates = getTargetSignalEstimates( targetSpectrogramEstimates, numSources, windowSize, overlap)
    [temp1,temp2,temp3,temp4] = size(targetSpectrogramEstimates);
    stftGainFactor = 128 / windowSize* 2;
   
    targetSignalEstimates_Target1_Ch1 = my_istft( reshape( targetSpectrogramEstimates(1,1,:,:),temp3,temp4),1024,overlap);
    targetSignalEstimates_Target1_Ch1 = targetSignalEstimates_Target1_Ch1.*stftGainFactor;
    targetSignalEstimates = zeros(3,2,length(targetSignalEstimates_Target1_Ch1));
    
    for i = 1:numSources
        targetSignalEstimates(i,1,:) = my_istft( reshape( targetSpectrogramEstimates(i,1,:,:),temp3,temp4),windowSize,overlap) .* stftGainFactor;
        targetSignalEstimates(i,2,:) = my_istft( reshape( targetSpectrogramEstimates(i,2,:,:),temp3,temp4),windowSize,overlap) .* stftGainFactor;
    end
        
%     targetSignalEstimates_Target1_Ch1 = my_istft( reshape( targetSpectrogramEstimates(1,1,:,:),temp3,temp4),1024,overlap);
%     targetSignalEstimates_Target1_Ch1 = targetSignalEstimates_Target1_Ch1.*stftGainFactor;
%     targetSignalEstimates_Target1_Ch2 = my_istft( reshape( targetSpectrogramEstimates(1,2,:,:),temp3,temp4),1024,overlap);
%     targetSignalEstimates_Target1_Ch2 = targetSignalEstimates_Target1_Ch2.*stftGainFactor;
%     targetSignalEstimates(1,1,:) = targetSignalEstimates_Target1_Ch1;
%     targetSignalEstimates(1,2,:) = targetSignalEstimates_Target1_Ch2;
%     
%     targetSignalEstimates_Target2_Ch1 = my_istft( reshape( targetSpectrogramEstimates(2,1,:,:),temp3,temp4),1024,overlap);
%     targetSignalEstimates_Target2_Ch1 = targetSignalEstimates_Target2_Ch1.*stftGainFactor;
%     targetSignalEstimates_Target2_Ch2 = my_istft( reshape( targetSpectrogramEstimates(2,2,:,:),temp3,temp4),1024,overlap);
%     targetSignalEstimates_Target2_Ch2 = targetSignalEstimates_Target2_Ch2.*stftGainFactor;
%     targetSignalEstimates(2,1,:) = targetSignalEstimates_Target2_Ch1;
%     targetSignalEstimates(2,2,:) = targetSignalEstimates_Target2_Ch2;
%     
%     targetSignalEstimates_Target3_Ch1 = my_istft( reshape( targetSpectrogramEstimates(3,1,:,:),temp3,temp4),1024,overlap);
%     targetSignalEstimates_Target3_Ch1 = targetSignalEstimates_Target3_Ch1.*stftGainFactor;
%     targetSignalEstimates_Target3_Ch2 = my_istft( reshape( targetSpectrogramEstimates(3,2,:,:),temp3,temp4),1024,overlap);
%     targetSignalEstimates_Target3_Ch2 = targetSignalEstimates_Target3_Ch2.*stftGainFactor;
%     targetSignalEstimates(3,1,:) = targetSignalEstimates_Target3_Ch1;
%     targetSignalEstimates(3,2,:) = targetSignalEstimates_Target3_Ch2;
    
    
    