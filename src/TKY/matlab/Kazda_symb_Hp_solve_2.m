syms R1 R2 R3 R4 C1 C2 Vin Vout Vb Ia Ib Ic w s


G1 = 1./R1;
G2 = 1./R2 + s*C1;
G3 = 1./R3;
G4 = 1./R4 + s*C2;

Vin = 1;

A = [G1, -G1, 0; -G1, G1 - G2 - G3, -G3; 0, G3, G3 - G4]
x = [Vin; Vb; Vout]
b = [Vin*G1; 0; 0]

x = A^-1*b
pretty(x(3,1))
Vout_dc = Vin*(R2*(R3 + R4)./(R2 + R3 + R4))./(R1 + R2*(R3 + R4)./(R2 + R3 + R4))

R1 = 47*10^3;
R2 = 10*10^3;
R3 = 10*10^3;
R4 = 1*10^6;
C1 = 47*10^-9;
C2 = 22*10^-9;
K_ltspice = 172.29e-3;
K_dc = eval(Vout_dc)

Vout_dc_dB = 20*log10(Vout_dc)

K_dB = 20*log10(K)
% 3. radek matice A
H = x(3,1);
% Define 's' as transfer function variable
s = tf('s');
% Convert to a string
TFstr = char(H);
% Evaluate the expression: "TF = (s+2)/(s^2+5*s+9)"
eval(['TF = ',TFstr])

% Poles of dynamic system
P = pole(TF)

options = bodeoptions;
options.FreqUnits = 'Hz'; % or 'rad/second', 'rpm', etc.
options.PhaseUnits = 'deg'; % 'deg' | 'rad'
bode(TF,{10, 1*10^6},options)
mag = squeeze(mag);
grid on;


Xc1 = 1/(i*w*C1);
Xc2 = 1/(i*w*C2);
Z1 = (R2*Xc1)/(R2+Xc1);
Z2 = (R4*Xc2)/(R4+Xc2);
Zdown = (Z1*(R3+Z2))/(Z1+R3+Z2);
Zup=R1;
f=linspace(10, 100, 1e6);
w = 2*pi*f;
prenos = Zdown./(Zdown + Zup)

% plot(f,abs(prenos),'r')