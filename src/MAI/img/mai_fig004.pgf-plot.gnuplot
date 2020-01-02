set table "mai_fig004.pgf-plot.table"; set format "%.5f"
set format "%.7e";; set samples 1000; set dummy x; plot [x=-0.999999:0.999999] log10(sqrt(1-x**2))/log10(2);
