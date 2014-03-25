% y = SinApprox(x, n)
% returns the n-term Taylor approximation
% of the sine function at x
function [y, err] = SinApprox(x, n)
y = 0
for i = 0:n
   y = (-1)^i * x^(2*1+1) / factorial(2*i+1)
end
err = sin(x) - y
