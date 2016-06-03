---
redirect_from:
 - /ru/BashOnWindows.html

title: "ConEmu | Bash on Windows in ConEmu"

description: "Some hints about setting up Bash on Windows in ConEmu"

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks
---

# Using Bash on Windows

At first, official place for bugs of ‘Windows Subsystem for Linux’ is:
<https://github.com/Microsoft/BashOnWindows/issues/>.



## Get arrows working in ConEmu

This solution is **only for [Bash on Windows (WSL)](https://github.com/Microsoft/BashOnWindows)**!
It does not rely to [Cygwin, MSYS](CygwinMsys.html) or [Git-for-Windows](GitForWindows.html)!

Due to the bug [BashOnWindows#111](https://github.com/Microsoft/BashOnWindows/issues/111)
arrows are not working if you start `bash.exe` in ConEmu without proper arguments.
More details in tickets
[BashOnWindows#111](https://github.com/Microsoft/BashOnWindows/issues/111)
and
[ConEmu#629](https://github.com/Maximus5/ConEmu/issues/629).

### Solution

If you run ConEmu first time, or use [-basic](ConEmuArgs.html) switch,
or even call [Add default tasks...](SettingsTasks.html#id2632)
you'll get proper task for ‘Bash on Windows’

~~~
%windir%\system32\bash.exe -cur_console:p
~~~

This is the only way to tell ConEmu, that this executable is **so special**,
that **native** Windows console application, which obviously `bash.exe` is,
requires **Linux Escape sequences** instead of Windows native keyboard events.
