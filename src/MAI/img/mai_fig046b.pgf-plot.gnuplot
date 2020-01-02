set table "mai_fig046b.pgf-plot.table"; set format "%.5f"
set format "%.7e";; set samples 1000; set dummy x; plot [x=-4:4] 0.5*(1+(erf((x--1)/(0.4*sqrt(2)))));
