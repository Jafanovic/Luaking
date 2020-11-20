echo WIKING LuaTEX compile
SETLOCAL
set root_file=luaking
set start_time=%time%

echo COMPILATION START: %start_time%
echo FIRST ROUND   
color 07
lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file% 

echo Generate requested bibliography
biber %root_file%.bcf

echo SECOND ROUND   
color 06
lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file%

echo THIRD ROUND   
color 0A
lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file%

echo Copy files to Build folder   
COPY ".\%root_file%.pdf" "..\build\%root_file%_%date:~-4,4%_%date:~-7,2%_%date:~-10,2%.pdf"
COPY ".\%root_file%.log" "..\build\%root_file%_%date:~-4,4%_%date:~-7,2%_%date:~-10,2%.log"

gswin64 -o %root_file%_gray.pdf^
   -sDEVICE=pdfwrite^
   -sColorConversionStrategy=Gray^
   -dProcessColorModel=/DeviceGray^
   -dCompatibilityLevel=1.4^
    luaking.pdf
	
COPY ".\%root_file%_gray.pdf" "..\build\%root_file%_%date:~-4,4%_%date:~-7,2%_%date:~-10,2%_gray.pdf"
DEL luaking*.pdf

rem START cleaner.cmd

echo COMPILATION STOP: %time%
ENDLOCAL
@echo off
pause