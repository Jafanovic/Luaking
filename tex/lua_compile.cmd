echo WIKING LuaTEX compile
SETLOCAL
set root_file=luaking

timer 
echo FIRST ROUND   
color 07
lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file% 

biber %root_file%.bcf

echo SECOND ROUND   
color 06
lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file%

biber %root_file%.bcf

echo THIRD ROUND   
color 0A
lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file%

timer /s /nologo


COPY ".\%root_file%.pdf" "..\..\%root_file%_%date:~-4,4%_%date:~-7,2%_%date:~-10,2%.pdf"
COPY ".\%root_file%.log" "..\..\%root_file%_%date:~-4,4%_%date:~-7,2%_%date:~-10,2%.log"

rem gswin64 -o luakingGray.pdf^
rem    -sDEVICE=pdfwrite^
rem    -sColorConversionStrategy=Gray^
rem    -dProcessColorModel=/DeviceGray^
rem    -dCompatibilityLevel=1.4^
rem     luaking.pdf

ENDLOCAL
@echo off
pause