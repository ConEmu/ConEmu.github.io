---
redirect_from:
 - /ru/AnsiLogFiles.html

title: "ConEmu | ANSI Log Files"

breadcrumbs:
 - url: TableOfContents.html#feedback
   title: Feedback

readalso:
 - url: LogFiles.html
   title: "Log Files"
 - url: SettingsDebug.html
   title: "Debug Log Files"
 - url: Issues.html
   title: "Contacts, Feedbacks, Suggestions"
 - url: BadIssue.html
   title: "Bad issues has no value"
---

# Log console output

ConEmu may write all output from [console applications](ConsoleApplication.html) to log files.

* [Disclaimer notes](#note)
* [Settings page](#settings)
* [Connector --log switch](#connector)

{% include in_article.html %}


## Please note  {#note}

* Don't confuse this with [log files](LogFiles.html) created by `-log` switch!
* ConEmu can't log output from PuTTY, mintty and other [ChildGui](ChildGui.html) tools!


## Settings page  {#settings}

On the [Settings / Features](SettingsFeatures.html) page you may enable
logging of console applications output. By default logging is disabled,
and suggested folder to store log files is `%ConEmuDir%\Logs\`
(read about [environment variables](ConEmuEnvironment.html)).

Please note, that when you tick checkbox ‘Log console output’ it
will affect newly created consoles only.


## Connector ‘--log’ switch  {#connector}

When you use [Connector](CygwinMsysConnector.html) to run [WSL](BashOnWindows.html) or [cygwin/msys](CygwinMsys.html) shells
you may turn on logging in the Connector itself using `--log <dir>` switch.

For example, if you use the [Task](Tasks.html) `{Bash::bash}` it runs by default:

```
set "PATH=%ConEmuBaseDirShort%\wsl;%PATH%" & %ConEmuBaseDirShort%\conemu-cyg-64.exe --wsl -cur_console:pm:/mnt
```

And you want to log your console output to folder `D:\Users\Bugs`.
Just add the `--log D:/Users/Bugs` (backslashes are supported too) after connector executable.
If `--log` is specified without the following directory, connector tries to created log files
in the startup directory of the `conemu-cyg-64.exe` process.

```
set "PATH=%ConEmuBaseDirShort%\wsl;%PATH%" & %ConEmuBaseDirShort%\conemu-cyg-64.exe --log D:/Users/Bugs --wsl -cur_console:pm:/mnt
```
