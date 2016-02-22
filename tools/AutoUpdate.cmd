@echo off

setlocal

if NOT defined LANG ( set "LANG=en_US.UTF-8" )

if "%~2"=="" (
  echo Usage: %~nx0 ^<BuildNo^> ^<Alpha^|Preview^|Preview+Alpha^|Stable^> [-local]
  goto :EOF
)

if exist "%~dp0.set-git-path.cmd" call "%~dp0.set-git-path.cmd"

call "%~dp0.set-deploy-dir.cmd"
set "setup_dir=%CD%\Setup"
set "pack_dir=%CD%\Pack"

set upld_dir=
call "%~dp0.set-upld-dir.cmd"
echo '%upld_dir%'
if "%upld_dir%" == "" (
  call cecho "Folder with upload tools not found"
  pause
  exit /b 100
)
set "upld_dir=%CD%"

cd /d "%~dp0.."
if errorlevel 1 (
  call cecho "Folder `ConEmu.github.io` not found"
  pause
  exit /b 100
)
set "www_dir=%CD%"

call :GET_NAME %~n1

echo Setup: %EXE_NAME%.exe
echo Pack:  %ARC_NAME%.7z
echo Port:  %PAF_NAME%.exe
echo Upld:  %upld_dir%
echo GIT:   %www_dir%

set all_found=1

if not exist "%EXE_NAME%.exe" (
  call cecho "Installer not found: '%EXE_NAME%.exe'"
  set all_found=0
)
if not exist "%ARC_NAME%.7z" (
  call cecho "Portable not found: '%ARC_NAME%.7z'"
  set all_found=0
)
if not exist "%PAF_NAME%.exe" (
  call cecho "PortableApps not found: '%PAF_NAME%.exe'"
  set all_found=0
)

if %all_found% == 0 (
  pause
  exit /b 100
)


call cecho /green "AutoUpdates information"
if not exist "%www_dir%\tools\UpdateIni.cmd" (
  call cecho "UpdateIni.cmd not found"
  pause
  exit /b 100
)

cd /d "%www_dir%"

call git checkout master
if errorlevel 1 (
  call cecho "Checkout `master` branch in conemu.github.io failed"
  pause
  exit /b 100
)

call cecho /green "Starting UpdateIni.ps1"

rem Alpha|Devel
if /I "%~2"=="Alpha" call "%www_dir%\tools\UpdateIni.cmd" %CEVER% devel "%setup_dir%" "%pack_dir%" "%www_dir%"
if /I "%~2"=="Devel" call "%www_dir%\tools\UpdateIni.cmd" %CEVER% devel "%setup_dir%" "%pack_dir%" "%www_dir%"
if errorlevel 1 (
  call cecho "'Update_Ini.cmd stable' alpha"
  pause
  exit /b 100
)

rem Preview
if /I "%~2"=="Preview" call "%www_dir%\tools\UpdateIni.cmd" %CEVER% preview "%setup_dir%" "%pack_dir%" "%www_dir%"
if /I "%~2"=="Preview+Alpha" call "%www_dir%\tools\UpdateIni.cmd" %CEVER% preview_alpha "%setup_dir%" "%pack_dir%" "%www_dir%"
if errorlevel 1 (
  call cecho "'Update_Ini.cmd stable' preview"
  pause
  exit /b 100
)

rem Stable|Featured
if /I "%~2"=="Featured" call "%www_dir%\tools\UpdateIni.cmd" %CEVER% stable "%setup_dir%" "%pack_dir%" "%www_dir%"
if /I "%~2"=="Stable"   call "%www_dir%\tools\UpdateIni.cmd" %CEVER% stable "%setup_dir%" "%pack_dir%" "%www_dir%"
if errorlevel 1 (
  call cecho "'Update_Ini.cmd stable' failed"
  pause
  exit /b 100
)
echo .
echo Preparing `version.ini` and `version.json` finished
cd /d "%~dp0"

if "%~3" == "-local" goto :EOF


if exist "%www_dir%\_posts\.daily.md" (
  call cecho /green "Commit WhatsNew to conemu.github.io"
  call "%~dp0Deploy_changelog_to_github.cmd" "ConEmu %CEVER% What's New" --commit-only
  if errorlevel 1 (
    call cecho "Deploy_changelog_to_github failed"
    pause
    exit /b 100
  )
)


call cecho /green "Commit AutoUpdates to GIT"
call "%~dp0Deploy_ini_to_github.cmd" "ConEmu %CEVER% AutoUpdate information"
if errorlevel 1 (
  call cecho "Deploy_ini_to_github failed"
  pause
  exit /b 100
)


rem call "%www_dir%\..project\0-sitemap.cmd"
call "%~dp0push-conemu.cmd"

rem Upload "%www_dir%\version.ini" to $SF$/AutoUpdate
pushd "%www_dir%"
cd
call cecho /yellow "%upld_dir%\UploadSF.cmd version.ini AutoUpdate"
call "%upld_dir%\UploadSF.cmd" version.ini AutoUpdate
if errorlevel 1 (
  call cecho "Upload `version.ini` to SF failed"
  pause
)
call cecho /yellow "%upld_dir%\UploadSF.cmd version.json AutoUpdate"
call "%upld_dir%\UploadSF.cmd" version.json AutoUpdate
if errorlevel 1 (
  call cecho "Upload `version.json` to SF failed"
  pause
)
popd

goto :eof

:GET_NAME1
set BASE_NAME=%~n1
goto :eof

:GET_NAME
set EXE_NAME=%setup_dir%\ConEmuSetup.%~1
set PAF_NAME=%setup_dir%\ConEmu_%1_English.paf
set ARC_NAME=%pack_dir%\ConEmuPack.%~1
set CEVER=%~1
goto :eof
