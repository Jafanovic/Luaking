echo Multibook compile 
@echo OFF
REM Batch file for loop – looping through a range of values
REM http://www.trytoprogram.com/batch-file-for-loop/#example
set x=4
FOR /L %%y IN (1, 1, %x%) DO (
	ECHO LOOP %%y   
	color %%y
	lualatex.exe \providecommand{\DebugMode}{false}\input{vol0%%y.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=vol0%%y 
	echo Generate requested bibliography
	biber vol0%%y.bcf
)
PAUSE
