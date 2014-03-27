n = 1000;
x = randn(n, 1);
%m = 10;
m = 20;

%h = ones(m, 1)/m;
h = exp(-(1:m)/.5);
y = filter(h, 1, x);

figure(2); 
clf;
subplot(1, 2, 1)
plot(h); title('Filter');
subplot(1,2,2); 
plot(x);  hold on; 
plot(y, 'r', 'LineWidth', 3);
xlabel('Time')
ylabel('Value')
title('Results');

legend('Raw Data', 'Moving Average')
