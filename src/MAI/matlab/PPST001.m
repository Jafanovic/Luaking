% PPST: file mai1ch03.tex
clear;
n = 15;
p = 0.5;
j = (1:1:15);
x = (1:0.1:15);
mu = n*p;
sigma = sqrt(n*p*(1-p));
p_j = factorial(n)./(factorial(n-j).*factorial(j)).*p.^j.*(1-p).^(n-j);
Y1 = normpdf(x ,mu , sigma);
plot(j,p_j, 'r*', x, Y1,'r');

grid on;
hold on;
xlabel('j','Interpreter','latex')
ylabel('p(j)','Interpreter','latex')

n = 25;
j = (1:1:25);
x = (1:0.1:25);
mu = n*p;
sigma = sqrt(n*p*(1-p));
p_j = factorial(n)./(factorial(n-j).*factorial(j)).*p.^j.*(1-p).^(n-j);
Y1 = normpdf(x ,mu , sigma);
plot(j,p_j,'b*', x, Y1,'b');

n = 35;
j = (1:1:35);
x = (1:0.1:35);
mu = n*p;
sigma = sqrt(n*p*(1-p));
p_j = factorial(n)./(factorial(n-j).*factorial(j)).*p.^j.*(1-p).^(n-j);
Y1 = normpdf(x ,mu , sigma);
plot(j,p_j,'g*', x, Y1,'g');