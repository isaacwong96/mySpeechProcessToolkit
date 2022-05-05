function targetCoefficientMasks = getTargetCoefficientMasks(targetTDOAGCCNMFs, numTargets)
%     nanArgMax = nanargmax(targetTDOAGCCNMFs, axis=0)
%     
%     targetCoefficientMasks = zeros_like(targetTDOAGCCNMFs)
%     for targetIndex in range(numTargets):
%         targetCoefficientMasks[targetIndex][where(nanArgMax==targetIndex)] = 1
%     return targetCoefficientMasks
    targetCoefficientMasks = zeros(size(targetTDOAGCCNMFs));
    
    for i = 1:size(targetTDOAGCCNMFs,2)
        for j = 1:size(targetTDOAGCCNMFs,3)
            [max_value,max_index] = max(targetTDOAGCCNMFs(:,i,j));
            targetCoefficientMasks(max_index,i,j) = 1;
        end
    end    
    