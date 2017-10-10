echo WIKING LuaTEX compile
SETLOCAL
set root_file=luaking

timer 

lualatex.exe -synctex=1 -interaction=nonstopmode -halt-on-error -shell-escape %root_file%.tex

biber %root_file%.bcf
timer /s /nologo

rem COPY "d:\TEX\tex\wiking.pdf" "c:\Users\jaros\Google Drive\wiking.pdf"



ENDLOCAL
@echo off
pause