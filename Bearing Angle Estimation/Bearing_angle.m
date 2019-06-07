close all;
load('/Users/ivanarevalomac/Documents/MATLAB/time_delay_data/time_delay_est_data.mat');
signal = data.x1;
delayed_signal = data.x2;
new_T = linspace(-5, 5, 480001);

plot(signal);
xlabel('Time'), ylabel('Magnitud')
title('Signal')

figure;
correlated_signal = xcorr(signal, delayed_signal);
plot(new_T, correlated_signal);
xlabel('Time'), ylabel('Magnitud')
title('Correlated Signal')

fft_correlated_signal = fftshift(abs(fft(correlated_signal)));
n = length(fft_correlated_signal);
fs = 48000;
fshift = (-n/2:n/2-1)*(fs/n); % zero-centered frequency range
figure;
plot(fshift, fft_correlated_signal);
xlabel('Frequency'), ylabel('Magnitud')
title('FFT Correlated Signal')

% Dsin?/v = ?t
sin_theta = ((343.6*new_T)/2.5);
bearing_angle = asind(sin_theta);
figure;
% plot(bearing_angle);
plot(bearing_angle, correlated_signal);
xlabel('Angle'), ylabel('Magnitud')
title('Bearing Angle estimation')
