function sum = basicSum(angularSpectrogram, i_index, j_index, window_size)
    sum = 0;
    cnt = 0;
    [tao, t] = size(angularSpectrogram);
    for index = i_index-floor(window_size/2) : i_index+floor(window_size/2)
        if index<=0 || index>tao
            continue;
        end
        sum = sum + angularSpectrogram(index,j_index);
        cnt = cnt + 1;
    end
    sum = sum/cnt;
        