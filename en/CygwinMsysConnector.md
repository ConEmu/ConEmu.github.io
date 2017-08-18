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

This helper tool is an experimental attempt to create the symbiont
of POSIX enabled pty and WinAPI full-featured terminal.

It supports:

* [Cygwin](https://www.cygwin.com/): `conemu-cyg-32.exe` and `conemu-cyg-64.exe`;
* [MSYS 1.0](http://www.mingw.org/wiki/msys): `conemu-msys-32.exe`;
* [MSYS 2.0](https://msys2.github.io/): `conemu-msys2-32.exe` and `conemu-msys2-64.exe`.

Please note, status of this plugin is ‘Experimental’.


* [Screenshots](#screenshots)
* [How to use connector](#how-to-use)
  * [WARNING](#warning)
* [Examples](#examples)
  * [MSYS2 x64 bash example (desktop shortcut)](#msys2-shortcut)
  * [MSYS2 x64 bash example (Task)](#msys2-task)
  * [Want to run specific shell or pass arguments?](#specific-shell)
* [Supported switches](#switches)



## Screenshots  {#screenshots}

#### Just a `cat AnsiColors256.ans` from bash
![cygwin](/img/cygwin-256colors.png)



## How to use connector  {#how-to-use}

**Please note**, in future installation steps may be changed,
or even connector files may be integrated into ConEmu distro
and starting POSIX enabled terminal will be automatic.

1. Connector is constantly changing, so first ensure that you are using
   <strong><a href="{{ site.fosshub }}" rel="nofollow">the latest available ConEmu version</a></strong>!
2. Download latest [release of connector](https://github.com/Maximus5/cygwin-connector/releases).
3. Choose appropriate binary from downloaded 7z archive, e.g. `conemu-cyg-32.exe` for 32-bit Cygwin.
4. Unpack this file to your bin folder, e.g. `C:/Cygwin/bin` (where `sh.exe` is located).
5. Run connector in ConEmu tab instead of shell.
6. Get profit or [report a bug](Issues.html).

### WARNING  {#warning}

* **Do not** run connector from cygwin or msys shell! Different cygwin/msys layers will cause problems!
* Connector might be started as [ROOT PROCESS](https://conemu.github.io/en/RootProcess.html) or from some native shell (like cmd.exe) already started in ConEmu.



## Examples  {#examples}

Here are few examples to clarify command changes.


### MSYS2 x64 bash example (desktop shortcut)  {#msys2-shortcut}
For example, you run your MSYS2 x64 bash from shortcut from desktop (old style):

~~~
ConEmu64.exe -run set MSYSTEM=MINGW64 & c:\tools\msys64\usr\bin\bash.exe --login -i
~~~

Just change it to:

~~~
ConEmu64.exe -run set MSYSTEM=MINGW64 & conemu-msys2-64.exe
~~~

### MSYS2 x64 bash example (Task)  {#msys2-task}
Same with [Tasks](Tasks.html):

~~~
set MSYSTEM=MINGW64 & c:\tools\msys64\usr\bin\bash.exe --login -i
~~~

Change it to:

~~~
set MSYSTEM=MINGW64 & conemu-msys2-64.exe
~~~


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
  -h, --help       this help
  -d, --dir <dir>  chdir to `dir` before starting shell
                   forces `set CHERE_INVOKING=1`
  -t <new-term>    forces `set TERM=new-term`
  --logs [<dir>]   dump all conout to log file
  --debug          wait for debugger for 60 seconds
  --environ        print environment on startup
  --isatty         do isatty checks and print pts names
  --keys           read conin and print bare input
  --shlvl          forces `set SHLVL=1` to avoid terminal reset on exit
  --verbose        additional information during startup
  --version        print version of this tool
~~~
