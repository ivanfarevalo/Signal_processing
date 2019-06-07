% % Hw 4 ECE148 Code

T = 8;
w0 = 2*pi/T;
n = 1:2:11;
t = -4:0.1:4;
Fn = 1./(n.*1i.*w0);

% complex_exp = exp(1i.*w0.*n.*t);
complex_exp_n1 = 1./(1i.*w0) * exp(1i*w0.*t);
complex_exp_n3 = complex_exp_n1 + 1./(3*1i.*w0)* exp(1i*w0.*t*3);
complex_exp_n5 = complex_exp_n3 + 1./(5*1i.*w0)* exp(1i*w0.*t*5);
complex_exp_n7 = complex_exp_n5 + 1./(7*1i.*w0)* exp(1i*w0.*t*7);
complex_exp_n9 = complex_exp_n7 + 1./(9*1i.*w0)* exp(1i*w0.*t*9);
complex_exp_n11 = complex_exp_n9 + 1./(11*1i.*w0)* exp(1i*w0.*t*11);

% Part 2: Plot of harmonics.

figure;
set(gca, 'XLim', [-4 4], 'YLim', [-1.2 1.2])
axis('square')
plot(t,real(complex_exp_n1));
xlim([-4 4]); ylim([[-1.2 1.2]]);
figure;
set(gca, 'XLim', [-4 4], 'YLim', [-2.5 2.5])
axis('square')
plot(t,real(-1./(3*1i.*w0)* exp(1i*w0.*t*3)));
xlim([-4 4]); ylim([[-1.2 1.2]]);
figure;
set(gca, 'XLim', [-4 4], 'YLim', [-2.5 2.5])
axis('square')
plot(t,real(-1./(5*1i.*w0)* exp(1i*w0.*t*5)));
xlim([-4 4]); ylim([[-1.2 1.2]]);
figure;
set(gca, 'XLim', [-4 4], 'YLim', [-2.5 2.5])
axis('square')
plot(t,real(-1./(7*1i.*w0)* exp(1i*w0.*t*7)));
xlim([-4 4]); ylim([[-1.2 1.2]]);
figure;
set(gca, 'XLim', [-4 4], 'YLim', [-2.5 2.5])
axis('square')
plot(t,real(-1./(9*1i.*w0)* exp(1i*w0.*t*9)));
xlim([-4 4]); ylim([[-1.2 1.2]]);
figure;
set(gca, 'XLim', [-4 4], 'YLim', [-2.5 2.5])
axis('square')
plot(t,real(-1./(11*1i.*w0)* exp(1i*w0.*t*11)))
xlim([-4 4]); ylim([[-1.2 1.2]]);;

% Added Harmonics

figure;
set(gca, 'XLim', [-4 4], 'YLim', [-1.2 1.2])
axis('square')
plot(t,real(complex_exp_n1));
xlim([-4 4]); ylim([-1.2 1.2]);
figure;
set(gca, 'XLim', [-4 4], 'YLim', [-2.5 2.5])
axis('square')
plot(t,real(complex_exp_n3));
xlim([-4 4]); ylim([-1.2 1.2]);
figure;
set(gca, 'XLim', [-4 4], 'YLim', [-2.5 2.5])
axis('square')
plot(t,real(complex_exp_n5));
xlim([-4 4]); ylim([-1.2 1.2]);
figure;
set(gca, 'XLim', [-4 4], 'YLim', [-2.5 2.5])
axis('square')
plot(t,real(complex_exp_n7));
xlim([-4 4]); ylim([-1.2 1.2]);
figure;
set(gca, 'XLim', [-4 4], 'YLim', [-2.5 2.5])
axis('square')
plot(t,real(complex_exp_n9));
xlim([-4 4]); ylim([-1.2 1.2]);
figure;
set(gca, 'XLim', [-4 4], 'YLim', [-2.5 2.5])
axis('square')
plot(t,real(complex_exp_n11))
xlim([-4 4]); ylim([-1.2 1.2]);

%% 



