@echo off

setlocal

if exist "%~dp0.set-git-path.cmd" call "%~dp0.set-git-path.cmd"

if "%~1"=="" (
  set message="ConEmu AutoUpdate"
) else (
  set message="%~1"
)

cd /d "%~dp0.."
call cecho /green "%CD%"

%git% add version.ini version.json
if errorlevel 1 exit /b 100
%git% commit -m %message%
if errorlevel 1 exit /b 100
%git% checkout conemu-ru
if errorlevel 1 exit /b 100
%git% merge master
if errorlevel 1 exit /b 100

call "%~dp0push-conemu.cmd"
