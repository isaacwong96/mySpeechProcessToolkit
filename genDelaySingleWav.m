function output = genDelaySingleWav(filename, delay)
[input1, Fs] = audioread(filename);
input1L = input1(:,1);
numPoints = floor(abs(delay) / 1000 * Fs);
output = zeros(size(input1, 1) + numPoints, 2);

output(1:size(input1, 1),1) = input1L;
for i_index = numPoints + 1:size(input1, 1) + numPoints
    output(i_index, 2) = input1L(i_index - numPoints)*0.8;
end
if(delay < 0)
    tmp = output(:,1);
    output(:,1) = output(:,2);
    output(:,2) = tmp;
end
