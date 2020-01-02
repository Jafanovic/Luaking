% PPST: file mai1ch03.tex
clear;
n = 15;
p = 0.5;
j = (1:1:15);
x = (1:0.1:15);
mu = n*p;
sigma = sqrt(n*p*(1-p));
citatel= factorial(n);
jmenovatel= factorial(n-j).*factorial(j);
binom = citatel./jmenovatel;
f = binom.*p.^j.*(1-p).^(n-j);
Y1 = normpdf(x ,mu , sigma);
plot(j,f, 'r*', x, Y1,'r','MarkerSize',10);

grid on;
hold on;
xlabel('j','Interpreter','latex')
ylabel('p(j)','Interpreter','latex')

n = 25;
j = (1:1:25);
x = (1:0.1:25);
mu = n*p;
sigma = sqrt(n*p*(1-p));
binom = factorial(n)./(factorial(n-j).*factorial(j));
f = binom.*p.^j.*(1-p).^(n-j);
Y1 = normpdf(x ,mu , sigma);
plot(j,f,'b*', x, Y1,'b','MarkerSize',10);

n = 35;
j = (1:1:35);
x = (1:0.1:35);
mu = n*p;
sigma = sqrt(n*p*(1-p));
binom = factorial(n)./(factorial(n-j).*factorial(j));
f = binom.*p.^j.*(1-p).^(n-j);
Y1 = normpdf(x ,mu , sigma);
plot(j,f,'g*', x, Y1,'g','MarkerSize',10);