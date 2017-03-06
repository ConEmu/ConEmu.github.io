@setlocal
@if NOT defined LANG ( set "LANG=en_US.UTF-8" )
@set git=
@if exist "%~dp0.set-git-path.cmd" call "%~dp0.set-git-path.cmd"
@if NOT defined git ( set "git=git.exe" )
@pushd "%~dp0"
@call git checkout master
@call git pull origin
@call "%~dp0push-conemu-en.cmd"
@call git checkout conemu-ru && call git merge master && call git checkout master
@call "%~dp0push-conemu-ru.cmd"
@popd
