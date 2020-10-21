echo WIKING LuaTEX compile
SETLOCAL
set root_file=luaking
set start_time=%time%

echo START %start_time%
lualatex.exe \providecommand{\DebugMode}{true}\input{./tex/%root_file%.tex} -synctex=1 -interaction=nonstopmode -halt-on-error -jobname=%root_file%  --input-directory=${fileDirname}

echo STOP %time%
ENDLOCAL
@echo off
pause