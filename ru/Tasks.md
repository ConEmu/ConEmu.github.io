---
title: "ConEmu | Tasks"

description: "Tasks в ConEmu это простой способ запуска часто используемых
  оболочек или одновременного запуска нескольких оболочек в табах или сплитах."

breadcrumbs:
 - url: TableOfContents.html#launch-apps
   title: Запуск приложений

readalso:
 - url: NewConsole.html
   title: "Смена палитры, иконки, фонового изображения с помощью -new_console"

otherlang:
   eng: /en/Tasks.html
   rus: /ru/Tasks.html
---

# ConEmu's Tasks

«Task-и» или «Задачи» используются в ConEmu для сохранения предопределенных команд
или параметров запуска [оболочке (shell)](TerminalVsShell.html).
Доступны для запуска по имени или горячей клавише.

Это также простой способ запуска нескольких shell
в [табах (tabs)](TabBar.html) или [сплитах (splittings)](SplitScreen.html).

![ConEmu's tasks dropdown](/img/ConEmuStartTask.png "Start task dropdown menu")

Задачи настраиваются на вкладке [Tasks](SettingsTasks.html) диалога настроек.


* [Подробнее о Задачах](#about-tasks)
  * [Немного из настроек](#from-settings)
* [Creating new task](#create-new-task)
  * [Where you may get required information?](#find-required-information)
  * [If there is no shortcut for that shell](#if-no-shell-shortcut)



## Подробнее о Задачах  {#about-tasks}

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
| имя Task-а | `{Git Bash}`, `{WinSDK v7.0}`, ... |
| имя или полный путь к [исполняемому файлу](https://wikipedia.org/wiki/Executable) | `bash.exe` |
| аргументы программы | `--login -i` |
| ключи [-new_console](NewConsole.html) | `-new_console:t:"Bash" -new_console:d:"C:\Projects"` |
| несколько [табов](TabBar.html) или [сплитов](SplitScreen.html) | `cmd` <br/> `powershell -new_console:sV` |

Когда вам нужно [запустить новый таб](LaunchNewTab.html)
вы можете вводить возможно очень длинную команду запуска вроде

```
set "FARHOME=" & C:\Far\Far.exe /w /x /p%ConEmuDir%\Plugins\ConEmu;%FARHOME%\Plugins;C:\Far\Plugins.My
```

Или просто запустить «Task» по имени {Far}.

Также «Task-и» это единственный простой способ запуска нескольких [табов](TabBar.html)
или предопределенной конфигурации [сплитов](SplitScreen.html).



### Немного из настроек   {#from-settings}

![ConEmu settings, Tasks page](/img/Settings-Tasks.png "ConEmu settings, Tasks page")

Здесь вы можете настроить список часто выполняемых задач.
Задача - это алиас для запуска одного или более приложений в новых вкладках ConEmu.
Задачи настраиваются на странице 'Tasks' диалога настроек
и сохраняются в настройке (reg/xml) в подключе "Tasks".
Их можно использовать (на примере задачи {Shells}):

* при запуске, указав в свойствах ярлыка: "ConEmu.exe /cmd {Shells}";
* указав {Shells} в поле 'Command line' страницы 'Main' окна 'Settings';
* при создании новой консоли через интерфейс ConEmu (<code class="plus">[+]</code> на тулбаре, список в Recreate-диалоге);
* из командной строки cmd.exe: "%ConEmuBaseDir%\ConEmuC.exe" /c {Shells} -new_console.
* из командной строки far.exe: conemu:run:{Shells} -new_console

ConEmu Jump list настраивается тоже здесь.
Настройте список задач, в поле «ConEmu arguments for Jump list»
можно дополнительно указать иконку, которая будет отображаться в Jump list, например

~~~
/icon "cmd.exe"
~~~

и рабочую папку, в которой будет запущен указанный процесс, например

~~~
/dir "c:\Program Files"
~~~

После настройки списка задач включите флажок «Add ConEmu tasks to taskbar» и (по желанию)
«Add commands from history, too». Нажмите кнопку «Update Now!».
В случае успеха вы увидите сообщение «Taskbar jump list was updated successfully», ну или сообщение об ошибке.
Есть способ инициировать Jump list при запуске ConEmu (<a title="Jump Lists/Task window problem" href="http://github.com/Maximus5/conemu-old-issues/issues/576"> Issue 576 </a>,
может кому еще понадобится для автоматизации установки, например) для этого запустите (однократно) ConEmu.exe с аргументом `/updatejumplist`.



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
