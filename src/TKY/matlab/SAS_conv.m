% Continuous Convolution

t = (-2:0.1:3)';
x = rectpuls(t,1);
h = 1/3*rectpuls(t-1.5,3).*t;
y=conv(x,h);
plot(t,[x,h]);
hold on;
stem(y);
grid on;
