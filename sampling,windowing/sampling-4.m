function signal = sampling(signal_freq_1, signal_duration, signal_phase_1, sampling_freq, signal_freq_2, signal_phase_2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function signal = sampling(signal_freq_1, signal_duration, signal_phase_1, sampling_freq, signal_freq_2, signal_phase_2)
% ex.: signal = sampling(10, 1, 0, 20, 15, 0)
%
% Inputs:
%	- signal_freq_1: frequency of the 1st cosine function in Hz
%	- signal_duration: duration of the signal in seconds
%	- signal_phase_1: phase of the 1st signal in rad
%	- sampling_freq: sampling frequency in Hz
%	- signal_freq_2: frequency of the 2nd cosine function in Hz
%	- signal_phase_2: phase of the 2nd signal in rad
%
%
% Output:
%	- signal: an array containing the samples of a cosine function sampled at the given sampling freq (in a.u.)
%		signal = cos(2*pi*signal_freq_1*t+signal_phase_1)+cos(2*pi*signal_freq_2*t+signal_phase_2)
%
% Author: Guillaume Gibert, guillaume.gibert@ecam.fr
% Date: 04/03/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=-signal_duration/2:1/sampling_freq:signal_duration/2;

signal = cos(2*pi*signal_freq_1*t+signal_phase_1) +cos(2*pi*signal_freq_2*t+signal_phase_2);

figure;
plot(t, signal);
xlabel('Time (s)');
ylabel('Signal amplitude (a.u.)');

frequencySpectrum(signal, sampling_freq);

