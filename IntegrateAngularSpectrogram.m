function angularSpectrogram_Integrated = IntegrateAngularSpectrogram(angularSpectrogram, window_size)
    [tao, t] = size(angularSpectrogram);
    angularSpectrogram_Integrated = zeros(tao, t);
    for i_index = 1:tao
        for j_index = 1:t
            angularSpectrogram_Integrated(i_index,j_index) = basicSum(angularSpectrogram, i_index, j_index, window_size);
        end
    end
            
    
