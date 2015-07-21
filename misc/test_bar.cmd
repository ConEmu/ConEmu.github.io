@echo off
setlocal

rem We use UTF-8 just to be able to print a bullet: ·
chcp 65001 > nul

set "esc="

pause

call :progress_init
for /l %%i in (0,1,100) do call :progress_cycle %%i
call :progress_done
pause

exit /b

:progress_init
echo        %esc%[8G0%%    [%esc%[s%esc%[50C]
for /l %%m in (1,1,49) do echo %esc%[u%esc%[%%mC·
goto :EOF

:progress_done
rem Reset Windows7 taskbar progress
call ConEmuC -GuiMacro Progress(0); > nul
rem and print finished progress bar in the console
echo %esc%[F%esc%[16G%esc%[%check%C%esc%[2CDONE
echo.
goto :EOF

:progress_cycle
set /a "check=%1/2-1"
for /l %%k in (0,1,%check%) do echo %esc%[u%esc%[%%kCo
echo %esc%]9;4;1;%1%esc%\%esc%[F%esc%[8G%1%%
for /l %%j in (1,1,300) do set "a=1"
goto :EOF
