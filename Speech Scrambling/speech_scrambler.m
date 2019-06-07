close all;
% Sampling Frequency
fs = 44100;
wmax = 2*pi*fs/2;
% Seconds to record
T = 5;
% Recording setup
rec = audiorecorder(fs,16,1);
disp('Start Recording');
recordblocking(rec,T);
disp('Done Recording');
% Play message
audio = getaudiodata(rec);

% Plot original signal and frequency
figure;
plot(audio);
title('Original Audio');
soundsc(real(double(audio)),fs);
figure;
plot(abs(fft(audio)));
title('FFt');
pause(3);

% Complex exponential setup
t = 0:1/fs:T-1/fs;
n = 0:size(audio)-1;
x = exp(1i*wmax.*n.*t)';

% % Test to confirm (-1)^n gives same result
% y = ones(1,length(audio))';
% positions = 1:2:length(audio);
% y(positions) = -1;
% scrambled = audio.*y;
% %  

% Scramble audio

scrambled = audio.*x;

figure;
plot(real(scrambled));
title('Scrambled Signal');
soundsc(real(double(scrambled)),fs);
figure;

% Plot scrambled frequency
plot(abs(fft(scrambled)));
title('FFt of scrambled');
pause(3);

% Save audio to file
save('audio.mat', 'scrambled')



%% Part 2 Descramble Sgnal
close all;

% Recover scrambled Signal
load('audio.mat', 'scrambled')
soundsc(real(double(scrambled)),fs)

% Plot scrambled frequency
figure;
plot(fftshift(abs(fft(scrambled))));
title('FFt of scrambled');
pause(5);

audioRecovered = scrambled.*x;

% % Test to confirm (-1)^n gives same result
% y = ones(1,length(audio))';
% positions = 1:2:length(audio);
% y(positions) = -1;
% audioRecovered = scrambled.*y;
% % 

figure;
plot(fftshift(abs(fft(audioRecovered))));
title('FFT of Descrambled Audio');
soundsc(real(double(audioRecovered)), fs);
