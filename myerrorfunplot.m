x = -1.4:0.01:0.4;
plot(x, myerrorfun(x, 1))

[x1, y1] = fminsearch(@(x) myerrorfun(x,1), -1.2)
hold on;
plot(x1, y1, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r')
