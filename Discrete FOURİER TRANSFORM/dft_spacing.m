clear all
close all

samplingFreq=20; % Hz

% generate a first cosine function
f1 = 5; % freq in Hz
t = 0:1/samplingFreq:1-1/samplingFreq; % Time vector
x1 = cos(2*pi*f1*t) ;      % Signal1
frequencySpectrum(x1, samplingFreq);

% generate a second cosine function
f2 = 5.5; % freq in Hz
x2 = cos(2*pi*f2*t) ;      % Signal2
frequencySpectrum(x2, samplingFreq);

