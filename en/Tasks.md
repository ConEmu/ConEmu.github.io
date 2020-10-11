---
title: "ConEmu | Tasks: Set up your favourite shells"

description: "ConEmu's Tasks are simple way to store oft-used commands
  and start several shells in tabs or splits."

breadcrumbs:
 - url: TableOfContents.html#launch-apps
   title: Launch Apps

readalso:
 - url: DefaultTasks.html
   title: "Default Tasks"
 - url: NewConsole.html
   title: "-new_console to change palette, icon, background image, etc."
 - url: SplitScreen.html
   title: "Split Screen or Panes"
 - url: CommandLine.html
   title: "GUI, Console and Shells switches"
 - url: StartupDir.html
   title: "Startup Directory"
 - url: SettingsTasks.html
   title: "Settings › Tasks page"
---

# ConEmu's Tasks

ConEmu's **Tasks** are used to store predefined commands
or [shell's](TerminalVsShell.html) command lines
and run them anytime later by name or hotkey.

* [Tasks in details](#about-tasks)
  * [Task name](#task-name)
  * [Task commands](#task-commands)
  * [Task hotkey](#task-hotkey)
  * [Task parameters](#task-parameters)
* [Somewhat from Settings](#from-settings)
* [Creating new task](#create-new-task)
  * [Where you may get required information?](#find-required-information)
  * [If there is no shortcut for that shell](#if-no-shell-shortcut)
* [Add/refresh default tasks](#add-default-tasks)

When you need to [create a tab](LaunchNewTab.html)
you may type long command line with dozen of switches:

```
set "FARHOME=" & C:\Far\Far.exe /w /x /p%ConEmuDir%\Plugins\ConEmu;%FARHOME%\Plugins;C:\Far\Plugins.My
```

Or just run task named `{Far}`.

**Task** is a simple way to start several shells
in [tabs](TabBar.html) or [splits/panes](SplitScreen.html).

At last, Tasks are the only easy way to run several [tabs](TabBar.html)
or preconfigured [splits](SplitScreen.html) at once.

![ConEmu's tasks dropdown](/img/ConEmuStartTask.png "Start task dropdown menu")

Tasks may be configured in the [‘Settings’ dialog](SettingsTasks.html).

{% if site.url != 'local' %}{% include in_article.html %}{% endif %}

## Tasks in details  {#about-tasks}

A **Task** is an instruction or set of instructions what and how ConEmu
shall run in its ‘slots’ ([tabs](TabBar.html) or [splits](SplitScreen.html)).

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

### Task name  {#task-name}
Each **Task** has a **Name**. For example `{Far}`, `{Shells::cmd}`, `{Bash::Git Bash}`, etc.
Enter the name *without curly braces*, they are added automatically.
You may access the **Task** either by its full name `{Shells::cmd}`
or by a short name `{cmd}`, if there are not conflicts in short names.

### Task commands  {#task-commands}
One or **several** actual commands to run, it contains:
Usually you put here a name or full path to your
[program](https://wikipedia.org/wiki/Executable), e.g. `bash.exe`.

* a name or full path to [program](https://wikipedia.org/wiki/Executable), e.g. `bash.exe`;
* program arguments, e.g.  `--login -i`;
* [-new_console](NewConsole.html) switch(es), e.g. `-new_console:t:"Bash" -new_console:d:"C:\Projects"`.
* [-new_console:sV](SplitScreen.html) switch to run commands in panes.

Read below about [creating new task commands](#create-new-task).

Also you may put here the names of other single-command tasks.
For example, my `{Startup}` task initializes [ssh-agent](SshAgent.html)
and starts [Far Manager](FarManager.html) at once.

```
> {ssh-agent}
{Far}
```

### Task hotkey  {#task-hotkey}
You may assign a ‘hotkey’ to each task to have the task started
in a simple keypress when ConEmu has focus.

### Task parameters  {#task-parameters}
This field may contain some optional switches like startup directory or icon.
These switches have influence over *all commands* defined in the task.
You may use here a subset from [ConEmu command line switches](ConEmuArgs.html):

* `-icon "path-to-tab-icon"` defines tab icon; alternative to [-new_console:C:"path-to-tab-icon"](NewConsole.html);
* `-dir "working-directory"` defines shell startup directory; alternative to [-new_console:d:"working-directory"](NewConsole.html);
* `-single` or `-reuse` forces to run the task in an existing ConEmu instance; useful with [Windows 7 jump lists](#jump-list);
* `-quake` or `-noquake` as is, allows to run a command in quake/noquake mode.



## Somewhat from Settings   {#from-settings}

![ConEmu settings, Tasks page](/img/Settings-Tasks.png "ConEmu settings, Tasks page")

**Tasks** are configured in the [Settings dialog](SettingsTasks.html).
Don't forget to save them after changes!


**Tasks** may be used in the following places (as an example, we will use a task named {cmd}):

* when you start by specifying the properties of the shortcut: `ConEmu.exe -run {cmd}`;
* `{cmd}` in the 'Command line' on the [Startup](SettingsStartup.html) Settings page;
* when you [create a new console in ConEmu](LaunchNewTab.html) via <code class="plus">[+]</code> on the toolbar;
* from consoles started in ConEmu:
  * from [cmd.exe prompt](CmdPrompt.html): `"%ConEmuBaseDir%\ConEmuC.exe" /c {cmd} -new_console`;
  * from [Far Manager](FarManager.html) prompt via [plugin](ConEmuFarPlugin.html): `conemu:run:{cmd} -new_console`;
  * you can't start new consoles from [WSL prompt](BashOnWindows.html) because all commands are executed on the Linux side.

The [ConEmu Jump list](#jump-list) may be configured here too.
Set up a list of tasks in the field of ‘ConEmu arguments for Jump list’
You can optionally specify the icon that is displayed in the Jump list, for example

~~~
/icon "cmd.exe"
~~~

and working directory, where new process will be started, for example

~~~
/dir "c:\Program Files"
~~~

**NB** Switches `/icon` and `/dir` must be typed in the ‘Task parameters’ field,
but not in ‘Commands’. If you run several shells from one task, you may specify
icons and working directories for each shell using
[-new_console](NewConsole.html) switches in the ‘Commands’ box.


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

When you want to create new task absent in the [default tasks](DefaultTasks.html) list you need to know:

* The shell name. For example: `cmd`, `powershell`, `bash` and so on.
* The shell arguments. For example: `cmd /k vcvarsall.bat x86`
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


## Add/refresh default tasks  {#add-default-tasks}

Often the ‘[Default Task](DefaultTasks.html)’ generated by ConEmu for well known
shells and toolsets is the only proper way to run your shell in ConEmu, otherwise
you may get unexpected shell behavior which ConEmu can't ‘fix’.

Please refresh your ‘Detault Tasks’ with ‘Add/recreate default tasks...’
button on the [Tasks settings page](SettingsTasks.html#id2632).
