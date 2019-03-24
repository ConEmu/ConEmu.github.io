@echo off

setlocal

if NOT defined LANG ( set "LANG=en_US.UTF-8" )

set git=
if exist "%~dp0.set-git-path.cmd" call "%~dp0.set-git-path.cmd"
if NOT defined git ( set "git=git.exe" )

if "%~1"=="" (
  set message="ConEmu AutoUpdate"
) else (
  set message="%~1"
)

cd /d "%~dp0.."
call cecho /green "%CD%"

call "%git%" add version.ini version.json
if errorlevel 1 exit /b 100
call "%git%" commit -m %message%
if errorlevel 1 exit /b 100
call "%git%" checkout conemu-ru
if errorlevel 1 exit /b 100
call "%git%" merge master
if errorlevel 1 exit /b 100

call "%~dp0push-conemu.cmd" --pull
