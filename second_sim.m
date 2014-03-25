T = 1000
numInputs = 100
probInputSpike = 1e-2;

X = double(rand(numInputs, T) <= probInputSpike);
w = randn(numInputs, 1);
th = 1;
y = X'*w;
z = double(y-th);

refPeriod = 10;
lastSpikeTime = -Inf;
z = zeros(T, 1);
for t = 1:T
   if (y(t)>th && (t-lastSpikeTime) > refPeriod)
   z(t) = 1;
   lastSpikeTime = t;
   end
end

figure(2); clf;
subplot(4,1,1); imagesc(X); colormap(1-gray(255));
title('Input spikes');
subplot(4,1,2); plot(y);
title('Input current');
subplot(4,1,3); plot(z);
title('Output spikes');
subplot(4,1,4); plot(w);
title('Synaptic weights');
