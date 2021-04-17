echo WIKING LuaTEX compile
SETLOCAL

set start_time=%time%

echo COMPILATION START: %start_time%
echo FIRST ROUND   
color 07
set root_file=vol01
lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file% 
REM lualatex.exe \providecommand{\DebugMode}{true}\input{vol01.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=vol01 
echo Generate requested bibliography
biber %root_file%.bcf

set root_file=vol02
lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file% 
REM lualatex.exe \providecommand{\DebugMode}{false}\input{vol02.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=vol02
echo Generate requested bibliography
biber %root_file%.bcf

set root_file=vol03
lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file% 
echo Generate requested bibliography
biber %root_file%.bcf


echo SECOND ROUND   
color 06
set root_file=vol01
lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file% 

set root_file=vol02
lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file% 

set root_file=vol03
lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file% 





REM echo THIRD ROUND   
REM color 0A
REM lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file%

REM echo Copy files to Build folder   
REM COPY ".\%root_file%.pdf" "..\build\%root_file%_%date:~-4,4%_%date:~-7,2%_%date:~-10,2%.pdf"
REM COPY ".\%root_file%.log" "..\build\%root_file%_%date:~-4,4%_%date:~-7,2%_%date:~-10,2%.log"
REM 
REM gswin64 -o %root_file%_gray.pdf^
REM    -sDEVICE=pdfwrite^
REM    -sColorConversionStrategy=Gray^
REM    -dProcessColorModel=/DeviceGray^
REM    -dCompatibilityLevel=1.4^
REM     luaking.pdf
REM 	
REM COPY ".\%root_file%_gray.pdf" "..\build\%root_file%_%date:~-4,4%_%date:~-7,2%_%date:~-10,2%_gray.pdf"
REM DEL luaking*.pdf

rem START cleaner.cmd

echo COMPILATION STOP: %time%
ENDLOCAL
@echo off
pause