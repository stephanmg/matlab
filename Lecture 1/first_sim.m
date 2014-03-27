T = 1000
numInputs = 100
probInputSpike = 1e-2;

%X = double(rand(numInputs, T) <= probInputSpike);
X = double(rand(numInputs, T));
w = randn(numInputs, 1);
th = 1;
u = X'*w;
z = double(y-th);
y = double(u >= th)

figure(1); clf;
subplot(4,1,1); imagesc(X); colormap(1 - gray(255));
title('Raw')
%ylabel('No')
subplot(4,1,2); plot(w);
title('Weights');
%ylabel('No')
subplot(4,1,3); plot(z);
title('Signal');
%ylabel('No')
subplot(4,1,4); plot(y);
title('Response');
