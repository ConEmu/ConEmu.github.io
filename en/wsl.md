---
redirect_from:
 - /en/BashOnWindows.html
 - /ru/BashOnWindows.html
 - /ru/wsl.html

title: "ConEmu | Windows Subsystem for Linux (WSL)"

description: "Some hints about setting up Bash on Windows (WSL) in ConEmu"

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks

readalso:
 - url: CygwinMsysConnector.html
   title: "WSLBridge/Connector"
 - url: ShellWorkDir.html
   title: "Shell Working Directory"
 - url: CygwinStartCmd.html
   title: "Startup Command"
 - url: Xterm256Colors.html
   title: "Xterm-256 Colors"
 - url: TerminalModes.html
   title: "Terminal input and output modes"
---

# Bash on Ubuntu on Windows (WSL)

At first, official place for bugs of ‘Windows Subsystem for Linux’ is:
<https://github.com/Microsoft/WSL/issues/>.

**WSL** or ‘Windows Subsystem for Linux’ or ‘Bash on Ubuntu on Windows’
was brought to you by efforts of Microsoft and Canonical.
This subsystem allows users to run **native** linux binaries in Windows 10
without using of virtual machines or recompilations.

**Required** 64-bit version of Windows 10 Anniversary Update build 14316 or later!

![Bash on Windows in ConEmu](/img/BashOnWindows.png)



## Contents  {#contents}

