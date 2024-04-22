
clc
clear all
close all

pkg load signal

samplingFreq = 44100; % in Hz
N = samplingFreq; % number of samples for a 1s buffer of data
Nfir=31;  % filter order
cutOffFrequency=10000;  % cut-off frequency
 
% sampling weighted window (rectangular and hanning)
wrect = window(@rectwin,Nfir);
whann = window(@hanning,Nfir);
 
figure
stem(0:Nfir-1,[wrect,whann]); 
axis([0 Nfir-1 0 1]);
legend('sampling rectangular window','sampling Hanning window');
xlabel('Sample (n)')
ylabel('Amplitude (a.u.)')
grid on
 
% Coefficients estimation using the inverse of the Fourier transform and  truncation of the impulse response
n=0:1:(Nfir-1);
h=2*cutOffFrequency*sinc(2*(n-(Nfir-1)/2)*cutOffFrequency/samplingFreq)/samplingFreq; % Impulse response of the filter 
 
hrect=(h.').*wrect;              % Weighting h by the rectangular window 
hrect=hrect/sum(hrect);            % Normalisation of the sum od the coeffs to be 1
[Hrect,F] = freqz(hrect,1,N,samplingFreq);   % Frequency response of the impulse response weighted by the rectangular window

hhann=(h.').*whann;                % Weighting h by the Hanning window 
hhann=hhann/sum(hhann);            %  Normalisation of the sum od the coeffs to be 1
[Hhann,F] = freqz(hhann,1,N,samplingFreq);   % Frequency response of the impulse response weighted by the Hanning window
 
% Coefficients estimation using the FIR1 function
hrectfir1=fir1(Nfir-1,2*cutOffFrequency/samplingFreq,wrect);   %cut off frequency should be normalized by samplingFreq/2
hhannfir1=fir1(Nfir-1,2*cutOffFrequency/samplingFreq,whann);   %cut off frequency should be normalized by samplingFreq/2
 
[Hrectfir1,F] = freqz(hrectfir1,1,N,samplingFreq);   % Frequency response for the weighted by the rectangular window
[Hhannfir1,F] = freqz(hhannfir1,1,N,samplingFreq);   % Frequency response for the weighted by the Hanning window
 
figure
subplot(2,1,1)
	stem(hrect)
	hold on
	stem(hrectfir1,'r-*')
	title ('Impulse response with rectangular window sampling')
	xlabel('Sample (n)')
	ylabel('Amplitude (a.u.)')
	grid on
	legend('From the target response','Function FIR1')
subplot(2,1,2)
	stem(hhann)
	hold on
	stem(hhannfir1,'r-*')
	title ('Impulse response with Hanning window sampling')
	xlabel('Sample (n)')
	ylabel('Amplitude (a.u.)')
	legend('From the target response','Function FIR1')
	grid on
 
figure
subplot(2,1,1)
	plot(F,abs(Hrect),'b*')
	hold on
	plot(F,abs(Hrectfir1),'r+')
	title ('Module of the frequency response with rectangular window sampling')
	xlabel('Frequency (Hz)')
	ylabel('Amplitude (a.u.)')
	grid on
	legend('From the target response','Function FIR1')
subplot(2,1,2)
	plot(F,abs(Hhann),'b*')
	hold on
	plot(F,abs(Hhannfir1),'r+')
	title ('Module of the frequency response with hanning window sampling')
	xlabel('Frequency (Hz)')
	ylabel('Amplitude (a.u.)')
	legend('From the target response','Function FIR1')
	grid on
	 




