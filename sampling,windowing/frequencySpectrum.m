function frequencySpectrum(signal, fs)
%%%%%%%%%%%%%%%%%%
%function frequencySpectrum(signal, fs)
%
% Task: Display the power spectrum of a given signal
%
% Input:
%	- signal: the input signal to process
%	- fs: the sampling rate
%
% Output: None
%	
%
% Guillaume Gibert, guillaume.gibert@ecam.fr
% 25/04/2022
%%%%%%%%%%%%%%%%%%

n = length(signal);          % number of samples

y = fft(signal, n);% compute DFT of input signal
power = abs(y).^2/n;    % power of the DFT

[val, ind] = max(power); % find the mx value of DFT and its index

% plots
figure;

subplot(1,3,1) % time plot 
t=0:1/fs:(n-1)/fs; % time range
plot(t, signal)
xticks(0:0.1*fs:n*fs);
xticklabels(0:0.1:n/fs);
xlabel('Time (s)');
ylabel('Amplitude (a.u.)');

subplot(1,3,2) % linear frequency plot
f = (0:n-1)*(fs/n);     % frequency range
plot(f,power, 'b*'); hold on;
plot(f,power, 'r');
xlabel('Frequency (Hz)')
ylabel('Power (a.u.)')

subplot(1,3,3) % log frequency plot
plot(f,10*log10(power/power(ind)));
xlabel('Frequency (Hz)')
ylabel('Power (dB)')

