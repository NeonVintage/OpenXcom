echo off
cls
IF %1"==" goto NOWAY
WELCOME
md %1 >nul 
md %1\game_1 >nul
md %1\game_2 >nul
md %1\game_3 >nul
md %1\game_4 >nul
md %1\game_5 >nul
md %1\game_6 >nul
md %1\game_7 >nul
md %1\game_8 >nul
md %1\game_9 >nul
md %1\game_10 >nul
md %1\ufointro >nul
MD %1\MISSDAT >NUL
MD %1\SOUND >NUL
COPY SOUND\*.* %1\SOUND\*.* >NUL
copy intro.exe %1 >nul
copy ufocd.bat %1 >nul
copy dos4gw.exe %1 >nul
copy ufoc.d %1 >nul
copy cdsetup.bat %1 >nul
copy setup.exe %1 >nul
copy ufointro\*.lbm %1\ufointro\*.* >nul
done
pause >nul
cls
echo.
echo.
echo  To setup UFO, ENEMY UNKNOWN. 
echo.
echo  Change directory to %1 and then enter 
echo  CDSETUP followed by your CD ROM drive letter.
echo.
echo  For example CDSETUP D: or CDSETUP E: etc...
cd %1
echo.
echo.
goto end
:noway
cls
noway
pause >nul
cls
:end
