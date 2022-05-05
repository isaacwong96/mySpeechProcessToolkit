function delay = calDelay(length, theta, d_array)
    L = length;
    array = d_array;
    part1 = sqrt(L*L+(array/2)^2+2*(array/2)*L*cos(theta*pi/180));
    part2 = sqrt(L*L+(array/2)^2-2*(array/2)*L*cos(theta*pi/180));
    delay = (part1 - part2)/340*1000;