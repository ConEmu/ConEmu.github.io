---
redirect_from:
 - /ru/BashOnWindows.html

title: "ConEmu | Bash on Ubuntu on Windows in ConEmu (WSL)"

description: "Some hints about setting up Bash on Windows (WSL) in ConEmu"

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks
---

# Bash on Windows

At first, official place for bugs of ‘Windows Subsystem for Linux’ is:
<https://github.com/Microsoft/BashOnWindows/issues/>.

**WSL** or ‘Windows Subsystem for Linux’ or ‘Bash on Ubuntu on Windows’
was brought to you by efforts of Microsoft and Canonical.
This subsystem allows users to run **native** linux binaries in Windows 10
without using of virtual machines or recompilations.

**Required** 64-bit version of Windows 10 Anniversary Update build 14316 or later!

![Bash on Windows in ConEmu](/img/BashOnWindows.png)


* Installation
  * [Good places to start](#start)
  * [TLDR: WSL Installation](#TLDR)
* [Some techinfo](#techinfo)
* [Get arrows working in ConEmu](#arrows)
  * Solution 1: Default task {bash} {#arrows-sol-1}
  * [Solution 2: StatusBar's Terminal modes](#arrows-sol-2)
  * [Solution 3: wslbridge](#arrows-sol-3)
* [WSLBridge: Get 24-bit colors working in ConEmu](#wslbridge)
  * [TLDR: Just run wslbridge](#TLDR2)
  * [How to get 24-bit colors working](#true-color-example)
  * [WSLBridge manual installation and Task contents](#wslbridge-task)
  * [Other versions of WSLBridge](#wslbridge-32)



### Good places to start  {#start}

* <https://msdn.microsoft.com/commandline/wsl/install_guide>
* <https://msdn.microsoft.com/commandline/wsl/about>

### TLDR: WSL Installation  {#TLDR}

* ‘Settings’ -> ‘Update and Security’ -> ‘For developers’: Enable ‘Developer mode’
*  Reboot
* ‘Administrator's command prompt’ execute the following:

~~~
powershell -command Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
~~~

* After another reboot, run in the ‘command prompt’ to install required files:

~~~
%windir%\system32\bash.exe
~~~


## Some techinfo  {#techinfo}

Despite the fact WSL binaries runs in Windows console window,
they are not native Windows console applications (obviously)
and they are not using native
[Windows Console API](https://msdn.microsoft.com/en-us/library/windows/desktop/ms681913.aspx).

When you run `%windir%\system32\bash.exe` this native Windows process
starts ‘linux kernel’ outside of Windows console,
and linux applications commuticate with [conhost](ConsoleApplication.html#conhost)
without use of Windows Console API.

That means ConEmu can't ‘[hook](ConEmuHk.html)’ linux processes!
Unfortunately `bash.exe` which may be hooked is only a sort of
a loader for WSL, `bash.exe` does not do console output and
all [ANSI sequences](AnsiEscapeCodes.html) are processed **before**
ConEmu can see them. WSL process all ANSI and writes stripped
output directly to [conhost](ConsoleApplication.html#conhost).

Another problem is that due to mistake in WSL design,
keypresses written to [conhost](ConsoleApplication.html#conhost)
input buffer using **standard** Windows API function
[WriteConsoleInput](https://msdn.microsoft.com/en-us/library/windows/desktop/ms687403.aspx)
are not converted into xterm keyboard sequences.
But when user presses same key directly in [RealConsole](RealConsole.html)
they are converted properly.

Both problem have workarounds, read further.




## Get arrows working in ConEmu  {#arrows}

This solution is **only for [Bash on Windows (WSL)](https://github.com/Microsoft/BashOnWindows)**!
It does not rely to [Cygwin, MSYS](CygwinMsys.html) or [Git-for-Windows](GitForWindows.html)!

Due to the bug [BashOnWindows#111](https://github.com/Microsoft/BashOnWindows/issues/111)
arrows may not be working in some cases if you start just a `bash.exe`.
More details in tickets
[BashOnWindows#111](https://github.com/Microsoft/BashOnWindows/issues/111)
and
[ConEmu#629](https://github.com/Maximus5/ConEmu/issues/629).


### Solution 1: Default task {bash} {#arrows-sol-1}

1. Don't use [Old ConEmu Builds](OldBuild.html)!
   There is no sense to complain on things changed months ago!
   [Update](UpdateModes.html) your installation!
2. ConEmu creates new task for ‘Bash on Windows’ automatically,
   you may check this by running `ConEmu64.exe -basic -run {bash}`.
   Also, you may call [Add default tasks...](SettingsTasks.html#id2632)
   from [Tasks page](SettingsTasks.html) on your existing config.
3. So, just run `{bash}` [task](Tasks.html), arrow keys are expected
   to be working!

   
### Solution 2: StatusBar's Terminal modes  {#arrows-sol-2}

You may enable [StatusBar](StatusBar.html) column ‘Terminal modes’.
LeftClick the column and select ‘XTerm’ and ‘AppKeys’ when tab with Bash on Windows
is active.

{% comment %} Using ‘App Keys’ here to make it searchable {% endcomment %}

When ‘XTerm’ mode is turned on, ConEmu posts into the console input buffer
ANSI sequences instead of native Windows key-codes. For example, Linux application
expect to receive `^[[A` instead of `VK_UP`.

However there are two notations, and some applications turns on ‘App Keys’ mode
to receive `^[OA` instead of `^[[A`. That is the problem, because without [wslbridge](#wslbridge)
ConEmu doesn't receive the request to change the mode!

So, if keys are not working properly, it may mean that application expects another mode
of ‘App Keys’. The solution is simple: just LeftClick the ‘Terminal modes’ [StatusBar](StatusBar.html) column
and change ‘AppKeys’ mode!


### Solution 3: wslbridge  {#arrows-sol-3}

Another alternative is [wslbridge](#wslbridge) described below.




## WSLBridge: Get 24-bit colors working in ConEmu  {#wslbridge}

Ryan Prichard has created [wslbridge](https://github.com/rprichard/wslbridge)
which allows anyone to run WSL in any POSIX enabled terminal like mintty
or [ConEmu cygwin/msys connector](CygwinMsysConnector.html).

If you don't like to download megabytes of cygwin's installation,
you may try precompiled distribution of
[wsltty](https://github.com/mintty/wsltty/releases).
It's just a 32-bit bundle of mintty, cygwin1.dll and wslbridge.

Does not matter what bitness of cygwin binaries you are trying,
wslbridge is just a ‘bridge’ between Windows terminal and your
64-bit linux applications which are running in WSL.

So, example of minimal working environment is below.
Just place these files in some folder on your NTFS drive,
I used the folder `C:\MSYS\WSL`.

| File | Source |
|:---|:---|
| conemu-cyg-32.exe | [latest connector release](https://github.com/Maximus5/cygwin-connector/releases) |
| wslbridge.exe <br/> wslbridge-backend | [wslbridge-*-cygwin32.tar.gz](https://github.com/rprichard/wslbridge/releases) |
| cygwin1.dll | <https://cygwin.com/> or [wsltty](https://github.com/mintty/wsltty/releases) |

Now you may run the command below. Don't forget to change `C:\MSYS\WSL` if you use different folder!
Also read about [-new_console switch](NewConsole.html).

~~~
conemu-cyg-32.exe ./wslbridge.exe -t "-new_console:C:%LOCALAPPDATA%\lxss\bash.ico" "-new_console:D:C:\MSYS\WSL" -new_console:np
~~~


### TLDR: Just run wslbridge  {#TLDR2}

Well, you may run `wsl-con.cmd` which would set up wslbridge for you.

**Warning**, if you have installed ConEmu in ‘Program Files’,
or any other protected location, please run `wsl-con.cmd`
as Administrator (from elevated ConEmu tab).

Download [wsl-con.cmd here](https://github.com/Maximus5/ConEmu/raw/daily/Release/ConEmu/wsl/wsl-con.cmd).


### How to get 24-bit colors working  {#true-color-example}

You need just few more files:

1) `256colors2.pl` download it from [./256colors2.pl]

2) `wsl-con.bat` to start new tab in ConEmu

~~~
@echo off
if "%~1" == "-run" goto run
ConEmuC -c "%~0" -run "-new_console:C:%LOCALAPPDATA%\lxss\bash.ico" "-new_console:D:%~dp0" -new_console:np
goto :EOF
:run
call SetEscChar
echo %ESC%[9999H
conemu-cyg-32.exe ./wslbridge.exe -t ./boot.sh
~~~

3) and `boot.sh` to print gradient map, system information and run bash prompt

~~~
#/bin/sh
uname -a
./256colors2.pl
cd ~
bash -l -i
~~~


### WSLBridge manual installation and Task contents  {#wslbridge-task}

To run wslbridge in ConEmu, just do simple steps:

1. Download latest [wsltty](https://github.com/mintty/wsltty/releases) and unpack it.
   You need three files: `wslbridge.exe`, `cygwin1.dll`, `wslbridge-backend`.
2. Download latest [connector](https://github.com/Maximus5/cygwin-connector/releases).
   You need the file: `conemu-cyg-64.exe`. Bitness must be the same as `cygwin1.dll`
   from ‘step 1’.
3. Put these four files into some folder, for example: `C:\Tools\ConEmu\wsl`.
4. Create the task `{WSL:Bridge}`.

Task **command**:
~~~
C:\Tools\ConEmu\wsl\conemu-cyg-64.exe /cygdrive/c/Tools/ConEmu/wsl/wslbridge.exe -cur_console:pn
~~~

Task parameters (icon):
~~~
-icon "%USERPROFILE%\AppData\Local\lxss\bash.ico"
~~~


### Other versions of WSLBridge  {#wslbridge-32}

If 64-bit version is not working for same reasons, you may try other WSLBridge versions:
32-bit cygwin or 32/64-bit msys2.

1. Download [desired wslbridge release](https://github.com/rprichard/wslbridge/releases).
2. Obtain required dlls:
   * either `cygwin1.dll` from [https://cygwin.com/](https://cygwin.com)
   * or `msys-2.0.dll` from [http://www.msys2.org/](http://www.msys2.org/)
3. Download latest [connector](https://github.com/Maximus5/cygwin-connector/releases).
4. Collect all files in some folder, for example: `C:\Tools\ConEmu\wsl`.
5. Create the task `{WSL:Bridge}`.

If you selected cygwin-32, so the Task command would be:
~~~
C:\Tools\ConEmu\wsl\conemu-cyg-32.exe /cygdrive/c/Tools/ConEmu/wsl/wslbridge.exe -cur_console:pn
~~~