realx = real(complex_exp_n1);
imaginaryx = imag(complex_exp_n1);
% plot(real(complex_exp_n1), imag(complex_exp_n1));

% Part 3 Animation of each complex exponential of fourier series

subplot(1,2,2)

curve2 = animatedline('Color', 'c', 'LineWidth', 0.75);
set(gca, 'XLim', [-4 4], 'YLim', [-2.5 2.5])
axis('square')
subplot(1,2,1)
curve = animatedline('Color', 'c', 'LineWidth', 0.75);
axis('square')
set(gca, 'XLim', [-2.5 2.5], 'YLim', [-2.5 2.5])


for i =1:length(complex_exp_n1)
    subplot(1,2,1)
    l1 = line([0, imag(complex_exp_n1(i))], [0, real(complex_exp_n1(i))], 'Color', 'c', 'LineWidth', 1);
    lc1 = line([imag(complex_exp_n1(i)), 2.5], [real(complex_exp_n1(i)), real(complex_exp_n1(i))], 'Color', 'c', 'LineWidth', 1);
    subplot(1,2,2)
    lc2 = line([-4, t(i)], [real(complex_exp_n1(i)), real(complex_exp_n1(i))], 'Color', 'c', 'LineWidth', 1);
    addpoints(curve, imag(complex_exp_n1(i)), real(complex_exp_n1(i)))
    addpoints(curve2, t(i), real(complex_exp_n1(i)))
    drawnow
    pause(0.05)
    delete(l1);
    delete(lc1);
    delete(lc2);
end
%% 

subplot(1,2,2)
curve2 = animatedline('Color', 'r', 'LineWidth', 0.75);
set(gca, 'XLim', [-4 4], 'YLim', [-2.5 2.5])
axis('square')
subplot(1,2,1)
curve = animatedline('Color', 'r', 'LineWidth', 0.75);
axis('square')
set(gca, 'XLim', [-2.5 2.5], 'YLim', [-2.5 2.5])

for i =1:length(complex_exp_n1)
    subplot(1,2,1)
    l1 = line([0, imag(complex_exp_n1(i))], [0, real(complex_exp_n1(i))], 'Color', 'c', 'LineWidth', 1);
    l3 = line([imag(complex_exp_n1(i)), imag(complex_exp_n3(i))], [real(complex_exp_n1(i)), real(complex_exp_n3(i))], 'Color', 'r', 'LineWidth', 1);
    lc1 = line([imag(complex_exp_n3(i)), 2.5], [real(complex_exp_n3(i)), real(complex_exp_n3(i))], 'Color', 'r', 'LineWidth', 1);
    subplot(1,2,2)
    lc2 = line([-4, t(i)], [real(complex_exp_n3(i)), real(complex_exp_n3(i))], 'Color', 'r', 'LineWidth', 1);
    addpoints(curve, imag(complex_exp_n3(i)), real(complex_exp_n3(i)))
    addpoints(curve2, t(i), real(complex_exp_n3(i)))
    drawnow
    pause(0.05)
    delete(l3);
    delete(l1);
    delete(lc1);
    delete(lc2);
end

subplot(1,2,2)
curve2 = animatedline('Color', 'g', 'LineWidth', 0.75);
set(gca, 'XLim', [-4 4], 'YLim', [-2.5 2.5])
axis('square')
subplot(1,2,1)
curve = animatedline('Color', 'g', 'LineWidth', 0.75);
axis('square')
set(gca, 'XLim', [-2.5 2.5], 'YLim', [-2.5 2.5])

