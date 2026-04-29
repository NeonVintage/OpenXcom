@echo off
sound\sndstart
cls
ufoexe\black
intro.exe
ufoexe\black
ufoexe\geoscape "0" 
if errorlevel 2 goto begin
goto end
:begin
ufoexe\black
ufo2exe\tactical "1" 
:geo
ufoexe\black
ufoexe\geoscape "1" 
if errorlevel 2 goto begin
:end
sound\sndend

