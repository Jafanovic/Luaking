rem latexmk -pvc -pdf -e "$pdflatex='xelatex %O -interaction=nonstopmode %S'" main.tex 
rem xelatex.exe -synctex=1 -interaction=nonstopmode %.tex
rem timer 
rem echo http://www.gammadyne.com/cmdline.htm#timer
rem xelatex  -jobname=wiking --enable-write18 --extra-mem-bot=10000000 -synctex=1 -interaction=nonstopmode -output-driver="xdvipdfmx -V 5" wiking.tex  >report.txt '\providecommand{\DebugMode}{false}\input{wiking.tex}'

rem xelatex '\providecommand{\DebugMode}{true}\input{wiking.tex}'  -jobname=wiking --enable-write18 --extra-mem-bot=10000000 -synctex=1 -interaction=nonstopmode -output-driver="xdvipdfmx -V 5" wiking.tex  >report.txt 
xelatex '\providecommand{\DebugMode}{true}\input{wiking.tex}'  -jobname=wiking --enable-write18 --extra-mem-bot=10000000 -synctex=1 -interaction=nonstopmode -output-driver="xdvipdfmx -V 5" wiking.tex   
rem timer /s /nologo
rem biber wiking.bcf
rem timer
rem xelatex  -jobname=wiking --enable-write18 --extra-mem-bot=10000000 -synctex=1 -interaction=nonstopmode -output-driver="xdvipdfmx -V 5" wiking.tex  >report.txt
rem timer /s /nologo

rem COPY "d:\TEX\tex\wiking.pdf" "c:\Users\jaros\Google Drive\wiking.pdf"