for i =1:length(complex_exp_n1)
    subplot(1,2,1)
    l1 = line([0, imag(complex_exp_n1(i))], [0, real(complex_exp_n1(i))], 'Color', 'c', 'LineWidth', 1);
    l3 = line([imag(complex_exp_n1(i)), imag(complex_exp_n3(i))], [real(complex_exp_n1(i)), real(complex_exp_n3(i))], 'Color', 'r', 'LineWidth', 1);
    l5 = line([imag(complex_exp_n3(i)), imag(complex_exp_n5(i))], [real(complex_exp_n3(i)), real(complex_exp_n5(i))], 'Color', 'g', 'LineWidth', 1);
    lc1 = line([imag(complex_exp_n5(i)), 2.5], [real(complex_exp_n5(i)), real(complex_exp_n5(i))], 'Color', 'g', 'LineWidth', 1);
    subplot(1,2,2)
    lc2 = line([-4, t(i)], [real(complex_exp_n5(i)), real(complex_exp_n5(i))], 'Color', 'g', 'LineWidth', 1);
    addpoints(curve, imag(complex_exp_n5(i)), real(complex_exp_n5(i)))
    addpoints(curve2, t(i), real(complex_exp_n5(i)))
    drawnow
    pause(0.05)
    delete(l1);
    delete(l3);
    delete(l5);
    delete(lc1);
    delete(lc2);
end

subplot(1,2,2)
curve2 = animatedline('Color', 'b', 'LineWidth', 0.75);
set(gca, 'XLim', [-4 4], 'YLim', [-2.5 2.5])
axis('square')
subplot(1,2,1)
curve = animatedline('Color', 'b', 'LineWidth', 0.75);
axis('square')
set(gca, 'XLim', [-2.5 2.5], 'YLim', [-2.5 2.5])

for i =1:length(complex_exp_n1)
    subplot(1,2,1)
    l1 = line([0, imag(complex_exp_n1(i))], [0, real(complex_exp_n1(i))], 'Color', 'c', 'LineWidth', 1);
    l3 = line([imag(complex_exp_n1(i)), imag(complex_exp_n3(i))], [real(complex_exp_n1(i)), real(complex_exp_n3(i))], 'Color', 'r', 'LineWidth', 1);
    l5 = line([imag(complex_exp_n3(i)), imag(complex_exp_n5(i))], [real(complex_exp_n3(i)), real(complex_exp_n5(i))], 'Color', 'g', 'LineWidth', 1);
    l7 = line([imag(complex_exp_n5(i)), imag(complex_exp_n7(i))], [real(complex_exp_n5(i)), real(complex_exp_n7(i))], 'Color', 'b', 'LineWidth', 1);
    lc1 = line([imag(complex_exp_n7(i)), 2.5], [real(complex_exp_n7(i)), real(complex_exp_n7(i))], 'Color', 'b', 'LineWidth', 1);
    subplot(1,2,2)
    lc2 = line([-4, t(i)], [real(complex_exp_n7(i)), real(complex_exp_n7(i))], 'Color', 'b', 'LineWidth', 1);
    addpoints(curve, imag(complex_exp_n7(i)), real(complex_exp_n7(i)))
    addpoints(curve2, t(i), real(complex_exp_n7(i)))
    drawnow
    pause(0.04)
    delete(l1);
    delete(l3);
    delete(l5);
    delete(l7);
    delete(lc1);
    delete(lc2);
end

subplot(1,2,2)
curve2 = animatedline('Color', 'm', 'LineWidth', 0.75);
set(gca, 'XLim', [-4 4], 'YLim', [-2.5 2.5])
axis('square')
subplot(1,2,1)
curve = animatedline('Color', 'm', 'LineWidth', 0.75);
axis('square')
set(gca, 'XLim', [-2.5 2.5], 'YLim', [-2.5 2.5])

