% exam020.tex

% zadane hodnoty
U01 = 15 ; % [V]
U02 = 10 ; % [V]
U03 = 20 ; % [V]

R1 =  10 ; % [ohm]
R2 =  15 ; % [ohm]
R3 =  30 ; % [ohm]
R4 =  20 ; % [ohm]
R5 =  10 ; % [ohm]

G1 = 1/R1;
G2 = 1/R2;
G3 = 1/R3;
G4 = 1/R4;
G5 = 1/R5;

%matice koeficientu
A = [(G1 +G2 +G3)  , -G3;        %
             -G3   ,  (G3 +G4 +G5) ];
%vektor pravych stran
b = [U01*G1 + U02*G2; U03*G5];

%reseni soustavy
x = A\b;

%proudy vetvemy
I1 = (U01 - x(1))/R1;
I2 = (x(1) - U02)/R2;
I3 = (x(1) - x(2))/R3;
I4 = x(2)/R4;
I5 = (x(2) - U03)/R5;

%vypis proudu
fprintf('I1 = %6.4f\n', I1);
fprintf('I2 = %6.4f\n', I2);
fprintf('I3 = %6.4f\n', I3);
fprintf('I4 = %6.4f\n', I4);
fprintf('I5 = %6.4f\n', I5);