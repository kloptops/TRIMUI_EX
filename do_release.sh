
find . -iname '.DS_Store' -or -iname '._*' -delete -print

rm -vf TRIMUI_EX.zip

echo "Creating TRIMUI_EX.zip"
zip -9r TRIMUI_EX.zip System/ Roms/ Imgs/ Emus/ -x '*.DS_Store'
