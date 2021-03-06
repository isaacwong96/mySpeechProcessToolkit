x = [2438,2382,2340,2256,2222,2166,2102,2054,1990,1936,1890,1814,1730,1668,1591,1537,1481,1421,1365,1330,1280];
y = [48.54,47.18,46.21,44.51,42.24,40.54,38.54,36.42,34.33,32.36,30.45,28.36,25.42,22.39,19.54,16.42,13.57,10.48,7.51,5.45,0];
xx = x/2560;
y = 90 - y;
yy = calDelay(1,y,1);
xxx = zeros(size(xx,2));
xxx(22:42) = xx;
xxx(1:21) = 1 - xx;
yyy = zeros(size(yy,2));
yyy(22:42) = yy;
for i = 1:21
    yyy(i) = -1 * yy(i);
end
subplot(121);
plot(xx,yy);
subplot(122);
plot(xxx,yyy,'b');
ylabel('TDOA(s)','FontSize', 10);
xlabel('X(0~1)','FontSize', 10);