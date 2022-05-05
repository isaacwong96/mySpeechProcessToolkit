function saveTargetSignalEstimates(targetSignalEstimates, sampleRate, mixtureFileNamePrefix, numSources)
    global NMF_FLAG;
    global GCC_TYPE_CHOOSE;
    global GCC_TYPE_CAL_METHOD;
    
    temp = '.wav';
    if(NMF_FLAG)
        temp = ['_usingMyNMF_',temp];
    end
    if(~GCC_TYPE_CAL_METHOD)
        temp = ['_paper', temp];
    else
        temp = ['_book', temp];
    end
    switch(GCC_TYPE_CHOOSE)
        case 0
            temp = ['_PHAT', temp];
        case 1
            temp = ['_ROTH', temp];
        case 2
            temp = ['_SCOT', temp];
    end
    
    ll = size(targetSignalEstimates,3);
    
    for i = 1: numSources
        target = zeros(ll,2);
        target(:,1) = targetSignalEstimates(i, 1, :);
        target(:,2) = targetSignalEstimates(i, 2, :);
        audiowrite([mixtureFileNamePrefix,'mix',num2str(i),temp],target,sampleRate);
    end
%     target1 = zeros(ll,2);
%     target2 = zeros(ll,2);
%     target3 = zeros(ll,2);
%     target1(:,1) = targetSignalEstimates(1,1,:);
%     target1(:,2) = targetSignalEstimates(1,2,:);
%     target2(:,1) = targetSignalEstimates(2,1,:);
%     target2(:,2) = targetSignalEstimates(2,2,:);
%     target3(:,1) = targetSignalEstimates(3,1,:);
%     target3(:,2) = targetSignalEstimates(3,2,:);
%     
%     audiowrite([mixtureFileNamePrefix,'mix1',temp],target1,sampleRate);
%     audiowrite([mixtureFileNamePrefix,'mix2',temp],target2,sampleRate);
%     audiowrite([mixtureFileNamePrefix,'mix3',temp],target3,sampleRate);
