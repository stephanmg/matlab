x = -2:0.01:2;
y = x.^2;
figure(1);
clf;
plot(x, y)

FUN = @(x) x.^2;

[x1, y1] = fminsearch(FUN, 1)
hold on;
%plot(x1, FUN(x1), 'ro', 'MarkerSize', 10)
plot(x1, y1, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r')
