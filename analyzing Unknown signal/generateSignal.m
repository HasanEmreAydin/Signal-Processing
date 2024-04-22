clear all
close all

fps = 300;
duration = 10;

% drift signal sine wave at 0.1 Hz
A0 = 0.02; f0 = 0.1; phi0 = 0; %drift

% 4 sine waves 30, 30.5, 60, 61 Hz
A1 = 0.02; f1 = 30; phi1 = 0;
A2 = 0.02; f2 = 30.5; phi2 = 0;
A1_2 = 0.04; f1_2 = 60; phi1_2 = 0;
A2_2 = 0.04; f2_2 = 61; phi2_2 = 0;

% 4 sine waves 32, 36, 64, 72 Hz
A3 = 0.01; f3 = 32; phi3 = 0;
A4 = 0.002; f4 = 36; phi4 = 0;
A3_2 = 0.02; f3_2 = 2*32; phi3_2 = 0;
A4_2 = 0.01; f4_2 = 2*36; phi4_2 = 0;

t=0:1/fps:duration;

% a little bit of noise
noise = [];
for l=1:length(t)
	noise = [noise (rand()-0.5)/50];
end

s0 = A0 * sin(2*pi*f0*t+phi0); % drift

s1 = A1 * sin(2*pi*f1*t+phi1);
s2 = A2 * sin(2*pi*f2*t+phi2);
s1_2 = A1_2 * sin(2*pi*f1_2*t+phi1_2);
s2_2 = A2_2 * sin(2*pi*f2_2*t+phi2_2);
s12 = s0 + s1 + s2 +s1_2 + s2_2 + noise;


s3 = A3 * sin(2*pi*f3*t+phi3);
s4 = A4 * sin(2*pi*f4*t+phi4);
s3_2 = A3_2 * sin(2*pi*f3_2*t+phi3_2);
s4_2 = A4_2 * sin(2*pi*f4_2*t+phi4_2);
s34 = s0 + s3 + s4 + s3_2 + s4_2 +  2*noise;

sf = [s12(1:end-1) s34(1:end-1)];

frequencySpectrum(sf(1:end/2), fps, 10);
frequencySpectrum(sf(end/2+1:end), fps, 10);

step_size = 50; %ms
window_size = 100; %ms
spectrogram(sf, fps, step_size, window_size);


csvwrite('unknownsignal.csv', sf);