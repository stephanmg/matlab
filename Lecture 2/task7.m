clear;

N = 1000;
M = 10;
h = (1/M) * ones(1, M);
fs = 1;

figure(7); clf;

freqz(h, 1, N, fs);
