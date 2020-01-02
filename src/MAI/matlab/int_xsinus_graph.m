xsinus = @(x) x.*sin(x);    % anonymni funkce
quad(xsinus,0,pi)           % uricity integral od 0 do pi

% graf funkce a jejiho integralu
x = linspace(0,pi,100);
y=xsinus(x);

% vypocet urciteho integralu
y_int = zeros(length(x), 1);
for i = 1:1:length(x)
    y_int(i) = quad(xsinus,0,x(i)); % integral od 0 do x(i)
end

% graf
plot(x, y, 'b', x, y_int, 'r');
xlabel('$x$','Interpreter','latex'); 
ylabel('$y = f(x),\,\int x\cdot\sin{x}dx$', 'Interpreter','latex');
legend('$y=x*sin(x)$', 'Interpreter','latex', 'integral funkce');
grid on;