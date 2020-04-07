syms I I1 I2 I3 V
syms w C L Gpp real
assume( w>0);
assume( C>0);
assume( L > 0);
assume( Gpp>0);
expr = (I*L*w)/(C*L*w^2*1i + Gpp*L*w - 1i) ;
a = abs( expr) ;
rewrite(a,'sqrt')