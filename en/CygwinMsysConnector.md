---
redirect_from:
 - /ru/CygwinMsysConnector.html

title: "ConEmu | cygwin/msys terminal connector"

description: "An attempt to create the symbiont of POSIX enabled pty
  and WinAPI full-featured terminal."

breadcrumbs:
 - url: TableOfContents.html#cygwin-and-msys
   title: Cygwin and Msys

readalso:
 - url: CygwinMsys.html
   title: "Cygwin and Msys"
 - url: Xterm256Colors.html
   title: "Xterm-256 Colors"
 - url: CygwinAnsi.html
   title: Cygwin and Ansi
 - url: AnsiEscapeCodes.html
   title: "ANSI sequences supported by ConEmu"
---

# cygwin/msys terminal connector

This helper tool is an attempt to create the symbiont
of POSIX enabled pty and WinAPI full-featured terminal.

It supports:

* [Cygwin](https://www.cygwin.com/): `conemu-cyg-32.exe` and `conemu-cyg-64.exe`;
* [MSYS 1.0](http://www.mingw.org/wiki/msys): `conemu-msys-32.exe`;
* [MSYS 2.0](https://msys2.github.io/) and [git for Windows](https://git-for-windows.github.io/): `conemu-msys2-32.exe` and `conemu-msys2-64.exe`.
* [Windows subsystem for Linux](wsl.html): `conemu-cyg-64.exe` with [wslbridge](wsl.html#wslbridge).

Since [ConEmu build 170705](/blog/2017/07/05/Build-170705.html) connector binaries
are distributed with [ConEmu 7z-pack and installer](VersionComparison.html).


* [Screenshots](#screenshots)
* [How to use connector](#how-to-use)
  * [WARNING](#warning)
* [Examples](#examples)
  * [Cygwin 64 bash](#cygwin64-shortcut)
  * [Bash On Windows (WSL)](#wslbridge)
  * [Want to run specific shell or pass arguments?](#specific-shell)
* [Supported switches](#switches)



## Screenshots  {#screenshots}

#### Just a `cat AnsiColors256.ans` from bash
![cygwin](/img/cygwin-256colors.png)



## How to use connector  {#how-to-use}

Since [ConEmu build 170705](/blog/2017/07/05/Build-170705.html) connector binaries
is included in [ConEmu 7z-pack and installer](VersionComparison.html).

Default tasks are created for **new** configurations: `{Bash::bash}`, `{Bash::Git bash}`,
`{Bash::CygWin bash x64}`, etc.

If you already have these tasks, press [Add/refresh default tasks](Tasks.html#add-default-tasks)
to update existing default tasks contents.



### WARNING  {#warning}

* **Do not** run connector from cygwin or msys shell!
  Different cygwin/msys layers will cause problems!
* Connector might be started as [ROOT PROCESS](https://conemu.github.io/en/RootProcess.html)
  or from some native shell (like cmd.exe) already started in ConEmu.



## Examples  {#examples}

Here are few examples to clarify command changes.

**NB** Following examples are one-line commands, they are splitted by lines just to simplification.


### Cygwin 64 bash  {#cygwin64-shortcut}

Supposing cygwin is installed into `C:\cygwin64`.

```
set CHERE_INVOKING=1
 & set "PATH=C:\cygwin64\bin;%PATH%"
 & %ConEmuBaseDirShort%\conemu-cyg-64.exe /usr/bin/bash.exe --login -i -new_console:p:C:"C:\cygwin64\Cygwin.ico"
```

* `CHERE_INVOKING=1` tells cygwin shell don't `CD` to user profile, but use ConEmu working directory.
* `set "PATH=C:\cygwin64\bin;%PATH%"` forces proper `cygwin1.dll` required by `conemu-cyg-64.exe`.
* `/usr/bin/bash.exe --login -i` is the shell with arguments, you may use any other shell like `zsh`, `fish`, etc.
* `-new_console:p:C:"C:\cygwin64\Cygwin.ico"` is [ConEmu special switch](NewConsole.html).


### Bash On Windows (WSL)  {#wslbridge}

On Windows 10 with installed Windows Subsystem for Linux.

```
set "PATH=%ConEmuBaseDirShort%\wsl;%PATH%" & %ConEmuBaseDirShort%\conemu-cyg-64.exe --wsl -cur_console:pm:/mnt
```



### Want to run specific shell or pass arguments?  {#specific-shell}

Let's run `/usr/bin/zsh -l -i` in Cygwin x32,
which was installed in `C:\Cygwin`.
Just create or change the [Tasks](Tasks.html):

~~~
set CHERE_INVOKING=1 & C:\Cygwin\bin\conemu-cyg-32.exe /usr/bin/zsh -l -i
~~~


## Supported switches  {#switches}
You may run `conemu-cyg-32.exe --help` to learn about options.

~~~
ConEmu cygwin/msys connector version 0.6
Usage: conemu-cyg-32 [switches] [- | shell [shell switches]]
  -?, -h, --help   this help
  -d, --dir <dir>  chdir to `dir` before starting shell
                   forces `set CHERE_INVOKING=1`
  -t <new-term>    forces `set TERM=new-term`
  --log [<dir>]    write console IN and OUT to files in `dir` folder
                   use current folder if <dir> is not specified
  --debug          wait for debugger for 60 seconds
  --environ        print environment on startup
  --isatty         do isatty checks and print pts names
  --keys           read conin and print bare input
  --shlvl          forces `set SHLVL=1` to avoid terminal reset on exit
  --verbose        additional information during startup
  --version        print version of this tool
  --wsl            run wslbridge to start Bash on Ubuntu on Windows 10
~~~
