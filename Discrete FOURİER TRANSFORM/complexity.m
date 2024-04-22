clear all
close all


x=0:100;
figure;
plot(x.*x, 'r'); hold on;
plot(x.*log2(x), 'b');

xlabel('Number of samples');
ylabel('Number of multiplications/additions');
title('Fourier transform complexity');
legend('DFT', 'FFT');

