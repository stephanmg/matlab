L  = 64;
t  = 0:L-1;
Ts = t(2) - t(1);
fs = 1 / Ts;

P = [64,32,16,8,4,2,1];
P_len = length(P);

figure(1); clf
for i=1:P_len 
   subplot(P_len,1,i); 
   disp(i);
   y = cos(2*pi*(1/P([i]))*t);
   fy = fft(y);
   plot(t, y);
   hold on;
   stem(t,y);
end

figure(2); clf
for i=1:P_len
   subplot(P_len,1,i); 
   disp(i);
   y = cos(2*pi*(1/P([i]))*t);
   fy = fft(y);
   freqs = FftShiftedFreqs(numel(fy), fs);
   stem(freqs, fftshift(abs(fy)));  
end



L  = 32
t  = 0:L-1;
Ts = t(2) - t(1);
fs = 1 / Ts;

P = [64,32,16,8,4,2,1];
P_len = length(P);

figure(3); clf
for i=1:P_len 
   subplot(P_len,1,i); 
   disp(i);
   y = cos(2*pi*(1/P([i]))*t);
   fy = fft(y);
   plot(t, y);
   hold on;
   stem(t,y);
end

figure(4); clf
for i=1:P_len
   subplot(P_len,1,i); 
   disp(i);
   y = cos(2*pi*(1/P([i]))*t);
   fy = fft(y);
   freqs = FftShiftedFreqs(numel(fy), fs);
   stem(freqs, fftshift(abs(fy)));  
end


L  = 16;
t  = 0:L-1;
Ts = t(2) - t(1);
fs = 1 / Ts;

P = [64,32,16,8,4,2,1];
P_len = length(P);

figure(5); clf
for i=1:P_len 
   subplot(P_len,1,i); 
   disp(i);
   y = cos(2*pi*(1/P([i]))*t);
   fy = fft(y);
   plot(t, y);
   hold on;
   stem(t,y);
end

figure(6); clf
for i=1:P_len
   subplot(P_len,1,i); 
   disp(i);
   y = cos(2*pi*(1/P([i]))*t);
   fy = fft(y);
   freqs = FftShiftedFreqs(numel(fy), fs);
   stem(freqs, fftshift(abs(fy)));  
end
