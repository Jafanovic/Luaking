% cicloid.m
% ---------
% set graph size
x0=60; y0=0;
w=400; h=400;
set(gcf,'units','points','position',[x0,y0,w,h])
ax = gca;
ax.XTick = [0 pi 2*pi 3*pi 4*pi, 5*pi 6*pi 7*pi 8*pi];
% global parameters:
t = 0:0.1:8*pi; omega= 4/pi;

% point B1:
R = 2; r = 1;
% equations
x = omega*R.*t + r*sin(omega.*t);
y = R+r*cos(omega.*t);
p1 = plot(x,y);
set(p1,'Color','blue','LineWidth',1);
set(ax,'XTickLabel',{'0','\pi','2\pi', ...
    '3\pi','4\pi','5\pi','6\pi','6\pi','8\pi' })
text(11.5,2.7,'\(r<R\)', 'Interpreter','latex')
xlabel('x [m]'); ylabel('y [m]');
grid on; ylim([-1 5]);
hold all

% point B2
R = 2; r = 2;
% equations
x = omega*R.*t + r*sin(omega.*t);
y = R+r*cos(omega.*t);
p2 = plot(x,y);
set(p2,'Color','red','LineWidth',1);
text(11.5,3.7,'\(r=R\)', 'Interpreter','latex')

% point B3
R = 2;r = 3; 
% equations
x = omega*R.*t + r*sin(omega.*t);
y = R+r*cos(omega.*t);
p3 = plot(x,y);
set(p3,'Color','black','LineWidth',1);
text(11.5,4.7,'\(r>R\)', 'Interpreter','latex')
y0 = zeros(size(t));
plot(x,y0,'Color','black','Linewidth',6)

syms R r t w
v = w*sqrt(R^2+2*R*r*cos(w*t)+r^2);
a = r*w^2;
at = diff(v,t);
disp('tecne zrychleni:')
pretty(at)
an = sqrt(a^2 - at^2);
disp('normalove zrychleni: ')
pretty(an)
R0 = v^2/an;
disp('Polomer krivosti: ')
pretty(R0)