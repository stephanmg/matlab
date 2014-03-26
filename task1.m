L  = 64;
t  = 0:L-1;
Ts = t(2) - t(1);
fs = 1 / Ts;

T = 32;
y = cos(2*pi*(1/T)*t);
fy = fft(y);
