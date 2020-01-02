echo WIKING LuaTEX compile
SETLOCAL
set root_file=luaking
set start_time=%time%

echo START %start_time%
lualatex.exe \providecommand{\DebugMode}{true}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file% 

biber %root_file%.bcf

lualatex.exe \providecommand{\DebugMode}{true}\input{%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file%

timer /s /nologo

rem COPY ".\%root_file%.pdf" "..\..\%root_file%_%date:~-4,4%_%date:~-7,2%_%date:~-10,2%.pdf"
rem COPY ".\%root_file%.log" "..\..\%root_file%_%date:~-4,4%_%date:~-7,2%_%date:~-10,2%.log"


echo STOP %time%
ENDLOCAL
@echo off
pause