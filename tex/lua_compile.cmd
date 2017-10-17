echo WIKING LuaTEX compile
SETLOCAL
set root_file=luaking

timer 


lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file% 

biber %root_file%.bcf

lualatex.exe \providecommand{\DebugMode}{false}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file%

timer /s /nologo

COPY "d:\Github\Luaking\tex\%root_file%.pdf" "c:\Users\jaros\Google Drive\%root_file%.pdf"

ENDLOCAL
@echo off
pause