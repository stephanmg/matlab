  clear; % Remove all workspace variables
  
  T = 32;
  L = 64;
  t = 0:L-1;
  
  Ts = t(2)-t(1); % Sampling period
  fs = 1/Ts;      % Sampling frequency
  
  y = cos(2*pi/T*t);
  fy = fft(y,128);
  
  yz= [y zeros(1,L)];
  fyz= fft(yz);
  
  freqs = FftShiftedFreqs(numel(fy), fs);
  
  figure(5); clf;
  
  subplot(2,1,1);
  stem(freqs,fftshift(abs(fy)));
  xlabel('Time (seconds)');
  ylabel('Amplitude');
  title('Magnitude spectrum of the 128-point DFT of the signal.');
  
  subplot(2,1,2);
  stem(freqs,fftshift(abs(fyz)));  
  xlabel('Frequency (Hz)');
  ylabel('Magnitude');
  title('Magnitude spectrum of the zero-padded signal.');
  
 
