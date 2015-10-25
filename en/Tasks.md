---
title: "ConEmu | Tasks"

description: "ConEmu's Tasks are simple way to store oft-used commands
  and start several shells in tabs or splits."

breadcrumbs:
 - url: TableOfContents.html#launch-apps
   title: Launch Apps

readalso:
 - url: NewConsole.html
   title: "Using -new_console switch to change palette, icon, background image, etc."

otherlang:
   eng: /en/Tasks.html
   rus: /ru/Tasks.html
---

# ConEmu's Tasks

ConEmu's ‘Tasks’ are used to store predefined commands
or [shell's](TerminalVsShell.html) command lines.
Run them anytime later by name or hotkey.

Also it's a simple way to start several shells
in [tabs](TabBar.html) or [splits](SplitScreen.html).

![ConEmu's tasks dropdown](/img/ConEmuStartTask.png "Start task dropdown menu")

Tasks may be configured in the [‘Settings’ dialog](SettingsTasks.html).


* [Tasks in details](#about-tasks)
  * [A little from Settings](#from-settings)
* [Creating new task](#create-new-task)
  * [Where you may get required information?](#find-required-information)
  * [If there is no shortcut for that shell](#if-no-shell-shortcut)



## Tasks in details  {#about-tasks}

ConEmu-Maximus5 is a terminal or a kind of container
for whatever programs you might want to run inside it:
[console applications](ConsoleApplication.html)
or simple programs with self graphical interface
([ChildGui](ChildGui.html)).
They are typically a [shells](TerminalVsShell.html)
like cmd.exe, bash.exe, powershell.exe,
editors like notepad++ or even another terminals
like mintty.exe or PuTTY.exe.

And ConEmu has [tabs](TabBar.html) and [splittings](SplitScreen.html)
(à la screen/tmux, but handled at the GUI level).
So you can have different programs running in each of those ‘slots’.

A ‘task’ is an instruction what and how ConEmu must run in ‘slots’.

* Each ‘task’ has a ‘name’;
* one or **several** actual commands to run;
* ‘hotkey’ to run task which is available when ConEmu has focus;
* some optional switches like startup directory or icon.

| Value    | Example |
|:---------|:--------|
| task name | `{Git Bash}`, `{WinSDK v7.0}`, ... |
| name or full path to [program](https://wikipedia.org/wiki/Executable) | `bash.exe` |
| program arguments | `--login -i` |
| [-new_console](NewConsole.html) switch(es) | `-new_console:t:"Bash" -new_console:d:"C:\Projects"` |
| several [tabs](TabBar.html) or [splits](SplitScreen.html) | `cmd` <br/> `powershell -new_console:sV` |

When you need to [create a tab](LaunchNewTab.html)
you may type may be long and full command line like

```
set "FARHOME=" & C:\Far\Far.exe /w /x /p%ConEmuDir%\Plugins\ConEmu;%FARHOME%\Plugins;C:\Far\Plugins.My
```

Or just run task named `{Far}`.

At last, Tasks are the only easy way to run several [tabs](TabBar.html)
or preconfigured [splits](SplitScreen.html) at once.



### A little from Settings   {#from-settings}

![ConEmu settings, Tasks page](/img/Settings-Tasks.png "ConEmu settings, Tasks page")

Here you can configure a list of common tasks.
In fact, this is an alias to run one or more applications in new tabs within ConEmu.
These can be configured in the 'Tasks' page of the 'Settings' dialog,
and stored in the "Tasks" subkey of reg/xml settings.
'Tasks' may be used as follows (as an example, we will use a task named {Shells}):

* when you start by specifying the properties of the shortcut: "ConEmu.exe / cmd {Shells}";
* specifying {Shells} in the 'Command line' page 'Main' of 'Settings' dialog;
* when you create a new console interface ConEmu (<code class="plus">[+]</code> on the toolbar, a list of Recreate-dialog);
* from the command line (cmd.exe): "%ConEmuBaseDir%\ConEmuC.exe" / c {Shells} -new_console.
* from the command line (far.exe): conemu:run:{Shells} -new_console

The ConEmu Jump list is set here too.
Set up a list of tasks in the field of «ConEmu arguments for Jump list»
You can optionally specify the icon that is displayed in the Jump list, for example

~~~
/icon "cmd.exe"
~~~

and working directory, where new process will be started, for example

~~~
/dir "c:\Program Files"
~~~


### Tasks in Windows 7 task bar jump list {#jump-list}

Ensure that option ‘[Taskbar jump lists](SettingsTasks.html#id2752)’
is checked, and go to [Settings/Task bar](SettingsTaskBar.html).
Check there ‘[Add ConEmu tasks to taskbar](SettingsTaskBar.html#id2132)’
and (optionally) ‘[Add commands from history, too](SettingsTaskBar.html#id2133)’.
Than press ‘[Update Now!](SettingsTaskBar.html#id2320)’ button.

On success, you'll see the message ‘Taskbar jump list was updated successfully’, or an error information.
Also, you may initialize Jump list on ConEmu startup (automate your box setup),
just run (once) `ConEmu.exe /updatejumplist`.



## Creating new task  {#create-new-task}

When you want to create new task absent in the default tasks list you need to know:

* The shell name. For example: cmd, powershell, bash and so on.
* The shell arguments. For example: `/k vcvarsall.bat x86`
* Shell working directory. That may be very significant.
* In some cases you need to know environment variables.


### Where you may get required information?   {#find-required-information}

In most cases you may open properties of shortcut created by any installer.
Just find the shortcut, right-click it, and choose ‘Properties’.

![VS tools prompt](/img/ConEmuVsTask1.png "Searching for VS tools prompt command")

* Copy ‘Target’ contents to the ‘Task Commands’;
* Optionally set working directory with <code>/dir</code> switch in the ‘Task parameters’;
* If you want to choose specific tab name use [-new_console:t:"VS 12.0"](NewConsole.html) switch;
* Finally, if you need to define some environment variables, just specify them before the shell.

~~~
set Var1=Value1 & set "Var2=Value with spaces" & cmd /k vcvarsall.bat x86 -new_console:t:"VS 12.0"
~~~

Finally, the task for VS prompt is ready.

![ConEmu VS tools prompt](/img/ConEmuVsTask2.png "ConEmu task for VS tools prompt")


### If there is no shortcut for that shell   {#if-no-shell-shortcut}

Sometimes, if the shell is started from another program you may use
[ProcessExplorer](ProcessExplorer.html) or [ProcessMonitor](ProcessMonitor.html)
to detect which command is started, arguments and the working directory.

If you can't do that, just google for alternatives.
For example it is hard to find proper arguments for NuGet console
started from Visual Studio because VS do not start `powershell.exe`
but run powershell host internally. Just google! For example:

* [Using NuGet standalone command-line](http://headsigned.com/article/using-nuget-standalone-command-line)
* [Download Nuget Packages Without VS/NuGet Package Manager](http://stackoverflow.com/a/13581202/1405560)
* [Do an offline installation into Visual Studio](http://stackoverflow.com/a/15000559/1405560)
