@echo off

if "%~5"=="" goto invarg

setlocal

powershell -noprofile -ExecutionPolicy RemoteSigned -command "%~dp0UpdateIni.ps1" -build %~1 -relType %~2 -exe_path %3 -arc_path %4 -git_path %5

if errorlevel 1 exit 100
goto :EOF

:invarg
echo Invalid argument. Usage: Update_Ini ^<BuildNo^> devel^|preview^|preview_alpha^|stable setup_dir pack_dir www_dir
goto :EOF
