@setlocal
@if exist "%~dp0.set-git-path.cmd" call "%~dp0.set-git-path.cmd"
@pushd "%~dp0"
@call git checkout master
@call "%~dp0push-conemu-en.cmd"
@call git checkout conemu-ru && call git merge master && call git checkout master
@call "%~dp0push-conemu-ru.cmd"
@popd
