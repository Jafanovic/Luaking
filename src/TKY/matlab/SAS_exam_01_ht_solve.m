% zdroj : % Linearni obvody a systemy 
%           Jan Bicak  - strana 14 
% Vykreslete prubeh funkce (impulzni charakteristiky)
% h(t) = K/b*e^(-at)sin(bt)
% ---------------------------------------------------
K = 3.951e9;
a = 4.444e4;
b = 4.444e4;

% Vlastni program
% vytvori vektor s linearnim rozdelenim hodnot:
t = linspace(0, 3e-4, 200);
h = K/b*exp(-a*t).*sin(b*t);
plot(t,h);
grid
xlabel t
ylabel h(t)
title 'Impulzni charakteristika'

