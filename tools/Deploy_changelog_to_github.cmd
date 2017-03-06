@echo off

setlocal

if NOT defined LANG ( set "LANG=en_US.UTF-8" )

set git=
if exist "%~dp0.set-git-path.cmd" call "%~dp0.set-git-path.cmd"
if NOT defined git ( set "git=git.exe" )

if "%~1"=="" (
  set message="ConEmu What's New"
) else (
  set message="%~1"
)


cd /d "%~dp0.."
call cecho /green "Creating release post {%CD%}"
cd /d "%~dp0.."
powershell -noprofile -command "%CD%\_posts\release.ps1"

rem %git% add en/Whats_New.html
call %git% add _posts/20??-??-??-Build-*.md
if errorlevel 1 exit /b 100
call %git% commit -m %message%
if errorlevel 1 exit /b 100
if /I "%~3" == "--commit-only" goto skip_push
call "%~dp0push-conemu.cmd" --pull
if errorlevel 1 exit /b 100
:skip_push
