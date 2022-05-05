function [W,H,time] = performKLNMF(V, dictionarySize, numIterations, sparsityAlpha, thres)
    global NMF_FLAG
    if(~NMF_FLAG)
        [W,H] = nnmf(V,dictionarySize);
    else
        epsilon = 1e-16;
        W = rand(size(V,1),dictionarySize);
        H = rand(dictionarySize,size(V,2));
        disp('NMF Random Time:'); 
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