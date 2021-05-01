echo Multibook compile 
SETLOCAL

echo FIRST ROUND   
color 06
set root_file=vol01
lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file% 
REM lualatex.exe \providecommand{\DebugMode}{false}\input{vol01.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=vol01 
echo Generate requested bibliography
biber %root_file%.bcf

color 07
set root_file=vol02
lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file% 
REM lualatex.exe \providecommand{\DebugMode}{false}\input{vol02.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=vol02
echo Generate requested bibliography
biber %root_file%.bcf

color 0A 
set root_file=vol03
lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file% 
REM lualatex.exe \providecommand{\DebugMode}{false}\input{vol03.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=vol03
echo Generate requested bibliography
biber %root_file%.bcf

color 0B
set root_file=vol04
lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file% 
REM lualatex.exe \providecommand{\DebugMode}{false}\input{vol04.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=vol04
echo Generate requested bibliography
biber %root_file%.bcf


ENDLOCAL
@echo off
pause