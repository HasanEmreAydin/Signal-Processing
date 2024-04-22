function signal = windowing(signal_freq, signal_duration, signal_phase, sampling_freq)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function signal = windowing(signal_freq, signal_duration, signal_phase, sampling_freq)
% ex.: signal = windowing(10, 12, 0, 50)
%
% Inputs:
%	- signal_freq: frequency of the cosine function in Hz
%	- signal_duration: duration of the signal in seconds
%	- signal_phase: phase of the signal in rad
%	- sampling_freq: sampling frequency in Hz
%
% Output:
%	- signal: an array containing the samples of a cosine function sampled at the given sampling freq and windowed (in a.u.)
%		signal = cos(2*pi*signal_freq*t+signal_phase)
%
% Author: Guillaume Gibert, guillaume.gibert@ecam.fr
% Date: 04/03/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% generates a time array
t=-signal_duration/2:1/sampling_freq:signal_duration/2;

% generates a sampled signal
signal = cos(2*pi*signal_freq*t+signal_phase);

% window duration is half of signal duration
windowDuration = signal_duration/2;
% creates rectangular time window
rectangularWin = zeros(1, length(t));
for l_sample=1:windowDuration*sampling_freq
	rectangularWin(l_sample+signal_duration*sampling_freq/4) = 1;
end

figure;
plot(rectangularWin);

for l_sample=1:signal_duration*sampling_freq
	signal_rect(l_sample) = signal(l_sample) * rectangularWin(l_sample);
end

figure;
plot(signal); hold on;
plot(signal_rect);



% creates the Hanning time window

% creates the Hamming time window

% creates the Balckman time window



