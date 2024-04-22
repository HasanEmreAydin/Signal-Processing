clc
clear all
close all


pkg load signal

% transsamplingFreqrt  function of the system is :
 
%        B(z)    b0+b1z^{-1}+b2z^{-2}
% H(z)= ----- = ----------------------
%        A(z)    a0+a1z^{-1}+a2z^{-2}
 
% Coefs of numerator  in power of  z^{-1}
b0 =  0.1;
b1 =  0.0;
b2 =  0.0;
 
%  Coefs of denominator  in power of  z^{-1}
a0 =  1;
a1 =  -1.2;
a2 = 0.3;
 
B=[b0 b1 b2]; % Numerator of transsamplingFreqr function 
A=[a0 a1 a2]; % Denominator of transsamplingFreqr function  
 

%        B(z)    
% H(z)= -----
%        A(z)
 
 
% The function roots computes the roots of a polynomial
Z=roots(B)         % Zeros of the transsamplingFreqr function
P=roots(A)         % Poles  of the transsamplingFreqr function
 
% Representation of zeros/poles in the complex plan
figure
zplane(Z,P);  % Draw zeros and poles
title ('Zeros and poles of the transsamplingFreqr function');
legend('zeros','poles');
grid on;


% generate square signal
samplingFreq = 44100; % in Hz
signalFreq = 250; % in Hz
t=0:1/samplingFreq:1-1/samplingFreq;
squareSignal = 1+square(2*pi*signalFreq*t);    

% filter the signal with the porposed filter
filteredSignal = filter(B, A, squareSignal);

figure;
plot(t, squareSignal); hold on;
plot(t, filteredSignal);
legend('square', 'filtered');
xlabel('time (s)'); 
ylabel('amplitude (a.u.)');
xlim([0 0.03]);


%~ frequencySpectrum(squareSignal, samplingFreq, 1);
%~ frequencySpectrum(filteredSignal, samplingFreq, 1);

% generate cos from 200Hz to 20kHz
freq = 20:100:20000;
ampPowerSpectrum = [];
for l_freq=20:100:20000
	x = cos(2*pi*l_freq*t);
	y = filter(B, A, x);
	power = frequencySpectrum(y, samplingFreq, 0);
	index = floor(l_freq*length(power)/samplingFreq)+1;
	ampPowerSpectrum = [ampPowerSpectrum power(index)];
end
	
figure;
plot(freq, ampPowerSpectrum);
xlabel('frequency (Hz)'); 
ylabel('amplitude of power spectrum (a.u.)');

%Frequency response of the filter in the range [0 samplingFreq/2]
[Hf,F] = freqz(B,A,samplingFreq,samplingFreq);   
 
figure
subplot(2,1,1)
	semilogx(2*pi*F,20*log10(abs(Hf)))
	title ('Module of the frequency response')
	xlabel('Frequency (rad/s)')
	ylabel('Amplitude (dB)')
	grid on

subplot(2,1,2)
	semilogx(2*pi*F,180*angle(Hf)/pi)
	title ('Phase of the frequency response')
	xlabel('Frequency (rad/s)')
	ylabel('Phase (deg)')
	grid on
 


