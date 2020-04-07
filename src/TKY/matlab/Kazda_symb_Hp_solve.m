syms R1 R2 R3 R4 C1 C2 Vin Vout omega


Z1= (R2*(1./i*omega.*C1))./(R2 + (1./i*omega*C1))
Z2= (R4*(1./i*omega.*C2))./(R4 + (1./i*omega*C2))
pretty(Z2)

Vout=Vin*(((Z1*(R3+Z2))./(Z1+R3+Z2))./(((Z1*(R3+Z2))./(Z1+R3+Z2))+R1))*(Z2./(Z2+R3))
Re=real(Vout)
Imag=real(Vout)
absVout=sqrt(Re^2+Imag^2)
S=simplify(Vout)
Z=simplify(absVout)
pretty(S)
pretty(Z)

A = []