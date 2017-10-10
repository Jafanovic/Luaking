% zdroj :   Linearni obvody a systemy 
%           Jan Bicak  - strana 16
% Vykreslete modulovou, fazovou charakteristiku, 
% charakteristiku skupinoveho zpozdeni a 
% impulzni odezvu prenosove fce
%        Q(p)           3.9506e+009
% H(p) = ---- = ---------------------------------
%        N(p)   p^2 + 8.8889e+004p + 3.9506e+009
% -----------------------------------------------
Q = 3.9506e+009;
N = [1,  8.8889e+004,  3.9506e+009];
f = linspace(0, 3e4, 200);
w = 2*pi*f;
%komplexni frekvencni odezva z analogove prenosove fce
H = freqs(Q, N, w);
figure(1)
plot(f, abs(H)); grid; 
xlabel f
ylabel '|H(jf)|'
title 'Modulova charakteristika'
figure(2)
plot(f, phase(H)); grid
xlabel f; ylabel 'arg H(jf)';
title 'Fazova charakteristika'
% diff(X) - diference prvku vektoru 
% [X(2)-X(1) X(3)-X(2) ... X(n)-X(n-1)]
t = diff(-phase(H))./diff(w); % aproximace derivace 
figure(3)
plot(f(1:199), t); grid
xlabel f; ylabel '\tau(f)';
title 'Skupinove zpozdeni'
% vektorove vyjadreni prevede na symbolicke vyjadreni
P = poly2sym(Q)/poly2sym(N)
% inverzni Laplaceova transformace
ih = ilaplace(P)
% konverze racionalniho cisla  na desetinne cislo
vpa(ih,5)
figure(4)
t = linspace(0, 3e-4, 200);
plot(t, subs(ih)); grid
xlabel f; ylabel 'h(t)';
title 'Impulzni odezva'