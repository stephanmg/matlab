clear;

[y, fs] = auread('humpbackWhaleCleanShortDs.au');

subplot(2,1,1);
plot(y);
xlim([0 2*1e5]);

nwnd = 512;
nov = nwnd/2;
nfft = 1024;
[S, F, T, P] = spectrogram(y, nwnd, nov, fs);
subplot(2,1,2);
PdB = 10*log10(P);
imagesc([T(1) T(end)], [F(1), F(end)], PdB);
axis xy;
xlabel('Time [s]');
ylabel('Frequency [Hz]');
