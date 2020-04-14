syms R1 R2 R3 R4 C1 C2 Va Vin Vout Vb Ix Ia Ib Ic w s

G1 = 1./R1;
G2 = 1./R2 + s*C1;
G3 = 1./R3;
G4 = 1./R4 + s*C2;

Vin = 1;
%      Va,              Vb        ,       Vout,   Ix
A = [ G1,  -G1                  ,             0,   1;       %  Va
        -G1,   G1 + G2 + G3, -G3        ,   0;       %  Vb
            0,                    -G3,  G3 + G4,  0;       %  Vout
            1,                        0,              0,  0     ]  %  Ix
x = [Va; Vb; Vout; Ix];
b = [0; 0; 0;Vin];

x = A^-1*b;
pretty(x(3,1))

R1 = 47*10^3;
R2 = 10*10^3;
R3 = 10*10^3;
R4 = 1*10^6;
C1 = 47*10^-9;
C2 = 22*10^-9;


% 3. radek matice A
H = x(3,1)
% Define 's' as transfer function variable
s = tf('s');
% Convert to a string
TFstr = char(H);
% Evaluate the expression: "TF = (s+2)/(s^2+5*s+9)"
eval(['TF = ',TFstr]);

% Poles of dynamic system
P = pole(TF);

options = bodeoptions;
options.FreqUnits = 'Hz'; % or 'rad/second', 'rpm', etc.
options.PhaseUnits = 'deg'; % 'deg' | 'rad'
bode(TF,{10, 1*10^6},options);
mag = squeeze(mag);
grid on;