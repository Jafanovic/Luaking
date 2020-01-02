set table "mai_fig048.pgf-plot.table"; set format "%.5f"
set format "%.7e";; set samples 1000; set dummy x; plot [x=0:1400] (1000*4*pi*(4.7e-26/(2*pi*1.380e-23*500))**(3.0/2.0))*(x**2)*exp(-(4.7e-26*x**2)/(2*1.380e-23*500));
