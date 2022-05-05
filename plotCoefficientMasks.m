function plotCoefficientMasks(targetCoefficientMasks, stereoH, durationInSeconds)
    hRootFactor = 1/2.0;
    [numTargets, numAtoms, numWindows] = size(targetCoefficientMasks);
    stftTimesInSeconds = linspace(0, durationInSeconds, numWindows);

    figure;
    subplot(131);
    imagesc( reshape( targetCoefficientMasks(1,:,:).^hRootFactor,numAtoms,numWindows) );
    set(gca,'YDir','normal')%设置y轴数值为正常显示
    %ylim([0,35]);%y轴范围
    colorbar;%色标
    colormap(gray(2));
    %colormap(flipud( gray(256) ));
    xlabel('Time');
    ylabel('Atom index');
    %title('Source 1 coefficient mask');

    subplot(132);
    imagesc( reshape( targetCoefficientMasks(2,:,:).^hRootFactor,numAtoms,numWindows) );
    set(gca,'YDir','normal')%设置y轴数值为正常显示
    %ylim([0,35]);%y轴范围
    colorbar;%色标
    colormap(gray(2));
    %colormap(flipud( gray(256) ));
    xlabel('Time');
    ylabel('Atom index');
    %title('Source 2 coefficient mask');

    subplot(133);
    imagesc( reshape( targetCoefficientMasks(3,:,:).^hRootFactor,numAtoms,numWindows) );
    set(gca,'YDir','normal')%设置y轴数值为正常显示
    %ylim([0,35]);%y轴范围
    colorbar;%色标
    colormap(gray(2));
    %colormap(flipud( gray(256) ));
    xlabel('Time');
    ylabel('Atom index');
    %title('Source 3 coefficient mask');

    