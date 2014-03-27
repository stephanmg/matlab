% Select a task from 1 to 13
whichTask = 1;

switch (whichTask)
 case 1
  % Task 1: Make a cosine of length 64, and period 32. Plot it in a subplot. 
  % Take its fourier transform. What is the magnitude spectrum?

  clear; % Remove all workspace variables
  
  L = 64;
  t = 0:L-1;
  Ts = t(2)-t(1); % sampling period
  fs = 1/Ts; % Sampling frequency
  
  T = 32;
  
  y = cos(2*pi/T*t);

  fy = fft(y);
  
  figure(1); 
  clf;
  subplot(2,1,1);
  plot(t,y);
  xlim([0 63]);
  xlabel('Time (seconds)');
  ylabel('Amplitude');
  title('Signal in the time-domain');
  
  subplot(2,1,2);
  stem(FftShiftedFreqs(numel(fy),fs), fftshift(abs(fy)));    
  xlabel('Frequency (Hz)');
  ylabel('Magnitude');
  title('Signal in the frequency-domain');
  
 case 2
  % Task 2: Make 5 subplots.
  % In the first 4, Plot cosines of period 32, 8, 2, 1. What happens at period 1?
  %
  % In the last, plot a cosine of period 32/33. Compare it to the the
  % second subplot. What do you notice? Why is it happening?
  %
  % (Note: you may need to stretch the figure out to see all the
  % subplots properly. Run the task again after you've stretched the
  % figure.)

  clear; % Remove all workspace variables
  
  L = 64;
  t = 0:L-1;
  
  T = [32 8 2 1 32/33];
  
  figure(2);
  clf;
  subplot(numel(T),1,1);
  for i = 1:numel(T)
    subplot(numel(T),1,i);
    y = cos(2*pi/T(i)*t);
    stem(y);
    xlabel('Time (seconds)');
    ylabel('Amplitude');
    xlim([1 64]);
    title(['A cosine signal of period ' num2str(T(i)) ],'FontSize',14);  
  end
  
 case 3
  % Task 3: Plot a cosine of length 64, with period 32, with 1 added
  % to it. Plot the magnitude spectrum. What's going on at frequency
  % 0? Why?

  clear; % Remove all workspace variables
  
  L = 64;
  t = 0:L-1;
  Ts = t(2)-t(1); % Sampling period
  fs = 1/Ts;      % Sampling frequency

  T = 32;
  f = 1/T;
  y = cos(2*pi*f*t)+1;
  fy = fft(y);
  freqs = FftShiftedFreqs(numel(fy), fs);
    
  figure(3); 
  clf;
  subplot(2,1,1);
  plot(t,y);
  xlabel('Time (seconds)');
  ylabel('Amplitude');
  title('Signal in the time-domain');

  subplot(2,1,2);
  stem(freqs, fftshift(abs(fy)));  
  xlabel('Frequency (Hz)');
  ylabel('Magnitude');
  title('Signal in the frequency domain');
  
 case 4
  % Task 4: Extend the length_ of the cosine by half a period.
  % Plot the magnitude spectrum. Why does it look so strange?
  % Extend it by another half period. Now what happens? Why?

  clear; % Remove all workspace variables
  
  T = 32;
  L = 64+T/2;
  t = 0:L-1;
  
  Ts = t(2)-t(1); % Sampling period
  fs = 1/Ts;      % Sampling frequency
  
  y = cos(2*pi/T*t);
  fy = fft(y);
  freqs = FftShiftedFreqs(numel(fy), fs);
  
  figure(4); 
  clf;
  subplot(2,1,1);
  plot(t,y);
  xlabel('Time (seconds)');
  ylabel('Amplitude');
  title('Signal in the time domain');
  
  subplot(2,1,2);
  stem(freqs, fftshift(abs(fy)));  
  xlabel('Frequency (Hz)');
  ylabel('Magnitude');
  title('Signal in the frequency domain');

 case 5
  % Task 5: Create a cosine signal of length 64 with period 32, and plot the magnitude of the 128 point FFT.
  % Now pad the original signal with 64 zeros and take the fft. Compare the magnitude spectra.

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
  
 case 6
  % Task 6: Use randn to generate 1000 samples from a normal distribution with unit variance.
  % Plot the spectrum.

  clear; % Remove all workspace variables  
  
  L = 1000;
  t = (0:L-1);
  y = randn(1, L);

  figure(6);
  clf;
  subplot(2,1,1);
  plot(t,y);
  xlabel('Time (seconds)');
  ylabel('Amplitude');

  subplot(2,1,2);
  fy = fft(y);
  plot(FftShiftedFreqs(numel(fy),1), fftshift(abs(fy)));
  xlabel('Frequency (Hz)');
  ylabel('Magnitude');

 case 7
  % Task 7: Use RANDN to generate 100 trials of 1000 samples from a
  % normal distribution with unit variance.  In one subplot, plot the
  % 100 samples, and overlay their mean.  Take the fft of each sample,
  % and in a second subplot, plot (a) the magnitude of the mean of the
  % fft's, (b) the mean of the magnitude of the fft's.
  %
  % What is the shape of the spectrum? Why do you think it's called
  % 'white' noise?  Why is the magnitude of the spectrum of the mean
  % lower than the mean of the magnitude-spectrum?

  clear; % Remove all workspace variables
  
  L = 1000;
  t = (0:L-1);
  
  Ts = t(2)-t(1); % Sample period
  fs = 1/Ts;      % sample rate
  
  numSamples = 100;
  y = randn(L,numSamples); % The columns contain the trials
  
  figure(7);
  clf;
  subplot(2,1,1);
  h = plot(t,y,'b'); % Plots each column
  hold on;
  hm = plot(t,mean(y,2),'r'); % Take the average across the columns i.e. trials
  xlabel('Time (seconds)');
  ylabel('Amplitude');
  legend([h(1) hm], 'Individual Trials','Mean');
  title('100 trials of 1000 samples from the standard normal distribution, and their mean.');
  
  subplot(2,1,2);
  fy = fftshift(fft(y)); % Fft, fftshift work on each column
  freqs = FftShiftedFreqs(L, fs);
  plot(freqs, mean(abs(fy),2)); 
  hold on;
  plot(freqs, abs(mean(fy,2)),'r');
  xlabel('Frequency (Hz)');
  ylabel('Magnitude');
  legend('Mean of the Magnitudes','Magnitude of the Mean');
  title('Magnitude of the mean vs. the mean of the magnitudes of the DFTs for each trial.');
 
 case 8
  % Task 8: Use FREQZ to examine the transfer function of freqz.
  % What type of filter is it? And why are there notches?

  clear; % Remove all workspace variables
  
  nma = 50; 
  a = 1;
  b = ones(1,nma)/nma;
  fs = 1;  
  
  figure(8);
  clf;
  freqz(b,a,1000,fs); % With no output arguments, freqz plots the transfer function
  
 case 9
  % Task 9: Use FILTER to filter several instances of noise with the
  % moving average, and compute the average of the normalized
  % magnitude spectrum in dB.  How does it compare to the freqz
  % results? 
  % 
  % (This shows how you can use white noise stimuli to estimate the
  % magnitude spectrum of the transfer function of an unknown LTI
  % system.)

  clear; % Remove all workspace variables
  
  L = 1000;
  t = (0:L-1);
  Ts = t(2) - t(1);
  fs = 1/Ts;
  
  numTrials = 5000;
  x = randn(L,numTrials); % The data for each trial is in the columns
  
  nma = 50; % Number of points in the moving average;
  b = ones(1,nma)/nma;
  a = 1;
  y = filter(b,a,x); % Filter operates on each column
  fy = fft(y); % fft operates on each column;
  fyMag = abs(fy);
  fyMeanMag = fftshift(mean(fyMag, 2)); % average across the trials.
  
  fyMeanMag = fyMeanMag/max(fyMeanMag); % Normalize by the maximum, because freqz does.
  
  freqs = FftShiftedFreqs(numel(fyMeanMag), fs);

  % Plot the non-negative frequencies, in dB.
  figure(9);
  clf; 
  hold on;
  plot(freqs(freqs>=0), 20*log10(fyMeanMag(freqs>=0)),'LineWidth',3);

  [H,freqs] = freqz(b,a,1000,fs); % Returns the transfer function at 1000 frequencies between 0 and fs/2

  % Overlay the magnitude spectrum (in dB) of the transfer function    
  hold on;
  plot(freqs,20*log10(abs(H)),'r');

  legend('Estimate','True');
  
  xlabel('Frequency (Hz)');
  ylabel('Magnitude (dB)');
  title('White-noise estimate and true value of the mangitude spectrum for the 50 point moving average.');
  ylim([-50 0]);
  
