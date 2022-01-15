%
% pr7_1_1 
close all;clear all; clc; 

filedir=[];                             % ����·��
filename='bluesky1.wav';                % �����ļ���
fle=[filedir filename];                 % ����������·�����ļ���
[s, fs] = audioread(fle);           % ���������ļ�
s=s-mean(s);                            % ����ֱ������
s=s/max(abs(s));                        % ��ֵ��һ
N=length(s);                            % ��������
time=(0:N-1)/fs;                        % ����ʱ��̶�
SNR=-5;                                  % ���������
r2=randn(size(s));                      % �����������
b=fir1(31,0.5);                         % ���FIR�˲���,����H
r21=filter(b,1,r2);                     % FIR�˲�
[r1,r22]=add_noisedata(s,r21,fs,fs,SNR);% �������������������ΪSNR��

M=32;                                   % ���ãͺ�mu
mu=0.001;  
snr1=calSNR_singleCh(s,r1);                % �����ʼ�����
h = adaptfilt.lms(M,mu);                % LMS�˲�
[y,e] = filter(h,r2,r1);
output=e;                               % LMS�˲����
snr2=calSNR_singleCh(s,output);            % �����˲���������
snr=snr2-snr1;
SN1=snr1; SN2=snr2; SN3=snr;
fprintf('snr1=%5.4f   snr2=%5.4f    snr=%5.4f\n',snr1,snr2,snr);
%sound(r1,fs);                         % �����������Ƚ�
%pause(1)
%sound(output,fs);
% ��ͼ
%subplot 311; plot(time,s,'k'); ylabel('��ֵ') 
%ylim([-1 1 ]); title('ԭʼ�����ź�');
%subplot 312; plot(time,r1,'k'); ylabel('��ֵ') 
%ylim([-1 1 ]); title('���������ź�');
%subplot 313; plot(time,output,'k'); 
%ylim([-1 1 ]); title('LMS�˲���������ź�');
%xlabel('ʱ��/s'); ylabel('��ֵ')

