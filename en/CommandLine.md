---
redirect_from:
 - /ru/CommandLine.html

title: "ConEmu | CommandLine - GUI, Console and Shells switches"

breadcrumbs:
 - url: TableOfContents.html#launch-apps
   title: Launch Apps

readalso:
 - url: NewConsole.html
   title: "-new_console and -cur_console"
---

# CommandLine - GUI, Console and Shells switches

There are several places where you may need to use command line
arguments. Do not confuse them. The switch from one group will not
be working in the another place!

* [GUI args](#ConEmuArgs)
* [ConEmuC args](#ConEmuC)
* [Shell args](#Shell_args)
* [Console args](#Console_args)
* [Task parameters](#Task_parameters)

{% include in_article.html %}


## [GUI args](ConEmuArgs.html)   {#ConEmuArgs}

These switches are used for changing ConEmu window behavior or
running specific commands (shells) in the ConEmu's tabs or splits.
In the following example all between `ConEmu` and `-run` are GUI
arguments.

~~~
ConEmu -mintsa -config "Maintainance" -dir "C:\Project" -run git fetch
~~~



## [ConEmuC args](ConEmuC.html#ConEmuC_switches)   {#ConEmuC}

ConEmuC is a console part of ConEmu. It serves a console window
acting a console server in the ConEmu-ConEmuC pair. Also, it can be
used to run some checks (do your console is run in ConEmu, etc.), to
execute [GuiMacro](GuiMacro.html)'s, to make
[MemoryDump](MemoryDump.html)'s, and so on.

~~~
ConEmuC -isconemu & if errorlevel 2 (echo Not in ConEmu) else if errorlevel 1 (echo In ConEmu)
~~~

~~~
ConEmuC -GuiMacro:0 print "Echo abc\n"
~~~



## Shell args   {#Shell_args}

Generally speaking, ConEmu has no common with shells. The shell, is
what you run in the ConEmu's tab or split. Read more here:
[LaunchNewTab](LaunchNewTab.html).

~~~
cmd /k ver & your_batch_script.cmd
~~~

~~~
powershell -NoProfile -NoExit -Command "Import-Module List.ps1 -ArgumentList 'Tasks'"
~~~

~~~
bash.exe --login -i
~~~



## Console args   {#Console_args}

That is much like as ‘Shell args’, with only difference that ConEmuC can process some commands internally, before running you shell: ‘set’, ‘chcp’, ‘title’. They can be used in [Tasks](SettingsTasks.html), after ‘-run’ ConEmu's switch and so on.

~~~
"set PATH=C:\MinGW\bin;%PATH%" & set MSYSTEM=MINGW64 & chcp 65001 & sh -l -i
~~~


## Task parameters   {#Task_parameters}

When you do configure [tasks](SettingsTasks.html)
you will see ‘Task parameters’ edit field.
That is the place to:

* force the task to be run in the special directory;
* give the started tab a specific icon;
* when used from the jump list force the task to be run in the existing ConEmu window.
