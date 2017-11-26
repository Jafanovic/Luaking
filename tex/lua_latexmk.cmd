echo WIKING XELATEX compile
:: -pvc:   mnemonic: "previewcontinuously"
:: -e:     Execute the speciﬁed initialization code before processing.  
:: -pdf:   Generate pdf version of document using pdﬂatex.
:: -pdﬂua: Generate pdf version of document using lualatex.
:: -pdfxe: Generate pdf version of document using xelatex.
:: -time:  ShowCPU time used
latexmk -pvc -pdflua -e "$pdflatex='lualatex -interaction=nonstopmode -halt-on-error'" luaking.tex 
