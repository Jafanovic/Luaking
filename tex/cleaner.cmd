ECHO "SMAZE SOUBORY S NASLEDUJICI PRIPONOU:"
ECHO ""
DEL /F /S *.log
DEL /F /S *.bak
DEL /F /S *.aux
DEL /F /S wiking*.mtc*
DEL /F /S *.mtc*
DEL /F /S *.djs
DEL /F /S *.out
DEL /F /S *.toc
DEL /F /S main*.xml
DEL /F /S *.tips
rem DEL /F /S *.log
DEL /F /S *.upa
DEL /F /S *.upb
DEL /F /S *.maf
DEL /F /S *.bcf
DEL /F /S *.blg
DEL /F /S *.bbl
DEL /F /S *.ptc*
DEL /F /S wiking*.atfi
DEL /F /S *.atfi
DEL /F /S /A H Thumbs.db
DEL /F /S /A H .picasa.ini
DEL /F /S *.gz
DEL /F /S wiking*.xml
DEL /F /S *.xml
DEL /F /S *.upb
DEL /F /S *.dpth
DEL /F /S *.md5
DEL /F /S *.out
DEL /F /S *.bcf
DEL /F /S *.synctex(busy)
DEL /F /S *.xdv
DEL /F /S *.fdb
DEL /F /S *.fls
DEL /F /S *.fdb_latexmk

for /r %%F in (*) do if %%~zF==0 del "%%F"
PAUSE