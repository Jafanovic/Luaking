% Nadmo?ská výška libovolného bodu na povrchu kopce je dána formulí
% h(x, y) = A exp [?(x/l0)2?9(y/l0)2], kde A = 500 m, l0 = 100 m. 
% Nalezn?te sm?r nejv?tšího stoupání do kopce (malé posunutí po 
% povrchu kopce v tomto sm?ru vyvolá nejv?tší p?ír?stek nadmo?ské 
% výšky) v bod? B = [–30, 10] m.

A = 500;   % [m]
L0 = 100;  % [m]
v = (-160:1:160);
[x,y] = meshgrid(v);
z = A.*exp(-(x/L0).^2 -9*(y/L0).^2);
[hx,hy] = gradient(Z);

figure (1)
subplot(2,1,1);
mesh(Z)
xlabel('x [m]'),ylabel('y [m]'), zlabel('h [m]')


subplot(2,1,2);
contour(v,v,z,30)
axis([-50 50 -50 50])
xlabel('x [m]'),ylabel('y [m]')
grid;
hold on
quiver(v,v,hx,hy,1)
% point B
r = 0.5;
xc = -30;
yc = 10;
theta = linspace(0,2*pi);
x = r*cos(theta) + xc;
y = r*sin(theta) + yc;
fill(x,y,'r')
x = -30:1:-20;
y = -80 - 3*x;
plot(x,y)
hold off

% symbolic gradient computation 
syms z(x,y) A L0
func = A.*exp(-(x/L0).^2 -9*(y/L0).^2);
D = diff(func,x);
pretty(D)
D = diff(func,y);
pretty(D)