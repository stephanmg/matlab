% clear workspace
clear;


% action
M = 100;
L = 1000;
fs = 1;

y = randn(L, M);
r = 10;
h = (1/r) * ones(1, r);
yf = filter(h,1,y);
fyf = fft(yf);
fyf_mag = 10 * log10(abs(fyf));
fyf_mean_mag = mean(fyf_mag, 2);


% plot
figure(8); clf;

plot(FftShiftedFreqs(L, fs), fftshift(fyf_mean_mag));
