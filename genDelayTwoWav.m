clear all;
theta1 = 85;
theta2 = 90;
length = 1;
d_array = 1;
delay1 = calDelay(length, theta1, d_array);
delay2 = calDelay(length, theta2, d_array);
filename1 = 'data/input/dev1_female4_liverec_130ms_1m_sim_3.wav';
filename2 = 'data/input/dev1_female4_liverec_130ms_1m_sim_4.wav';
output1 = genDelaySingleWav(filename1, delay1);
output2 = genDelaySingleWav(filename2, delay2);
if(size(output1, 1) > size(output2, 1))
    output = output1;
    output(1:size(output2, 1),:) = output(1:size(output2, 1),:) + output2;
else
    output = output2;
    output(1:size(output1, 1),:) = output(1:size(output1, 1),:) + output1;
end
audiowrite(['data/output/twoCh_delay1_',num2str(theta1),'_',num2str(delay1),'ms.wav'], output1, 16000);
audiowrite(['data/output/twoCh_delay2_',num2str(theta2),'_',num2str(delay2),'ms.wav'], output2, 16000);
audiowrite(['data/output/twoCh_delay_',num2str(theta1),'_',num2str(theta2),'_',num2str(delay1),'ms_',num2str(delay2),'ms.wav'], output, 16000);