echo off
cls
IF %1"==" GOTO CDID
echo %1 > var
copy ufoc.d+var ufo.bat >nul
setup
echo.
echo.
echo To run UFO enter UFO at the prompt
echo.
goto END
:CDID
echo.
echo.
echo You must enter CDSETUP followed by the drive letter for your CD ROM.
echo.
echo For example   CDSETUP D:  or CDSETUP E:  etc...
echo.
echo.
:END
