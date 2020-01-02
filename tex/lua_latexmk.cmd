echo WIKING LUALATEX compile
rem https://www.mankier.com/1/latexmk
SETLOCAL
set root_file=luaking
:: -pvc:   mnemonic: "previewcontinuously"
:: -e:     Execute the speciﬁed initialization code before processing.  
:: -pdf:   Generate pdf version of document using pdﬂatex.
:: -pdﬂua: Generate pdf version of document using lualatex.
:: -pdfxe: Generate pdf version of document using xelatex.
:: -time:  ShowCPU time used
latexmk -pvc -time -pdflua -e "$pdflatex='lualatex -interaction=nonstopmode -halt-on-error \providecommand{\DebugMode}{true}\input{%root_file%.tex}'" %root_file%.tex 
