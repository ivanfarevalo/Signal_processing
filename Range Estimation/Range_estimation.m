close all;
quadrature_data = load('/Users/ivanarevalomac/Documents/MATLAB/Homework7_GPR_Data/gpr_data.mat');
B = 1.024e9;
N = 128;
v = 3e8/sqrt(6);
n = linspace(1, 128, 128);
R = n.*v/(2*B)';

l = quadrature_data.da';

phase = angle(quadrature_data.F);
mag = abs(quadrature_data.F);
% n = (2BR)/v c

fft_func = abs(fft(conj(quadrature_data.F*122), 128));
image = imagesc(quadrature_data.da, R, fft_func);
title('Range profile');
xlabel('Position');
ylabel('Range');

for i =1:length(fft_func)
    axis([-inf inf 0 12000]);
    plot(fft_func(:,i));
    axis([-inf inf 0 12000]);
    title(sprintf("Magnitude vs FFT points along Distance %d",i));
    xlabel('FFT points');
    ylabel('Magnitud');
    pause(0.1)
end

plot(fft_func(:,1));
pause(0.2)
plot(fft_func(:,2));
pause(0.2)
plot(fft_func(:,3));
pause(0.2)
plot(fft_func(:,4));
pause(0.2)
plot(fft_func(:,5));