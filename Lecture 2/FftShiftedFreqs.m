function freqs = FftShiftedFreqs(n, fs)
% freqs = FftShiftedFreqs(n, fs)
%
% Returns the centered frequencies for an n-point DFT of a signal
% sampled at a rate of FS Hz.

freqs = (0:n-1)/n*fs;
freqs(freqs>=fs/2) = freqs(freqs>=fs/2) - fs;
freqs = fftshift(freqs);