---
redirect_from: /ru/TipsAndTweaks.html

title: "ConEmu | Tips and Tweaks"
---

# Did you know that...

## right click on the cross  {#right_click_on_the_cross}

minimize ConEmu to taskbar status area (hide from screen).



## run console app from GUI app  {#run_console_app_from_GUI_app}

console app will starts in new ConEmu tab.



## ConEmu may set up itself as default terminal  {#ConEmu_may_set_up_itself_as_default_terminal}

goto ‘Settings’ -> ‘Integration’ and check ‘Force ConEmu as default terminal...’,
you may also adjust list of hooked applications
**from** which you like to run console applications.


{% include in_article.html %}


## ConEmu may be easily configured as compile-host  {#ConEmu_may_be_easily_configured_as_compile-host}

you may unpack ConEmu files to special folder, use portable mode
with `ConEmu.xml` file, pin shortcut to taskbar and use Windows 7
jump list.

For example, when I need to build ConEmu I just right-click on
special icon in taskbar and choose configuration (Debug, Release and
so on), and build will starts in Quake-style console. On build
errors `TypeBuildErrors.cmd "Errors.log"` called to highlight lines
with errors and warnings. I can Ctrl+Click on error and get source
file in the editor positioned on error-line. After fixing all errors
I just press `Win+~` to ‘restart’ console, this will starts build
again.



## creating single-file portable ConEmu  {#creating_single-file_portable_ConEmu}

will be clarified, WinRar required

~~~
@echo off
cd /d "%~dp0"

set cever=
if not "%~1"=="" set cever=.%~1
set inc_List=
set exc_List=

echo Setup=ConEmu.exe>ConEmuPortableRarInfo.txt
echo Silent=1 1>>ConEmuPortableRarInfo.txt
echo Overwrite=1 1>>ConEmuPortableRarInfo.txt
if "%~1"=="" echo TempMode>>ConEmuPortableRarInfo.txt
if not "%~1"=="" echo TempMode=Run ConEmu %~1 portable?, ConEmu %~1 1>>ConEmuPortableRarInfo.txt

cd Release

set inc_List=%inc_List% ConEmu.exe ConEmu\ConEmuC.exe ConEmu\ConEmuCD.dll ConEmu\ConEmuHk.dll
set inc_List=%inc_List% ConEmu\ConEmuC64.exe ConEmu\ConEmuCD64.dll ConEmu\ConEmuHk64.dll
set inc_List=%inc_List% ..\Portable_Test\*.*

if exist "..\ConEmuPortable%cever%.exe" del "..\ConEmuPortable%cever%.exe"

rar a -r -ep1 -sfxDefault.sfx -z..\ConEmuPortableRarInfo.txt "..\ConEmuPortable%cever%.exe"   %inc_List% %exc_List%
if errorlevel 1 pause & goto :EOF

call sign_any.bat "..\ConEmuPortable%cever%.exe"
~~~
