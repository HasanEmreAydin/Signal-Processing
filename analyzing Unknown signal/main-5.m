%%%%%%%%%%%%%%%%%%%%%%
% UNKNOWN SIGNAL
% Sampling frequency: 300 Hz
% Duration; 2 s
% First second: 0.1Hz, 30 Hz, 30.5 Hz, 60 Hz, 61 Hz
% Second second: 0.1Hz, 32 Hz, 36 Hz, 64 Hz, 72 Hz
%%%%%%%%%%%%%%%%%%%%%%

% loads the signal package on Octave
pkg load signal

% loads signal and its characteristics
signal = csvread('unknownsignal.csv');

%%%%%SIGNAL CHARACTERISTICS%%%%%
% sets sampling frequency
fps = 300; % -> freqMax of the signal should be < 150 Hz (Shannon-Nyquisit theorem), in practice freqMax < 60 Hz would be better

% computes the duration of the signal
duration = length(signal) / fps; % in s

% estimates its original frequency resolution
resolution = fps /  length(signal); % in Hz

%%%%%STATIONARITY%%%%%
% temporal plot
figure;
plot(signal);
xticks(0:0.2*fps:length(signal)*fps);
xticklabels(0:0.2:length(signal)/fps);
xlabel('Time (s)');
ylabel('Amplitude (a.u.)');

% spectrogram
step_size = 50; %ms
window_size = 100; %ms
spectrogram(signal, fps, step_size, window_size);

% ccl: signal is not stationary, it is composed of 2 parts

%%%%%SPLIT SIGNAL INTO 2 PARTS%%%%%
% First part: [0 1s]
signal_1 = signal(1:end/2);
% Second part: [1s 2s]
signal_2 = signal(end/2+1:end);

%%%%%SPECTRAL ANALYSIS (RECTANGULAR WINDOW)%%%%%
%plots power spectrum with rectangular window
% 1st part of the signal with 1 Hz resolution
frequencySpectrum(signal_1, fps, 1);
% 1st part of the signal with 0.5 Hz resolution
frequencySpectrum(signal_1, fps, 0.5);

% 2nd part of the signal with 1 Hz resolution
frequencySpectrum(signal_2, fps, 1);
% 2nd part of the signal with 0.5 Hz resolution
frequencySpectrum(signal_2, fps, 0.5);



%%%%%SPECTRAL ANALYSIS (BLACKMAN WINDOW)%%%%%
%plots power spectrum with blackman window
signal_1_win = blackmanWin(signal_1);
% 1st part of the signal with 1 Hz resolution
frequencySpectrum(signal_1_win, fps, 1);
% 1st part of the signal with 0.5 Hz resolution
frequencySpectrum(signal_1_win, fps, 0.5);

signal_2_win = blackmanWin(signal_2);
% 2nd part of the signal with 1 Hz resolution
frequencySpectrum(signal_2_win, fps, 1);
% 2nd part of the signal with 0.5 Hz resolution
frequencySpectrum(signal_2_win, fps, 0.5);





