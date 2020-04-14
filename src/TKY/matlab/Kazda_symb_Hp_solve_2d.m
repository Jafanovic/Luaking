syms R1 R2 R3 R4 C1 C2 Va Vin Vout Vb Ix Ia Ib Ic w s

G1 = 1./R1;
G2 = 1./R2 + s*C1;
G3 = 1./R3;
G4 = 1./R4 + s*C2;

Vin = 1;
%                Vb        ,     Vout, 
A = [ G1 + G2 + G3, -G3         ;       %  Vb
                          -G3,  G3 + G4  ]     %  Vout
x = [Vb; Vout];
b = [Vin*G1; 0];

x = A^-1*b;
pretty(x(2,1))

R1 = 47*10^3;
R2 = 10*10^3;
R3 = 10*10^3;
R4 =   1*10^6;
C1 = 47*10^-9;
C2 = 22*10^-9;

% 3. radek matice A
H = x(2,1)
% Define 's' as transfer function variable
s = tf('s');
% Convert to a string
TFstr = char(H);
% Evaluate the expression: "TFstr = (s+2)/(s^2+5*s+9)"
eval(['TF = ',TFstr]);

% Poles of dynamic system
P = pole(TF);
% Frequency response bandwidth
fb = bandwidth(TF);

figure(1)
options = bodeoptions;
options.FreqUnits = 'Hz';     % or 'rad/second', 'rpm', etc.
options.PhaseUnits = 'deg'; % 'deg' | 'rad'

fstart = 1;
fstop = 6;
N = 100;
% generates n points between decades 10^a and 10^b
frange = logspace(fstart,fstop,N);  

[mag,phase,wout] = bode(TF,frange,options);                        % Get Plot Data
% Get TF in latex for graph title
[num,den] = tfdata(TF);                                                               % returns the numerator and denominator 
syms s
n = sym(num);
d = sym(den);
ns = poly2sym(n,s);
ds = poly2sym(d,s);
tfsym = ns/ds;
tftitle = latex(tfsym);

mag = squeeze(mag);                                                                   % Reduce (1x1xN) Matrix To (1xN)
phase= squeeze(phase);
magr2 = (mag/max(mag)).^2;                                                     % Calculate Power Of Ratio of ‘mag/max(mag)’
dB3 = interp1(magr2, [wout phase mag], 0.5, 'spline');          % Find Frequency & Phase & Amplitude of Half-Power (-3 dB) Point

figure(1)
subplot(2,1,1)
semilogx(wout, 20*log10(mag), '-b',  dB3(1), 20*log10(dB3(3)), '+r', 'MarkerSize',10)
title(sprintf('Bode plot of: $$ %s $$', tftitle), 'Interpreter','latex')
xlabel('frequency [Hz]') 
ylabel('Magnitude [dB]') 
grid on;
subplot(2,1,2)
semilogx(wout, phase, '-b',  dB3(1), dB3(2), '+r', 'MarkerSize',10)
xlabel('frequency [Hz]') 
ylabel('Phase [°]') 
grid on;