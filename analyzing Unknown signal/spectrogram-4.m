function spectrogram(signal, samplingFreq, step_size, window_size)
%%%%%%%%%%%%%%%%%%%%%%%
%function spectrogram(signal, samplingFreq, step_size, window_size)
% ex.:  spectrogram(signal, 300, 50, 1000)
%
% Task: Plot the spectrogram of a given signal
%
% Inputs:
%	-signal: temporal signal to analyse 
%	-samplingFreq: sampling frequency of the temporal signal
% 	-step_size: how often the power spectrum will be computed in ms
%	-window_size: size of the analysing window in ms
%
% Ouput: None
%
% author: Guillaume Gibert (guillaume.gibert@ecam.fr)
% date: 14/03/2023
%%%%%%%%%%%%%%%%%%%%%%%

figure;
	subplot(2,1,1);
t=0:1/samplingFreq:length(signal)/samplingFreq-1/samplingFreq;
plot(t, signal');
xlim([0 length(signal)/samplingFreq-1/samplingFreq]);
ylabel('Amplitude (norm. unit)');
	
	subplot(2,1,2);
step = fix(step_size*samplingFreq/1000);     % one spectral slice every step_size ms
window = fix(window_size*samplingFreq/1000);  % window_size ms data window


[S, f, t] = specgram(signal);
specgram(signal, 2^nextpow2(window), samplingFreq, window, window-step);
xlabel('Time (s)');
ylabel('Frequency (Hz)');
