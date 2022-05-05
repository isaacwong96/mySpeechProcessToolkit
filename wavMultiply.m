filename = 'dev1_male3_liverec_130ms_1m_mix.wav';
output_len_s = 500;
[input,Fs] = audioread('dev1_male3_liverec_130ms_1m_mix.wav');
output_Fs = 3*Fs;
[m, n] = size(input);
beishu = output_len_s / (m/output_Fs);
output = zeros(m*beishu, n);
for index1 = 1:beishu
    for index2 = 1:m
        output((index1-1)*m + index2,:) = input(index2,:);
    end
end
audiowrite(['multiply_',num2str(m*beishu/output_Fs),'s_',num2str(output_Fs),'_dev1_male3_liverec_130ms_1m_mix.wav'], output, output_Fs);