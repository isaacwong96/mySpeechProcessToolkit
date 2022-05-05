clear all; clc; close all;

[x,fs]=audioread('dev1_male3_liverec_130ms_1m_mix.wav');     % ����bluesky31.wav�ļ�
x = x(:,1);
x1 = x;
for i = 1:size(x,1)
    x(i) = x(i) + 0.000001*i;
end
t=(0:length(x)-1)/fs;                     % ����ʱ��
y=detrend(x);                             % �������������
%y=y/max(abs(y));                          % ��ֵ��һ��
subplot 311; plot(t,x1);               % ��������������������ź�x
%%title('��������������ź�');
xlabel('Time(s)'); %ylabel('��ֵ');
subplot 312; plot(t,x);               % ��������������������ź�x
%%title('��������������ź�');
xlabel('Time(s)'); %ylabel('��ֵ');
subplot 313; plot(t,y);               % �������������������ź�y
xlabel('Time(s)'); %ylabel('��ֵ');
%%title('���������������ź�');


