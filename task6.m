% clear workspace
clear;

% settings
L = 1000;
M = 50;
t = (0:L-1);
y = randn(M, L);

% figure for task 6
figure(7);
clf;

y = fft(y');
ymag = abs(y);
ymagmean = mean(ymag, 2);


% 2 subplots
%subplot(2,1,1);
plot(t,ymag);
%xlabel('t');
%ylabel('amp');

%subplot(2,1,2);
plot(FftShiftedFreqs(L, 1), fftshift(ymagmean));
%xlabel('freq');
%ylabel('magnitude');
ylim([0 50]);
xlabel('t');
ylabel('freqs');
