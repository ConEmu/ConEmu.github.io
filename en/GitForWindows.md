---
redirect_from: /ru/GitForWindows.html

title: "ConEmu | Using Git for Windows"

description: "Some hints about setting up Git for Windows in ConEmu"

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks

readalso:
 - url: SolarizedColors.html
   title: Solarized color scheme
---

# Using Git for Windows

Native and full-featured set of [Git SCM](http://git-scm.com/) tools.

* [Version 2.x.x](https://git-for-windows.github.io/)
* [Version 1.9.5 (deprecated)](https://github.com/msysgit/msysgit/releases)



## Colorizing fix for Solarized color scheme  {#Solarized}

Fix for [Solarized color scheme](SolarizedColors.html).

~~~
git config --global color.diff.new "green bold"
git config --global color.status.updated "green bold"
git config --global color.branch.current "green bold"
~~~

Using Far Manager as editor (commit texts). I'm using
[FarRun](https://github.com/Maximus5/FarPlugins/tree/master/FarRun/Release)
to simplify call of `far.exe`.

~~~
git config --global core.editor "farrun -e1:1"
~~~



## cygwin_exception in less.exe  {#cygwin-exception}

When updated my git to `PortableGit-2.3.5.8-dev-preview-32-bit.7z.exe` (obsolete build),
bumped into strange exception.

~~~
2 [main] less 3872 cygwin_exception::open_stackdumpfile: Dumping stack trace to less.exe.stackdump
~~~

The exception actually happens at `msys-ncursesw6.dll!664465b1`.

After some investigations found how to fix that.
The problem was in `TERM` environment variable, it was set to `msys`.
After removing that variable (clearing it) git's less begins to work normally.
