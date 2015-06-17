---
pagelang: en

title: "ConEmu | Fast Configuration Dialog"

description: "ConEmu first start, Fast Configuration Dialog"

breadcrumbs:
 - url: TableOfContents.html#settings
   title: Settings

readalso:
 - url: Settings.html#screenshots
   title: "Settings Dialog Screenshots"
 - url: Tasks.html
   title: "Easy Way to Start Your Shells with ‘Tasks’"
 - url: ConEmuFAQ.html
   title: "Frequently Asked Questions"
 - url: TableOfContents.html
   title: "Documentation"

otherlang:
   eng: /en/SettingsFast.html
   rus: /ru/SettingsFast.html
---

# ConEmu first start

The goal of ConEmu project is to bring into Windows world
a handy and reliable terminal application, in other words,
a better console window.

[Installation](Installation.html) is easy and takes less than a minute,
and you may run ConEmu at once by clicking desktop shortcut created by installer
or use any other preferable way to run `ConEmu.exe` or `ConEmu64.exe`.
There is no difference between [x64 and x86](VersionComparison.html#x64-or-x86) versions of GUI.

ConEmu interface is minimalistic and intuitive: [console area](VirtualConsole.html),
[tab bar](TabBar.html) with [search field](SearchBar.html)
and [tool buttons](ToolBar.html), [status bar](StatusBar.html).
You may immediately start to use terminal, running
commands in [command-line interpreters (shells)](TerminalVsShell.html)
like `cmd`, `PowerShell`, `bash`, `python` and others.

[Settings dialog](Settings.html) has many pages and dozens of options
allowing to tune terminal for almost any needs,
however the option amount may overhelm new user.

So at the first start ConEmu shows ‘Fast Configuration Dialog’
with minimal set of options.
These and other options you may change later in the full [Settings dialog](Settings.html).


* [Dialog ‘ConEmu Fast Configuration’](#fast-configuration)
  * [Settings storage location](#settings-storage)
  * [Startup task or shell](#startup-task)
  * [Preferred color scheme](#color-scheme)
  * [Single instance mode](#single-instance)
  * [Quake-style](#quake-style)
  * [Show-hide hotkey](#show-hide-hotkey)
  * [Install keyboard hooks](#keyboard-hooks)
  * [Inject ConEmuHk.dll](#inject-conemuhk)
  * [Enable automatic updates](#auto-update)
  * [Disable ConIme.exe autorun (Vista only)](#disable-conime)
* [After ‘OK’ click](#after-ok)
* [Thorough configuration in Settings dialog](#open-settings)
* [Read also](#read-also)


<h2 id="fast-configuration"> Dialog ‘ConEmu Fast Configuration’ </h2>

Well, when you start ConEmu **first** time you would most probably see
‘*Fast configuration dialog*’.

![ConEmu's Fast configuration dialog](/img/Settings-Fast.png)

You may choose here
preferable [command line interpreter (shell)](TerminalVsShell.html),
main window visual styles,
[automatic update options](SettingsUpdate.html)...

Choose what do you want to allow ConEmu, because some functions
(like keyboard hooks, process injections, internet access)
may raise [False Alarms](FalseAlarms.html) in some paranoid antiviral programs.

**ConEmu do not contain any trojans, malware or viruses**,
[source code](Source.html) is open, anyone may check it.
However, you may disable these function, though disabling is not recommended.



<h3 id="settings-storage"> Settings storage location </h3>

ConEmu may store settings in Windows registry or in xml-file.

By default ConEmu suggest to store settings within
[ConEmu.xml](ConEmuXml.html)
in the program's folder if it is not write-protected,
or in the `%APPDATA%` folder if ConEmu was installed
for example in `C:\Program Files\`.

If ConEmu was installed for example in the `C:\ConEmu\` folder it suggests following:

* HKEY_CURRENT_USER\Software\ConEmu
* %APPDATA%\ConEmu.xml
* C:\ConEmu\ConEmu\ConEmu.xml
* **C:\ConEmu\ConEmu.xml**

**Note**. In old Windows 2000 current build may have problems with xml-storage,
so the ‘Registry’ is suggested for this old OS.

Read more about settings storage [here](ConEmuXml.html).


<h3 id="startup-task"> Startup task or shell </h3>

[Tasks](Tasks.html) are kind of predefined command lines
to run [shells](TerminalVsShell.html) or [ChildGui](ChildGui.html)
in ConEmu's [tabs](TabBar.html) and [splittings](SplitScreen.html).
By default ConEmu detects many applications and creates predefined tasks for them.
And you may set up any tasks later via [Settings](SettingsTasks.html).

Just choose your favourite shell from the drop down ‘Startup task or shell’.

But you may choose here not only ConEmu [task](Tasks.html)
but any desired program, just enter here full path to its
[program](https://wikipedia.org/wiki/Executable)
with arguments.


<h3 id="color-scheme"> Preferred color scheme </h3>
<h3 id="single-instance"> Single instance mode </h3>
<h3 id="quake-style"> Quake-style </h3>
<h3 id="show-hide-hotkey"> Show-hide hotkey </h3>

<h3 id="keyboard-hooks"> Install keyboard hooks </h3>

This option is required for ability to process certain
keyboard hotkeys.
For example, Windows 7 utilizes Win+*Number* (Win+*1*, Win+*2*, etc.)
for switching programs on the TaskBar.
But these hotkeys may be handy to switch [tabs](TabBar.html) in the ConEmu window.
Enabling ‘Install keyboard hooks’ does not mean that ConEmu will block
all system hotkeys,
but instead that you will be able to choose
what hotkeys you want to use in ConEmu.
For example checkboxes ‘Win+Number - activates console’,
‘Win+Tab - switch consoles (Tabs)’ and so on.
Take a look at [Keys & Macro](SettingsHotkeys.html) in the [Settings dialog](Settings.html).


<h3 id="inject-conemuhk"> Inject ConEmuHk.dll into processes, started in ConEmu tabs </h3>

Injecting hooks is required for many features.
For example processing switch [-new_console](NewConsole.html),
[ANSI](AnsiEscapeCodes.html), [DosBox](DosBox.html),
logging console output to file, [ChildGui](ChildGui.html) etc.
Also they are required to avoid some problems like [crashes](MicrosoftBugs.html)
or ‘appearing’ graphical dialogs and popup menus under ConEmu window.
So the dynamic library ConEmuHk.dll (or ConEmuHk64.dll for 64-bit programs)
is injected into processes running inside ConEmu window.



<h3 id="auto-update"> Enable automatic updates </h3>

As is. This allows to do automatic update the ConEmu installation from internet.
Later you may tune up updating settings on the
[Update](SettingsUpdate.html) settings page.
ConEmu do not do unauthorized changes, it will ask your permission
before starting update process.


<h3 id="disable-conime"> Disable ConIme.exe autorun (Vista only) </h3>

Windows Vista users may see this checkbox.
Why and its purpose you may see in [FAQ](ConEmuFAQ.html#Windows_Vista).


<h3 id="after-ok"> After ‘OK’ click </h3>

ConEmu will start in its tab the task or shell you have selected
in the [Startup task or shell](#startup-task) field.


<h2 id="open-settings"> Thorough configuration in Settings dialog </h2>

[How to open full Settings dialog](Settings.html#Settings_dialog)
