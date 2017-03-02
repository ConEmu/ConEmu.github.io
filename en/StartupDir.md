---
redirect_from: /ru/StartupDir.html

title: "ConEmu | Startup Directory"

breadcrumbs:
 - url: TableOfContents.html#launch-apps
   title: Launch Apps

readalso:
 - url: CygwinStartDir.html
   title: Cygwin Startup Directory
---

# ConEmu Startup Directory

When you start ConEmu and do not specify the directory
where you want to start it, the default (startup) directory
will be `%USERPROFILE%`.

Why? There are reasons.

* It is almost useless to start your shell in the ConEmu
  installation folder (you will get that if you run ConEmu
  from shortcut or Explorer window).
* It may be dangerous to start your shell in the `system32`
  folder (you will get that if you run something from Win+R).


## Force use of the specific directory  {#force}

If you want to force ConEmu to start using some specific
default directory there are options.

* Force inherit current directory of the parent process.
  Just add `-here` switch to ConEmu's [command line](ConEmuArgs.html).
  This switch is used in [ConEmu's Here or Inside](SettingsIntegration.html).
* ConEmu's shortcut properties.
  You may change ‘Working directory’ field.
* Task parameters. You may add `-dir ...` switch.
  This may be overrided by ConEmu's [command line](ConEmuArgs.html).
* ConEmu's [command line](ConEmuArgs.html) (or shortcut).
  You may add `-dir ...` switch.
* [-new_console:d:...](NewConsole.html) switch in the
  task or specified command.


## Shell related notes  {#shells}

Even if ConEmu sets a directory as startup location for [new tab or split](LaunchNewTab.html)
some [shells](TerminalVsShell.html) may ignore it.

[cygwin](CygwinStartCmd.html) always starts (by default) in user's home directory,
Far Manager may restore last or saved panel directories,
and so on...

The workaround is to tell your [console application](ConsoleApplication.html)
to use specified directory instead of default one. Here are some hints...

Refer to your application manual to find proper way.

Few examples below.

### Cygwin  {#cygwin}

Use `CHERE_INVOKING` environment variable for [cygwin shells](CygwinStartDir.html). Example:
~~~
set CHERE_INVOKING=1 & sh.exe -l -i
~~~

### Far Manager  {#far}
Use `!ConEmuWorkDir!` [environment variable](ConEmuEnvironment.html). Example:
~~~
Far.exe "!ConEmuWorkDir!"
~~~

