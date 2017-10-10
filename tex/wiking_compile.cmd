rem latexmk -pvc -pdf -e "$pdflatex='xelatex %O -interaction=nonstopmode %S'" main.tex 
rem xelatex.exe -synctex=1 -interaction=nonstopmode %.tex
timer 
echo http://www.gammadyne.com/cmdline.htm#timer
xelatex.exe '\providecommand{\DebugMode}{false}\input{wiking.tex}' -synctex=1 -interaction=nonstopmode --extra-mem-bot=50000000 --enable-write18 -shell-escape  -jobname=wiking 
rem xelatex.exe '\providecommand{\DebugMode}{false}\input{wiking.tex}'  -jobname=wiking -synctex=1 -interaction=nonstopmode --enable-write18 -shell-escape  %.tex
rem xelatex '\providecommand{\DebugMode}{false}\input{wiking.tex}'  -jobname=wiking --enable-write18 --extra-mem-bot=10000000 -synctex=1 -interaction=nonstopmode -output-driver="xdvipdfmx -V 5" wiking.tex  >repo	rt.txt 
rem xelatex '\providecommand{\DebugMode}{false}\input{wiking.tex}'  -jobname=wiking --enable-write18 --extra-mem-bot=50000000 -synctex=1 -interaction=nonstopmode -output-driver="xdvipdfmx -V 5" wiking.tex   
timer /s /nologo
biber wiking.bcf
timer
rem xelatex '\providecommand{\DebugMode}{false}\input{wiking.tex}'  -jobname=wiking --enable-write18 --extra-mem-bot=50000000 -synctex=1 -interaction=nonstopmode -output-driver="xdvipdfmx -V 5" wiking.tex  >report.txt 
xelatex.exe '\providecommand{\DebugMode}{false}\input{wiking.tex}' -synctex=1 -interaction=nonstopmode --extra-mem-bot=50000000 --enable-write18 -shell-escape  -jobname=wiking 
timer /s /nologo

COPY "d:\TEX\tex\wiking.pdf" "c:\Users\jaros\Google Drive\wiking.pdf"