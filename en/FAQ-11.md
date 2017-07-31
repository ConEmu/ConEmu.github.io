---
title: ConEmu | FAQ - Part 11

description: Frequenly asked user questions about ConEmu usage

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu

redirect_from: /ru/FAQ-11.html
---

# ConEmu automation  {#q-11-automation}

{% include faq_disclaimer_en.md %}

* [Q. How to distinguish different ConEmu instances (windows)?](FAQ-11.html#q-11-1)







#### Q. How to distinguish different ConEmu instances (windows)?   {#q-11-1}

**A.** If you need to have **different appearance or behavior** of the ConEmu installation,
you may use switch [-config "name"](ConEmuArgs.html) to use different named configurations.
So you may store several configurations in one xml file. Alternatively you may specify
certain xml file using switch [-LoadCfgFile "path\to\file.xml"](ConEmuArgs.html).
Just create new shortcut on your Desktop or run ConEmu from script.

The following will start **new** ConEmu window using named config `git maintenance`
and start the tab running script `C:\sources\maintain.cmd`.

~~~
ConEmu64.exe -config "git maintenance" -nosingle -run "C:\sources\maintain.cmd"
~~~


**A.** If you need to popup different windows using different hotkeys you may create
several shortcuts on the Desktop and choose [hotkey](/img/DesktopShortcut.png) for each.

For example, choose hotkey `Ctrl-Alt-1` for the command:

~~~
ConEmu64.exe -nosingle -run {bash}
~~~

And hotkey `Ctrl-Alt-2` for the command:

~~~
ConEmu64.exe -nosingle -run {cmd}
~~~

When you run ConEmu from these shortcuts you may activate windows using selected hotkeys
`Ctrl-Alt-1` and `Ctrl-Alt-2`.


**A.** If you need to distinguish two ConEmu windows programmatically, from ahk, python
or powershell scripts, or even from third-party tools, you have two possibilities:

*1)* Use [-title "Window name"](ConEmuArgs.html) switch to explicitly set window title
of **new** ConEmu instance. The example below starts **new** ConEmu window with
title `My server` and ssh to `your.server.com` inside. Does not matter if you run
another tab, or several tabs from task, the ConEmu window title remains `My server`.
So you may rely on the title for selecting the window with class name `VirtualConsoleClass`.

~~~
ConEmu64.exe -nosingle -title "My server" -run ssh your.server.com
~~~


*2)* Windows 7 introduced [AppUserModelID](https://msdn.microsoft.com/en-us/library/windows/desktop/dd378459.aspx).
ConEmu uses executable path name and some switches (like `-config`, `-loadcfgfile`, `-quake`)
to create a hash to form AppID, which you may see in the [About / SysInfo](AboutDialog.html#About-SysInfo.png).
Current version shows `1d5372066082f23b41ba6aa278e56e9d::163`. The trailing `::163` depicts ConEmu internal
protocol version which may (and most probably would) be changed in the future. The hash itself is expected
to be unchanged. You may query the ID from running ConEmu process using Windows API function
[GetApplicationUserModelId](https://msdn.microsoft.com/en-us/library/windows/desktop/hh920917.aspx).
