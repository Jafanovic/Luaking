% zdroj :   Linearni obvody a systemy 
%           Jan Bicak  - strana 15 
% Vyreste symbolicky soustavu operatorovych obvodovych
% rovnic a vyjadrete prenosovu funkci
% -----------------------------------------------
f1 = '(U3 - U1)/R + (U3 - U2)/(p*L)';
f2 = 'p*C*U2 +(U2 - U3)/(p*L)';
% symbolicke reseni rovnic
rU = solve(f1, f2, 'U2,U3');
% vyber pole U2, resp. U1 z datove struktury rU
rU.U2  % uzlove napeti U2
rU.U3  % uzlove napeti U3
% Prenosova funkce
P = rU.U2/'U1'
% symbolicka substituce
nP = subs(P, {'R','C','L'},{1e3, 22.5e-9, 11.25e-3})
% nastaveni formatu zobrazeni cisel napr: 3.1416e+000
format short e
% citatel(numerator) a jmenovatel(denominator) 
% symbolickeho vyrazu
[num, den] = numden(nP) % num/den
% symbolicke vyjadreni polynomu prevede na vektorove
% vyjadreni - A(1): prvni prvek vektoru (koeficient u 
% nejvyssi mocniny polynomu)
N = sym2poly(den)
roots(N)
% H(p)=Q(p)/N(p)
% koeficient u nejvyssi mocniny ve jmenovateli bude 1 
Q = sym2poly(num)/N(1)
N = N/N(1)