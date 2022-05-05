function [W,H,time] = performKLNMF_randomInfi(V, dictionarySize, numIterations, sparsityAlpha, thres)
    global NMF_FLAG
    if(~NMF_FLAG)
        [W,H] = nnmf(V,dictionarySize);
    else
        epsilon = 1e-16;
        q = 5;
        W = ones(size(V,1),dictionarySize);
        
%=======find top k(q) col by 2-norm==============
        V_2_max_col = max(V);
        topKPair = zeros(size(V_2_max_col,2),2);
        topKPair(:,1) = V_2_max_col.';
        topKPair(:,2) = 1:size(V_2_max_col,2);
        topKPair = sortrows(topKPair, -1);
        
        sum1 = zeros(size(V,1),1);
        for i_index = 1:q
            sum1 = sum1 + V(:,topKPair(i_index, 2));
        end
        sum1 = sum1 / q;
        for i_index = 1:size(W,2)
            W(:,i_index) = W(:,i_index).*sum1;
        end
%================================================       
        H = rand(dictionarySize,size(V,2));
        disp('NMF Random Infi Time:'); 
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