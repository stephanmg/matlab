% comment
x = 5
str = 'Hello world';
disp(str)

if (x > 0)
   disp('x > 0')
elseif (x == 0)
   disp('x == 0')
else 
   disp('x<0')
end

switch x
   case 1
      disp('x = 1')
   case 2
      disp('x = 2')
   case 3
      disp('x = 3')
   otherwise
      disp('x is not 1, 2 and 3')
end

for i = 1:10
   disp(['i = ' numstr(i)])
end

i = 1
while (i <= 10)
   disp(['i = ' numstr(i)]
   i = i + 1
end


x = randn(10,1)
s1 = 0
s2 = 0

for i = 1:10
    s1 = s1 + x(i)
end

s2 = sum(x)
disp(['Sum' s2]) 
