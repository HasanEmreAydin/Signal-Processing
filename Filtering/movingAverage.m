samplingFreq=500; %in Hz
t=0:1/samplingFreq:10; % time vector
K = 100; % constant

% generate the input signal x(t)
x = [];
for l=1:length(t)
	x = [x  K+ (rand()-0.5)];
end

% plot x(t)
figure;
plot(t, x)
xlabel('time(s)')
ylabel('amplitude (a.u)')
title('Temporal variation of x(t)=K+rand()')
ylim([0 110])

% generate y(t) after a moving average filter of order 6
y = x; % first 5 samples are not filtered!
% ugly way
for l=6:length(t)
	y(l) = 1/6*(x(l)+x(l-1)+x(l-2)+x(l-3)+x(l-4)+x(l-5)); 
end
% nice way
%~ for l=6:length(t)
	%~ sum = 0;
	%~ for m=0:5
		%~ sum = sum + x(l-m);
	%~ end
	%~ y(l) = sum / 6;
%~ end

% generate z(t) after a moving average filter of order 10
z = x; % first 10 samples are not filtered!
% ugly way
for l=10:length(t)
	z(l) = 1/10*(x(l)+x(l-1)+x(l-2)+x(l-3)+x(l-4)+x(l-5)+x(l-6)+x(l-7)+x(l-8)+x(l-9)); 
end
% nice way
%~ for l=10:length(t)
	%~ sum = 0;
	%~ for m=0:9
		%~ sum = sum + x(l-m);
	%~ end
	%~ y(l) = sum / 10;
%~ end

% use convolution with impulse response instead 
%~ M=10;
%~ h=ones(1,M)/M;
%~ a=conv(x, h);
%~ frequencySpectrum(a, samplingFreq,1);

% plot the 3 signals
figure;
	subplot(3,1,1)
		plot (t, x); hold on;
		ylabel('amplitude (a.u)')
	subplot(3,1,2)
		plot (t, y); hold on;
		ylabel('amplitude (a.u)')
	subplot(3,1,3)
		plot (t, z); hold on;
		xlabel('time(s)')
		ylabel('amplitude (a.u)')

% plot frequency spectrum of the 3 signals
frequencySpectrum(x, samplingFreq, 1);
frequencySpectrum(y, samplingFreq, 1);
frequencySpectrum(z, samplingFreq, 1);


