clear all
close all


signalDuration = 10; % in s
signalFrequency1 = 100; % in Hz
signalPhase1 = 0; % in rad

samplingFreq = 500; % Hz
t=-signalDuration/2:1/samplingFreq:signalDuration+signalDuration/2; %time vector
x = cos(2*pi*signalFrequency1*t+signalPhase1); %signal

pad = 0;
duration_dft = [];
for l=1:10000
	duration = computeFFTDuration(x, samplingFreq, pad);
	duration_dft = [duration_dft duration];
end
mean(duration_dft)
%std(duration_dft)

pad = 1;
duration_fft = [];
for l=1:10000
	duration = computeFFTDuration(x, samplingFreq, pad);
	duration_fft = [duration_fft duration];
end
mean(duration_fft)
%std(duration_fft)
