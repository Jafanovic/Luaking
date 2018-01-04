set table "mai_fig048.pgf-plot.table"; set format "%.5f"
set format "%.7e";; set samples 1000; set dummy x; plot [x=0:2000] 1000*4*pi*(10/(2*pi*0.138*300))**(3/2)*x**2*exp((10*x*x)/(2*pi*0.138*300));
