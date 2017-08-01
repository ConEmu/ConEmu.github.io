rem @echo off

set tmp_drv=Y:
set "tmp_dir=%TEMP%\ConEmu-temp\%date%"

echo Creating temporary directory `%tmp_dir%`
mkdir "%TEMP%\ConEmu-temp" > nul
rd /Q /S "%tmp_dir%"
mkdir "%tmp_dir%"
if errorlevel 1 (
  call cecho "Failed to create temp dir"
  pause
  goto :EOF
)

echo Mapping drive %tmp_dir%
subst %tmp_drv% "%tmp_dir%"
if errorlevel 1 (
  call cecho "Failed to map %tmp_drv% drive"
  pause
  goto :EOF
)

set resetdefault=
if exist "%~dp0Screenshots.xml" (
  copy "%~dp0Screenshots.xml" %tmp_drv%\ConEmu.xml
) else (
  set resetdefault=-resetdefault
)

echo Starting ConEmu with screenshot maker script
if "%~1" == "-detached" (
call ConEmu %resetdefault% -loadcfgfile %tmp_drv%\ConEmu.xml -detached
) else (
call ConEmu %resetdefault% -loadcfgfile %tmp_drv%\ConEmu.xml -run powershell -noprofile -ExecutionPolicy RemoteSigned -command "%~dp0Settings-Screenshot.ps1" -cur_console:n
)

echo ConEmu was terminated (exitcode=%exitcode%)
rem Wait a little to avoid drive locking?
timeout 3

echo Releasing drive %tmp_drv%
subst %tmp_drv% /d
echo Removing temprorary directory `%tmp_dir%`
rd /Q /S "%tmp_dir%"