for i =1:length(complex_exp_n1)
    subplot(1,2,1)
    l1 = line([0, imag(complex_exp_n1(i))], [0, real(complex_exp_n1(i))], 'Color', 'c', 'LineWidth', 1);
    l3 = line([imag(complex_exp_n1(i)), imag(complex_exp_n3(i))], [real(complex_exp_n1(i)), real(complex_exp_n3(i))], 'Color', 'r', 'LineWidth', 1);
    l5 = line([imag(complex_exp_n3(i)), imag(complex_exp_n5(i))], [real(complex_exp_n3(i)), real(complex_exp_n5(i))], 'Color', 'g', 'LineWidth', 1);
    subplot(1,2,2)
    lc2 = line([-4, t(i)], [real(complex_exp_n9(i)), real(complex_exp_n9(i))], 'Color', 'm', 'LineWidth', 1);
    subplot(1,2,1)
    lc1 = line([imag(complex_exp_n9(i)), 2.5], [real(complex_exp_n9(i)), real(complex_exp_n9(i))], 'Color', 'm', 'LineWidth', 1);
    l7 = line([imag(complex_exp_n5(i)), imag(complex_exp_n7(i))], [real(complex_exp_n5(i)), real(complex_exp_n7(i))], 'Color', 'b', 'LineWidth', 1);
    l9 = line([imag(complex_exp_n7(i)), imag(complex_exp_n9(i))], [real(complex_exp_n7(i)), real(complex_exp_n9(i))], 'Color', 'm', 'LineWidth', 1);
    addpoints(curve, imag(complex_exp_n9(i)), real(complex_exp_n9(i)))
    addpoints(curve2, t(i), real(complex_exp_n9(i)))
    drawnow
    pause(0.03)
    delete(l1);
    delete(l3);
    delete(l5);
    delete(l7);
    delete(l9);
    delete(lc1);
    delete(lc2);
end

subplot(1,2,2)
curve2 = animatedline('Color', 'k', 'LineWidth', 1);
set(gca, 'XLim', [-4 4], 'YLim', [-2.5 2.5])
axis('square')
subplot(1,2,1)
curve = animatedline('Color', 'k', 'LineWidth', 1);
axis('square')
set(gca, 'XLim', [-2.5 2.5], 'YLim', [-2.5 2.5])

for i =1:length(complex_exp_n1)
    subplot(1,2,1)
    l1 = line([0, imag(complex_exp_n1(i))], [0, real(complex_exp_n1(i))], 'Color', 'c', 'LineWidth', 1);
    l3 = line([imag(complex_exp_n1(i)), imag(complex_exp_n3(i))], [real(complex_exp_n1(i)), real(complex_exp_n3(i))], 'Color', 'r', 'LineWidth', 1);
    l5 = line([imag(complex_exp_n3(i)), imag(complex_exp_n5(i))], [real(complex_exp_n3(i)), real(complex_exp_n5(i))], 'Color', 'g', 'LineWidth', 1);
    P1 = subplot(1,2,2);
    set( get(P1,'XLabel'), 'String', 'Im(Fn*e^(jnwot)' );
    lc2 = line([-4, t(i)], [real(complex_exp_n11(i)), real(complex_exp_n11(i))], 'Color', 'k', 'LineWidth', 1);
    P2 = subplot(1,2,1);
    set( get(P2,'YLabel'), 'String', 'Re(Fn*e^(jnwot)' );
    lc1 = line([imag(complex_exp_n11(i)), 2.5], [real(complex_exp_n11(i)), real(complex_exp_n11(i))], 'Color', 'k', 'LineWidth', 1);
    
    l7 = line([imag(complex_exp_n5(i)), imag(complex_exp_n7(i))], [real(complex_exp_n5(i)), real(complex_exp_n7(i))], 'Color', 'b', 'LineWidth', 1);
    l9 = line([imag(complex_exp_n7(i)), imag(complex_exp_n9(i))], [real(complex_exp_n7(i)), real(complex_exp_n9(i))], 'Color', 'm', 'LineWidth', 1);
    l11 = line([imag(complex_exp_n9(i)), imag(complex_exp_n11(i))], [real(complex_exp_n9(i)), real(complex_exp_n11(i))], 'Color', 'k', 'LineWidth', 1);
    addpoints(curve, imag(complex_exp_n11(i)), real(complex_exp_n11(i)))
    addpoints(curve2, t(i), real(complex_exp_n11(i)))
    drawnow
    pause(0.02)
    delete(l1);
    delete(l3);
    delete(l5);
    delete(l7);
    delete(l9);
    delete(l11);
    delete(lc1);
    delete(lc2);
end