L = 128
t = 0:L-1;
T1 = 8;
T2 = 9;
a1 = 1;
a2=1;
y = a1*cos(2*pi*(1/T1) * t) + a2*cos(2*pi*(1/T2) * t);
w = hamming(L);
yw = y.*w';
fwy = fft(yw);
fy = fft(y);
fs = 1
freqs = FftShiftedFreqs(fs, L);

figure(10); clf;
subplot(4,2,1);
plot(t, y);

subplot(4,2,3);
plot(t, yw);

subplot(4,1,2);
plot(freqs, fftshift(abs(fy)));

subplot(4,1,4);
plot(w);