case 10
  % Task 10: Create a signal of length 128, made of the sum of two
  % cosines, one of period 8, and the other of period 9. Plot the
  % signal. Then use 'hamming' to window the signal and plot the
  % windowed version. Compute the FFT of the windowed signal and plot
  % its magnitude spectrum. How many bumps do you seen in the
  % spectrum? Now change the window to the rectangular window using
  % RECTWIN. How many do you see now? Now go back to the hamming
  % window, but increase the length of the signal to 256. How many
  % bumps do you see now? How close can the two signals be for their
  % spectra to merge at this new length?
  
  clear; % Remove all workspace variables
  
  L = 128; 
  T1 = 9; 
  T2 = 8;
  t = (0:L-1);
  y = cos(2*pi/T1*t) +cos(2*pi/T2*t);
  
  figure(10); clf;
  
  subplot(3,1,1);
  plot(t,y);
  xlim([1 L]);
  xlabel('Time (seconds)');
  ylabel('Amplitude');
  title('Time-domain signal');
  
  subplot(3,1,2);
  w = hamming(L)'; % Try other windows by changing 'hamming' to e.g. rectwin, hanning, gausswin,...
  yw = y.*w; % Window the signal by multiplying it point-wise with the window.
  plot(t,yw);
  xlim([1 L]);
  xlabel('Time (seconds)');
  ylabel('Amplitude');
  title('Windowed time-domain signal');
  
  subplot(3,1,3);
  fyw=fft(yw);
  freqs = FftShiftedFreqs(numel(fyw),1);
  plot(freqs,fftshift(abs(fyw)));
  xlabel('Frequency (Hz)');
  ylabel('Magnitude');
  title('Magnitude spectrum of frequency-domain signal');
 
 case 11
  % Task 11: Load the Humpback whale signal. Play the sound. Plot the
  % spectrogram of the power in decibels. At what frequency,
  % approximately, is the 'mother' signal? How do you have to change
  % the window size to reduce the 'blur' in the mother's signal? 
  % 
  % In a subplot, plot the power at 1000 Hz for time bins between 2
  % and 6 seconds, to see the transition to the clicks. Can you resolve
  % them? How do you have to change to the window size to be able to
  % see the individual clicks? What is their average frequency? What
  % happens to the frequency resolution in the spectrogram when you
  % use the window size that resolves the clicks?

  clear; % Remove all workspace variables
  
  [y, fs] = auread('humpbackWhaleCleanShortDs.au');

  % sound(y,fs); % uncomment this line to play the sound
  
  nwnd = 512;    % sliding window size, in samples
  nov  = nwnd/2; % sliding window overlap, in samples
  nfft = 1024;   % length of the fft to use.

  [S,F,T,P] = spectrogram(y,nwnd,nov,nfft,fs);
  PdB = 10*log10(P);
  
  figure(11); clf;
  subplot(4,1,1:3); 
  imagesc([T(1) T(end)],[F(1) F(end)], PdB); axis xy;
  xlabel('Time (seconds)');
  ylabel('Frequency (Hz)');
  title('Spectrogram of the power (in decibels) of the whalesong recording.','FontSize',14);
  
  subplot(4,1,4);
  indFreq = find(F>=1000,1); % Find the data for ~1000 Hz.
  indTime = find(T>=2 & T<=6); % and time in [8-10];
  plot(T(indTime),PdB(indFreq,indTime));
  axis tight;
  xlabel('Time (seconds)');
  ylabel('Power (dB)');
  title('Time course of signal power at ~1000 kHz','FontSize',14);

 case 12
  % Task 12: Use BUTTER to get a 4'th order highpass filter to remove the
  % mother's signal. Plot the spectrogram as in task 11. Play the sound. 
  % Is it's amplitude reduced?

  [y, fs] = auread('humpbackWhaleCleanShortDs.au');

  % The 'mother' signal is at about 250 Hz, so we need to cutoff everything below ~300 Hz.
  fc = 500;
  
  wc = fc/(fs/2); % The normalized frequency
  [b,a] = butter(4, wc, 'high');
  yf = filter(b,a,y);

  % sound(y,fs); % uncomment this line to play the sound  
  
  nwnd = 512;    % sliding window size, in samples
  nov  = nwnd/2; % sliding window overlap, in samples
  nfft = 1024;   % length of the fft to use.

  [S,F,T,P] = spectrogram(yf,nwnd,nov,nfft,fs);
  PdB = 10*log10(P);
  
  figure(12); clf;
  subplot(4,1,1:3); 
  imagesc([T(1) T(end)],[F(1) F(end)], PdB); axis xy;
  xlabel('Time (seconds)');
  ylabel('Frequency (Hz)');
  title('Spectrogram of the power (in decibels) of the filtered whalesong recording.','FontSize',14);
  
  subplot(4,1,4);
  indFreq = find(F>=1000,1); % Find the data for ~1000 Hz.
  indTime = find(T>=2 & T<=6); % and time in [8-10];
  plot(T(indTime),PdB(indFreq,indTime));
  axis tight;
  xlabel('Time (seconds)');
  ylabel('Power (dB)');
  title('Time course of signal power at ~1000 kHz','FontSize',14);

 case 13
  % Task 13: Use the FDATOOL to interactively design a higher order
  % butterworth filter and apply it to the signal. Plot the results as
  % before. Play the sound. Is it improved?
  %
  % When you've designed your filter in FDATOOL, choose 'Export' from
  % the file menu.  Select 'MAT-file' from the 'Export To' pull-down
  % menu, and 'Objects' from the 'Export As' pull-down, and then click
  % 'Export'. It will ask you for a file name to save into, so choose
  % 'hbwFilter.mat'.

  clear; % Remove all workspace variables
  
  [y, fs] = auread('humpbackWhaleCleanShortDs.au');

  load hbwFilter; % Loads the filter Hd.
  
  yf = filter(Hd,y);

  % sound(y,fs); % uncomment this line to play the sound  
  
  nwnd = 512;    % sliding window size, in samples
  nov  = nwnd/2; % sliding window overlap, in samples
  nfft = 1024;   % length of the fft to use.

  [S,F,T,P] = spectrogram(yf,nwnd,nov,nfft,fs);
  PdB = 10*log10(P);
  
  figure(13); clf;
  subplot(4,1,1:3); 
  imagesc([T(1) T(end)],[F(1) F(end)], PdB); axis xy;
  xlabel('Time (seconds)');
  ylabel('Frequency (Hz)');
  title('Spectrogram of the power (in decibels) of the filtered whalesong recording.','FontSize',14);
  
  subplot(4,1,4);
  indFreq = find(F>=1000,1); % Find the data for ~1000 Hz.
  indTime = find(T>=2 & T<=6); % and time in [8-10];
  plot(T(indTime),PdB(indFreq,indTime));
  axis tight;
  xlabel('Time (seconds)');
  ylabel('Power (dB)');
  title('Time course of signal power at ~1000 kHz','FontSize',14);
  
 otherwise
  disp('Please select a task between 1 and 13.');
end