* [Run WSL2 in ConEmu](#wsl2)
* [WSL installation](#wsl-install)
  * [Good places to start](#start)
  * [TLDR: WSL Installation](#TLDR)
* [Some techinfo](#techinfo)
* [Preferred way to run WSL](#connector)
  * [Change startup shell in WSL](#wsl-shell)
  * [Change drives mount point in WSL](#wsl-mnt)
  * [Start WSL in Unix home directory (WSL v2)](#wsl-home)
  * [Start WSL in Unix home directory (connector)](#wsl-home-connector)
  * [Support different WSL distributions](#wsl-distro)
* [Get arrows working in ConEmu](#arrows)
  * [Solution 1: Default task {bash}](#arrows-sol-1)
  * [Solution 2: StatusBar's Terminal modes](#arrows-sol-2)
* [WSLBridge: Get 24-bit colors working in ConEmu](#wslbridge)
  * [TLDR: Just run wslbridge](#TLDR2)
  * [How to get 24-bit colors working](#true-color-example)
  * [WSLBridge manual installation and Task contents](#wslbridge-task)
  * [Other versions of WSLBridge](#wslbridge-32)



## Run WSL2 in ConEmu  {#wsl2}

After update of WSL to version 2 you could observe an error on tab startup. That happens because
ConEmu utilized third-party [wslbridge](#wslbridge-task) to implement [PTY terminal](CygwinMsys.html).

~~~
wslbridge error: failed to start backend process
note: backend error output: -v: -c: line 0: unexpected EOF while looking for matching `''
-v: -c: line 1: syntax error: unexpected end of file
~~~

There are two possible solutions meanwhile.

### Run native wsl.exe in ConEmu  {#wsl-native}

Change your `{bash}` [Task](Tasks.html) contents to run wsl without bridge. For the moment this is preferred solution.
And in future this task should automatically have PTY capabilities (work in progress).

~~~
wsl.exe -cur_console:pm:/mnt
~~~

### Run wslbridge2 in ConEmu  {#wslbridge2}

If you want to have PTY terminal now you could try wslbridge2. Please read the description
[how to install wslbridge2](https://github.com/Maximus5/ConEmu/issues/1930#issuecomment-640120326).

### Run WSL v1 via connector  {#connector}

**This variant does not work properly with latest WSL version.**

Ryan Prichard has created [wslbridge](https://github.com/rprichard/wslbridge)
which allows anyone to run WSL in any POSIX enabled terminal like mintty
or [ConEmu cygwin/msys connector](CygwinMsysConnector.html).

Note. If you don't use connector/wslbridge you may observe bugs with Bash.

The required files of wslbridge and connector are shipped with ConEmu since
build [170730](/blog/2017/07/30/Build-170730.html).
Just download and install latest [Preview or Alpha](VersionComparison.html) version
and be sure that your [Tasks](Tasks.html) are [updated](DefaultTasks.html#add-default-tasks).

You `{Bash::bash}` task command shall be something like:

~~~
set "PATH=%ConEmuBaseDirShort%\wsl;%PATH%" & %ConEmuBaseDirShort%\conemu-cyg-64.exe --wsl -cur_console:pm:/mnt
~~~

And its task parameters:

~~~
/dir %CD% /icon "%USERPROFILE%\AppData\Local\lxss\bash.ico"
~~~


### Tl;dr: Get arrows working in ConEmu  {#arrows-tldr}

Without [Connector](CygwinMsysConnector.html) it's not possible yet to implement [PTY terminal](CygwinMsys.html).
And Windows API has only one flag `ENABLE_VIRTUAL_TERMINAL_INPUT` which does not show if console expects AppKeys or not.

With WSL version 2 the workarounds are:

* Use switch `-new_console:p5` to enable or `-new_console:p1` to disable ‘AppKeys’.
* Use StatusBar's Terminal modes to change ‘AppKeys’ manually on the fly.

[More information is below](#arrows).

{% include in_article.html %}



## WSL installation  {#wsl-install}

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
and linux applications communicate with [conhost](ConsoleApplication.html#conhost)
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




### Change startup shell in WSL  {#wsl-shell}

ConEmu starts WSL via [wslbridge](https://github.com/rprichard/wslbridge) to be able
render ANSI internally. That means if you type additional arguments after `--wsl`
this line (with the exception of [-cur_console](NewConsole.html)) is passed to
wslbridge intact. So the `-t` switch of wslbridge is required.

If you want to start your own shell, for example `fish -l`, append the `-t fish -l`
at the end of default `{Bash::bash}` task command.

~~~
set "PATH=%ConEmuBaseDirShort%\wsl;%PATH%" & %ConEmuBaseDirShort%\conemu-cyg-64.exe --wsl -cur_console:pnm:/mnt -t fish -l
~~~


### Change drives mount point in WSL  {#wsl-mnt}

[Configuration file](https://blogs.msdn.microsoft.com/commandline/2018/02/07/automatically-configuring-wsl/)
`/etc/wsl.conf` may be used to change drives mount point (default is `/mnt`).
So you may access your files like `/c/path` instead of default `/mnt/c/path`.

* If wslbridge fails to start, update ConEmu (preferred) or update wslbridge binaries
  from [this issue](https://github.com/Maximus5/ConEmu/issues/1538#issuecomment-386838630).
* To get proper conversion of Windows paths during Paste change `-new_console:m:/mnt` to `-new_console:m:""`.


### Start WSL in Unix home directory (WSL v2)  {#wsl-home}

Add after `wsl.exe` the `~` (tilda) without any quotes:

~~~
wsl.exe -cur_console:pm:/mnt ~
~~~


### Start WSL in Unix home directory (Connector)  {#wsl-home-connector}

Add after `--wsl` the `-C~` switch:

~~~
set "PATH=%ConEmuBaseDirShort%\wsl;%PATH%" & %ConEmuBaseDirShort%\conemu-cyg-64.exe --wsl -C~ -cur_console:pm:/mnt
~~~


### Support different WSL distributions  {#wsl-distro}

If you want to install and run different WSL distributions simultaneously (Debian, Ubuntu, openSUSE, etc.)
do the following steps:

1. Run desired Linux distribution at least once from Windows Start menu.
2. Find the your distribution in the registry under `HKCU\Software\Microsoft\Windows\CurrentVersion\Lxss`.
   In my case, Debian distro GUID (registry key) is `{ad038902-973f-4baf-92b7-4d3ef9604ea5}` and DistributionName is just `Debian`.
3. Modify [task](Tasks.html) for your WSL by inserting after `--wsl` switch or directly after `wsl.exe` your distribution identifier.
   For WSL2 it's a switch `--distribution DistributionName` and for old WSL1 it's a `--distro-guid={DISTRO-GUID}`. Without quotes.
   So, the task to run Debian distro on my machine looks like:

~~~
wsl.exe --distribution Debian -cur_console:pm:/mnt
~~~

or

~~~
set "PATH=%ConEmuBaseDirShort%\wsl;%PATH%" & %ConEmuBaseDirShort%\conemu-cyg-64.exe --wsl --distro-guid={1f6b2238-ec8d-4066-8e2b-ee31ce97ad3f} -cur_console:pm:/mnt
~~~

Run from started prompt the `cat /etc/issue` to check the distribution.

If it's not working for any reason, read about proper switches `wsl.exe --?` and validate the actual command line of `wsl.exe`
using [Process Explorer](ProcessExplorer.html).



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
   Also, you have to call [Add/refresh default tasks...](SettingsTasks.html#id2632)
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
and change ‘AppKeys’ mode.

You may change Task startup defaults with [-new_console](https://conemu.github.io/en/NewConsole.html#syntax) switch.
Just add to your [Task](Tasks.html) command:

* `-new_console:p5` to enable ‘XTerm’ *and* ‘AppKeys’;
* `-new_console:p1` to enable ‘XTerm’ *without* ‘AppKeys’.




## Get 24-bit colors working in ConEmu  {#wslbridge}

As described in [Preferred way to run WSL](#connector), wslbridge and connector
are shipped with ConEmu since build [170730](/blog/2017/07/30/Build-170730.html).



### TLDR: Just run wslbridge  {#TLDR2}

Well, you may run `wsl-con.cmd` which starts wslbridge in new ConEmu tab for you.


### How to get 24-bit colors working  {#true-color-example}

You need just few more files:

1) `256colors2.pl` download it from [./256colors2.pl]

2) `wsl-con.bat` to start new tab in ConEmu

~~~
@echo off
if "%~1" == "-run" goto run
ConEmuC -c "%~0" -run "-new_console:C:%LOCALAPPDATA%\lxss\bash.ico" "-new_console:d:%~dp0" -new_console:np
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


### WSLBridge installation and Task contents  {#wslbridge-task}

To run wslbridge in ConEmu, just do simple steps:

0. Install ‘Windows Subsystem for Linux (WSL)’ and some Linux distro (e.g. Ubuntu)
   from Microsoft Store.
1. Download latest [ConEmu](https://www.fosshub.com/ConEmu.html) and install it.
   * If you run [Installer](VersionComparison.html#installer) ensure that feature ‘WSL support’
     and ‘cygwin/msys connector’ are enabled.
   * Required files `wslbridge.exe`, `cygwin1.dll`, `wslbridge-backend` and `conemu-cyg-64.exe`
     should be installed into `%ConEmuBaseDir%\wsl` and `%ConEmuBaseDir%` folders.
2. Recreate [default tasks](Tasks.html#add-default-tasks), the Task `{Bash::bash}` should appear.

Task **command**:
~~~
set "PATH=%ConEmuBaseDirShort%\wsl;%PATH%" & %ConEmuBaseDirShort%\conemu-cyg-64.exe --wsl -cur_console:pm:/mnt
~~~

Task parameters (icon):
~~~
-icon "%ProgramW6432%\WindowsApps\CanonicalGroupLimited.UbuntuonWindows_1604.2017.922.0_x64__79rhkp1fndgsc\images\icon.ico"
~~~

To pass environment variable to WSL, you have two options:

1) Forward it from host system:
~~~
set "PATH=%ConEmuBaseDirShort%\wsl;%PATH%" & %ConEmuBaseDirShort%\conemu-cyg-64.exe --wsl -eHOST_VARIABLE -cur_console:pm:/mnt
~~~

2) Define it directly to wslbridge:
~~~
set "PATH=%ConEmuBaseDirShort%\wsl;%PATH%" & %ConEmuBaseDirShort%\conemu-cyg-64.exe --wsl -eDISPLAY=:0 -cur_console:pm:/mnt
~~~

Task can contain initializing commands by evaluating a passed environment parameter.
The method itself is detailed [here](CygwinStartCmd.html#bashrc).
You can use this in case you would like to have different Tasks corresponding to different environment and the the environment variable setting is not enough.

After following the linked **.bashrc** guide, you can pass different initializer commands to WSL for each Task.

~~~
set "PATH=%ConEmuBaseDirShort%\wsl;%PATH%" & %ConEmuBaseDirShort%\conemu-cyg-64.exe --wsl -eSTARTUP_CMD='. $HOME/sdk/environment-setup' -cur_console:pm:/mnt
~~~


### Other versions of WSLBridge  {#wslbridge-32}

If 64-bit version is not working for same reasons, you may try other WSLBridge versions:
32-bit cygwin or 32/64-bit msys2.

1. Download [desired wslbridge release](https://github.com/rprichard/wslbridge/releases).
2. Obtain required dlls:
   * either `cygwin1.dll` from [https://cygwin.com/](https://cygwin.com)
   * or `msys-2.0.dll` from [http://www.msys2.org/](http://www.msys2.org/)
3. Collect all files in some folder, for example: `C:\Tools\ConEmu\wsl`.
4. Create the task `{WSL::Bridge}`.

If you selected cygwin-32, so the Task command would be:
~~~
C:\Tools\ConEmu\ConEmu\conemu-cyg-32.exe /cygdrive/c/Tools/ConEmu/wsl/wslbridge.exe -t -cur_console:pm:/mnt
~~~
