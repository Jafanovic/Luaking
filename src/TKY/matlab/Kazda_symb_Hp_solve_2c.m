format short e

R1 = 47e3;
R2 = 10e3;
R3 = 10e3;
R4 = 1e6;
C1 = 47e-9;
C2 = 22e-9;

% f=linspace(10, 1e6, 10);

N = 10;
k= linspace(0,N-1,N);
fstart = 10;
fstop = 1e6;
fi= fstart*(fstop/fstart).^(k./(N-1))
w = 2*pi.*fi;
Xc1 = 1./(i.*w*C1);
Xc2 = 1./(i.*w*C2);
Z1 = (R2.*Xc1)./(R2+Xc1);
Z2 = (R4.*Xc2)./(R4+Xc2);
Zdown = (Z1.*(R3+Z2))./(Z1+R3+Z2);
Zup=R1;

prenos = Zdown./(Zdown + Zup);
gain = 20*log10(abs(prenos));
loglog(f,gain ,'r')
grid on;