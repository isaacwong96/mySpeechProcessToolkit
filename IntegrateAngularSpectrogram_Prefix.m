function angularSpectrogram_Integrated = IntegrateAngularSpectrogram_Prefix(angularSpectrogram, window_size)
    [tao, t] = size(angularSpectrogram);
    sums = zeros(tao, t);
    angularSpectrogram_Integrated = zeros(tao,t);
    for i_index = 1:tao
        for j_index = 1:t
            if i_index == 1
                sums(i_index,j_index) = angularSpectrogram(i_index,j_index);
            else
                sums(i_index,j_index) = angularSpectrogram(i_index,j_index)+sums(i_index-1,j_index);
            end
        end
    end
    for i_index = 1:tao
        for j_index = 1:t
            if(i_index - floor(window_size/2) <= 1)
                sum_right = sums(i_index + floor(window_size/2), j_index);
                sum_left = 0;
                cnt = j_index + floor(window_size/2);
            else if(i_index + floor(window_size/2) > tao)
                    sum_right = sums(tao, j_index);
                    sum_left = sums(i_index - floor(window_size/2) - 1, j_index);
                    cnt = window_size - (i_index + floor(window_size/2) - tao);
                else
                    sum_right = sums(i_index + floor(window_size/2), j_index);
                    sum_left = sums(i_index - floor(window_size/2) - 1,j_index);
                    cnt = window_size;
                end
            end
            angularSpectrogram_Integrated(i_index, j_index) = sum_right - sum_left;
        end
    end
                 
    