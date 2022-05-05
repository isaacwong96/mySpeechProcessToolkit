delay = -1.7546;
filename = 'data/input/dev1_male3_liverec_1m_sim_1.wav';
output = genDelaySingleWav(filename, delay);
audiowrite(['data/output/section5_delay_',num2str(delay),'ms.wav'], output, 16000);