echo WIKING XELATEX compile
timer 
rem http://www.gammadyne.com/cmdline.htm#timer
rem latexmk -pvc -pdf -e "$pdflatex='xelatex %O -interaction=nonstopmode %S'" wiking.tex 
rem latexmk -pvc -pdf -e "$pdflatex='lualatex %O -interaction=nonstopmode -halt-on-error %S'" luaking.tex 
rem latexmk -pvc -pdf -e "$pdflatex='xelatex %O -interaction=nonstopmode %S' -recorder -extra-mem-bot=50000000 -enable-write18 -shell-escape  -jobname=wiking" wiking.tex 
rem xelatex.exe -synctex=1 -interaction=nonstopmode %.tex
xelatex.exe '\providecommand{\DebugMode}{false}\input{wiking.tex}' -synctex=1 -interaction=nonstopmode -halt-on-error -recorder -extra-mem-bot=70000000 -extra-mem-top=50000000 -enable-write18 -shell-escape  -jobname=wiking wiking.tex
rem xelatex.exe '\providecommand{\DebugMode}{false}\input{wiking.tex}'  -jobname=wiking -synctex=1 -interaction=nonstopmode --enable-write18 -shell-escape  %.tex
rem xelatex '\providecommand{\DebugMode}{false}\input{wiking.tex}'  -jobname=wiking --enable-write18 --extra-mem-bot=10000000 -synctex=1 -interaction=nonstopmode -output-driver="xdvipdfmx -V 5" wiking.tex  >report.txt 

timer /s /nologo
biber wiking.bcf
timer
xelatex.exe '\providecommand{\DebugMode}{false}\input{wiking.tex}' -synctex=1 -interaction=nonstopmode -halt-on-error -recorder -extra-mem-bot=100000000 -extra-mem-top=100000000-enable-write18 -shell-escape  -jobname=wiking wiking.tex >report.txt  
timer /s /nologo

COPY "d:\TEX\tex\wiking.pdf" "c:\Users\jaros\Google Drive\wiking.pdf"