N=[1,0,0];
D=[75.579367, -137.90481, 63.325442];
T = 2e-6;
[ip, t] = impz(N,D,100, 1/T);
stem(t,ip)
grid
xlabel 't'
ylabel 'h'
title 'Impulsni charakteristika'