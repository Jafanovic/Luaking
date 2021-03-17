REM https://stackoverflow.com/questions/673523/
echo WIKING LuaTEX compile

@echo off
SETLOCAL
set root_file=luaking

set starttime=%TIME%
set startcsec=%STARTTIME:~9,2%
set startsecs=%STARTTIME:~6,2%
set startmins=%STARTTIME:~3,2%
set starthour=%STARTTIME:~0,2%
set /a starttime=(%starthour%*60*60*100)+(%startmins%*60*100)+(%startsecs%*100)+(%startcsec%)

:TimeThis
REM --synctex=1 Gzipped versions of t
lualatex.exe \providecommand{\DebugMode}{true}\input{%root_file%.tex} -synctex=1 %
  -interaction=nonstopmode -shell-escape -halt-on-error -jobname=%root_file% 

REM lualatex -synctex=1 -interaction=nonstopmode -shell-escape -halt-on-error -jobname=luaking %
REM "&pdflatex" mylatexformat.ltx """luaking.tex""

set endtime=%time%
set endcsec=%endTIME:~9,2%
set endsecs=%endTIME:~6,2%
set endmins=%endTIME:~3,2%
set endhour=%endTIME:~0,2%
if %endhour% LSS %starthour% set /a endhour+=24
set /a endtime=(%endhour%*60*60*100)+(%endmins%*60*100)+(%endsecs%*100)+(%endcsec%)

set /a timetaken= ( %endtime% - %starttime% )
set /a timetakens= %timetaken% / 100
set timetaken=%timetakens%.%timetaken:~-2%

echo.
echo Took: %timetaken% sec.