---
redirect_from: /ru/csudo.html

title: "ConEmu | csudo - Unix like sudo command on Windows"

breadcrumbs:
 - id: c
   url: TableOfContents.html#launch-apps
   title: Launch Apps

readalso:
 - url: NewConsole.html
   title: ‘-new_console’ and ‘-cur_console’ switches
 - url: AnsiEscapeCodes.html
   title: ANSI X3.64 and Xterm-256 Support
 - url: SplitScreen.html
   title: Split Screen or Panes
---

# Unix like sudo command on Windows

Common question: ‘Is there any 'sudo' command for Windows?’

One of the answers is here.

ConEmu package contains (started from build 121028) batch file [`%ConEmuBaseDir%`](ConEmuEnvironment.html)\\[`csudo.cmd`](https://github.com/Maximus5/ConEmu/blob/master/Release/ConEmu/csudo.cmd)’. When checkbox ‘Add %ConEmuBaseDir% to %PATH%’ is On (‘[ComSpec](SettingsComspec.html)’ settings page), you may just type csudo in non-elevated prompt in your shell.

**Note** You may also rename ‘csudo.cmd’ to ‘sudo.cmd’ if you like simple ‘sudo’ notation. And you must rename it if you like to change its contents to avoid loosing your changes when new update of ConEmu arrives.

**Note** Elevated command will starts in new elevated ConEmu [tab](TabBar.html) or [pane](SplitScreen.html).


## Example

```
csudo dism /online /enable-feature /featurename:NetFX3 /All /Source:D:\sources\sxs /LimitAccess
```


## Screenshots

Let type in command prompt ‘csudo diskpart’

![Running csudo command](/img/ConEmuSuDo1.png)

Get UAC confirmation on Vista or later

![csudo UAC confirmation](/img/ConEmuSuDo2.png)

Or choose another credentials on Windows 2000 or Windows XP

![csudo UAC confirmation](/img/ConEmuSuDo4.png)

Here we are, diskpart started elevated in a split

![Running csudo command](/img/ConEmuSuDo3.png)


## Batch file contents

As you can see, batch contains two parameters, which you may redefine: `ConEmuSplit` and `ConfirmClose`.

For example, if you want to start elevated command in new tab rather than in split - just change ‘`set ConEmuSplit=VERT`’ to ‘`set ConEmuSplit=NO`’.

### csudo.cmd

```
@echo off

rem This is analogue for *nix "sudo" command
rem You may rename this file to "sudo.cmd" or use it "as is"
rem Example:
rem csudo dism /online /enable-feature /featurename:NetFX3 /All /Source:D:\sources\sxs /LimitAccess

setlocal

rem Use split screen feature? Possible values: VERT, HORZ, NO
set ConEmuSplit=VERT

rem Show confirmation before closing SUDO tab
rem You may set NO here, if confirmation is not needed
set ConfirmClose=YES


rem You may override default settings in batch-file "csudo_parms.cmd"
if exist "%~dp0csudo_parms.cmd" call "%~dp0csudo_parms.cmd"


rem When possible - use Ansi Esc sequences to print errors
rem Let set "ESC" variable to char with code \x1B
set ESC=

rem It is 64-bit OS?
if not %PROCESSOR_ARCHITECTURE%==AMD64 goto x32

rem First, try to use 64-bit ConEmuC
if exist "%~dp0ConEmuC64.exe" (
set ConEmuSrvPath="%~dp0ConEmuC64.exe"
goto run
)

:x32
rem Let use 32-bit ConEmuC
if exist "%~dp0ConEmuC.exe" (
set ConEmuSrvPath="%~dp0ConEmuC.exe"
goto run
)

:not_found
rem Oops, csudo located in wrong folder
if %ConEmuANSI%==ON (
echo %ESC%[1;31;40mFailed to find ConEmuC.exe or ConEmuC64.exe!%ESC%[0m
) else (
echo Failed to find ConEmuC.exe or ConEmuC64.exe
)
exit 100
goto :EOF

:run
rem Preparing switches
if %ConEmuSplit%==VERT (
set SPLIT=sV
) else if %ConEmuSplit%==HORZ (
set SPLIT=sH
) else (
set SPLIT=
)
if %ConfirmClose%==NO (
set ConEmuNewCon=-new_console:an%SPLIT%
) else (
set ConEmuNewCon=-new_console:ac%SPLIT%
)

if "%~1"=="" (
rem There was no arguments, just start new ComSpec
%ConEmuSrvPath% /c %ComSpec% %ConEmuNewCon%
) else (
rem Start requested command
%ConEmuSrvPath% /c %* %ConEmuNewCon%
)
rem all done
```
