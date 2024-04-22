
clc
clear all
close all

pkg load signal

samplingFreq = 500; % in Hz
N = samplingFreq; % number of samples for a 1s buffer of data
Nfir=7;  % filter order
cutOffFrequency=10;  % cut-off frequency
 
% sampling weighted window (hanning)
whann = window(@hanning,Nfir);
 
% Coefficients estimation using the inverse of the Fourier transform and  truncation of the impulse response
n=0:1:(Nfir-1);
h=2*cutOffFrequency*sinc(2*(n-(Nfir-1)/2)*cutOffFrequency/samplingFreq)/samplingFreq; % Impulse response of the filter 
 
hhann=(h.').*whann;                % Weighting h by the Hanning window 
hhann=hhann/sum(hhann);            %  Normalisation of the sum od the coeffs to be 1
figure
freqz(hhann,1,N,samplingFreq);   % Frequency response of the impulse response weighted by the Hanning window
title('FIR Low-pass, order 6');
subplot(2,1,1)
ylim([-100 20])
	
[B, A] = butter(Nfir,  cutOffFrequency/(samplingFreq/2));
figure;
freqz(B,A,N,samplingFreq)
title('IIR Low-pass, order 6');
subplot(2,1,1)
ylim([-100 20])

[Bc, Ac] = cheby1(Nfir,  10, cutOffFrequency/(samplingFreq/2));
figure;
freqz(Bc,Ac,N,samplingFreq)
title('IIR Low-pass, order 6');
subplot(2,1,1)
ylim([-100 20])



Z=roots(B)         % Zeros of the transfer function
P=roots(A)         % Poles  of the transfer function

% Representation of zeros/poles in the complex plan
figure
zplane(Z,P)  % Draw zeros and poles
title ('Zeros and poles of the transfer function of the IIR filter')
legend('zeros','poles')
grid on

% Representations of the impulse response of the IIR filter
figure
impz(B,A)    % Draw the impulse response
title ('Impulse response of the IIR filter')
xlabel('Sample (n)')
grid on

% Representations of the impulse response of the FIR filter
figure
impz(hhann,1)    % Draw the impulse response
title ('Impulse response of the FIR filter')
xlabel('Sample (n)')
grid on

