function signal_win = blackmanWin(signal)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function signal_win = blackmanWin(signal)
%
% Inputs:
%	- signal: signal of interest
%
% Output:
%	- signal_win: signal of interest on which a blackman window was applied
%
% Author: Guillaume Gibert, guillaume.gibert@ecam.fr
% Date: 15/03/2024
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

blackmanWin = zeros(1, length(signal));
for l_sample=1:length(signal)
	blackmanWin(l_sample) = (0.42 - 0.5 * cos(2*pi*(l_sample)/length(signal)) + 0/08*cos(4*pi*(l_sample)/length(signal)));
end

% plot Blackman window
%~ figure;
%~ plot(blackmanWin);

% apply the Blackman window
for l_sample=1:length(signal)
	signal_win(l_sample) = signal(l_sample) * blackmanWin(l_sample);
end

%~ figure;
%~ plot(signal);
%~ hold on;
%~ plot(signal_win);




