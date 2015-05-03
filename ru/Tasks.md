---
title: "ConEmu | Tasks"

description: "Tasks в ConEmu это простой способ запуска часто используемых
  оболочек или одновременного запуска нескольких оболочек в табах или сплитах."

breadcrumbs:
 - url: TableOfContents.html#launch-apps
   title: Запуск приложений
---

# ConEmu's Tasks

ConEmu-Maximus5 это терминал, своего рода контейнер,
в котором вы запускаете
[консольные приложения](ConsoleApplication.html)
или простые программы с собственным графическим интерфейсом
([ChildGui](ChildGui.html)).
Обычно это [shell](TerminalVsShell.html)
вроде cmd.exe, bash.exe, powershell.exe,
редакторы типа notepad++ или даже другие терминалы
как mintty.exe или PuTTY.exe.

В ConEmu есть [табы (tabs)](TabBar.html) и [сплиты (splittings)](SplitScreen.html)
(вроде screen/tmux, но поддерживаемые на уровне графики).
В этих «слотах» вы и запускаете требуемые программы.

«Task-и» это инструкции для ConEmu что и как запускать в этих «слотах».
Е каждого «Task-а» есть «имя», одна или более команд для запуска,
горячую клавишу для запуска когда ConEmu в фокусе,
а также опциональные ключи, задающие начальную директорию, иконку и т.п.

| Значение | Пример  |
|:---------|:--------|
| имя Task-а | {Git Bash}, {WinSDK v7.0}, ... |
| имя или полный путь к [исполняемому файлу](https://wikipedia.org/wiki/Executable) | bash.exe |
| аргументы программы | --login -i |
| ключи [-new_console](NewConsole.html) | -new_console:t:"Bash" -new_console:d:"C:\Projects" |
| несколько [табов](TabBar.html) или [сплитов](SplitScreen.html) | cmd <br/> powershell -new_console:sV |

Когда вам нужно [запустить новый таб](LaunchNewTab.html)
вы можете вводить возможно очень длинную команду запуска вроде

```
set "FARHOME=" & C:\Far\Far.exe /w /x /p%ConEmuDir%\Plugins\ConEmu;%FARHOME%\Plugins;C:\Far\Plugins.My
```

Или просто запустить «Task» по имени {Far}.

Также «Task-и» это единственный простой способ запуска нескольких [табов](TabBar.html)
или предопределенной конфигурации [сплитов](SplitScreen.html).

### Итого

Используйте «Task-и» для запуска предопределенных команд по имени или горячей клавише.

![ConEmu's tasks dropdown](/img/ConEmuStartTask.png "Start task dropdown menu")

Tasks may be configured in the [‘Settings’ dialog](SettingsTasks.html).


<h2 id="create-new-task"> Creating new task </h2>

When you want to create new task absent in the default tasks list you need to know:

* The shell name. For example: cmd, powershell, bash and so on.
* The shell arguments. For example: `/k vcvarsall.bat x86`
* Shell working directory. That may be very significant.
* In some cases you need to know environment variables.


<h3 id="find-required-information"> Where you may get required information? </h3>

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


<h3 id="if-no-shell-shortcut"> If there is no shortcut for that shell </h3>

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
