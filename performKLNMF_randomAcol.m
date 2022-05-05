function [W,H,time] = performKLNMF_randomAcol(V, dictionarySize, numIterations, sparsityAlpha, thres)
    global NMF_FLAG
    if(~NMF_FLAG)
        [W,H] = nnmf(V,dictionarySize);
    else
        epsilon = 1e-16;
        W = zeros(size(V,1),dictionarySize);
%this method too slow;about 10s one time
%         for i_index = 1:dictionarySize
%             W(:,i_index) = V(:,randi([1, size(V,2)]));
%         end
        q = 5;
        for i_index = 1:dictionarySize
            randIndex = randi([1, size(V,2)],[1,q]);
            tempCol = zeros(size(V,1),1);
            for j_index = 1:q
                tempCol = tempCol + V(:,randIndex(j_index));
            end
            tempCol = tempCol ./ q;
            W(:,i_index)=tempCol;
        end
        H = rand(dictionarySize,size(V,2));
        disp('NMF Random Acol Time:'); 
        tic;
        for i = 1:numIterations
            %i
            tmp11 = sum(W,1).'+sparsityAlpha+epsilon;
            tmp12 = W.'*(V./ (W*H) );
            tmp14 = ones(1, size(H,2));
            tmp13 = tmp11 * tmp14;
            H = H.*( tmp12 ./ (tmp13) );
            temp2 = sum(H,2);
            temp4 = (V ./ (W*H))  *  H.';
            temp6 = ones(size(W, 1), 1) * temp2.';
            temp5 = temp4   ./   temp6;
            W = W  .*  temp5;

            temp3 = sum(W.^2,1);
            dictionaryAtomNorms = sqrt( temp3);
            W = W./(ones(size(W, 1), 1) * dictionaryAtomNorms);
            H = H.*(dictionaryAtomNorms.' * ones(1, size(H,2)));
            
            V_eval = W*H;
            cha = V - V_eval;
            cha = cha .* cha;
            cost = 0.5*sum(cha(:));
            %cost
            if cost < thres
                break;
            end
        end
        toc;
        time = toc;
    end
end