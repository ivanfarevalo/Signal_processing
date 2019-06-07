close all;

% Low Pass Analog Filter
N = 512;
dw = 12/N;
w = -4:dw:4;
% w = linspace(-2*pi,2*pi);
s = 1i*(w);
c = 0.55;
H_s = (c^4) ./ ((s.^2 + 1.848*0.55.*s +c^2).*(s.^2 + 0.765*0.55.*s +c^2));
plot(w, abs(H_s));
title("Analog Low-Pass Butterworth Filter");
xlabel('w'), ylabel('Magnitud')

%% 
% Low Pass Digital Filter
N = 128;
dw = 2*pi/N;
th = -2*pi:dw:2*pi-dw;
w = -1e3:dw:1e3;
th_from_w = 2.*atan(w);

c = 0.55;
z = exp(1i.*th_from_w);
s = ((z-1)./(z+1));
H_z = (c^4) ./ ((s.^2 + 1.848*0.55.*s +c^2).*(s.^2 + 0.765*0.55.*s +c^2));
figure;
plot(th_from_w, abs(H_z));
title("Digital Low-Pass Butterworth Filter");
xlabel('\theta'), ylabel('Magnitud')
% set(gca,'XTick',-2*pi:pi/2:2*pi)
% ax.XTickLabel = {'-2\pi','-\pi','0','\pi','2\pi'};

set(gca,'XTick',-2*pi:pi/2:2*pi) 
set(gca,'XTickLabel',{'-2\pi','-3\pi/2','-\pi','-\pi/2','0','\pi/2','\pi','3\pi/2','2\pi'})
%% 
% High Pass Digital Filter
s = ((-z-1)./(-z+1));
H_z = (c^4) ./ ((s.^2 + 1.848*0.55.*s +c^2).*(s.^2 + 0.765*0.55.*s +c^2));
figure; 
plot(th_from_w, abs(H_z));
title("Digital High-Pass Butterworth Filter");
xlabel('\theta'), ylabel('Magnitud')
% set(gca,'XTick',-2*pi:pi/2:2*pi)
% ax.XTickLabel = {'-2\pi','-\pi','0','\pi','2\pi'};

set(gca,'XTick',-2*pi:pi/2:2*pi) 
set(gca,'XTickLabel',{'-2\pi','-3\pi/2','-\pi','-\pi/2','0','\pi/2','\pi','3\pi/2','2\pi'})