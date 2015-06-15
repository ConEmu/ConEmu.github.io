---
title: ConEmu | Environment Variables - Переменные Окружения

description: "Список переменных окружения используемых в ConEmu.
  Экспорт переменных в родительские процессы консолей.
  Трюки с системным временем и кодовыми страницами консоли.
  Примеры использования."

breadcrumbs:
 - url: TableOfContents.html#features
   title: Функции

readalso:
  - url: WindowsEnvironment.html
    title: Windows Environment Variables
---

# ConEmu Environment variables - Переменные Окружения

* [Список переменных окружения устанавливаемых в ConEmu](#List_of_environment_variables_set_by_ConEmu)
* [Изменения PATH](#PATH_modifications)
* [Debug purposed variables](#Debug_purposed_variables)
* [Export variables](#Export_variables)
  * [Full syntax of Export command](#Full_syntax_of_Export_command)
* [Disabling hooks temporarily](#Disabling_hooks_temporarily)
* [Cheating system time](#Cheating_system_time)
* [ConEmuCpCvt - hack to force output CP conversion](#ConEmuCpCvt)
* [ConEmuDefaultCp - hack to change output CP if you don't want to use ‘chcp’](#ConEmuDefaultCp)


<h2 id="List_of_environment_variables_set_by_ConEmu"> Список переменных окружения устанавливаемых в ConEmu </h2>


| **Имя** | **Пример** | **Описание** |
|:---------|:------------|:----------------|
| ConEmuDir | `C:\ConEmu` | папка, содержащая ConEmu.exe |
| ConEmuDrive | `C:` | диск с двоеточием, содержащий ConEmu.exe |
| ConEmuBaseDir | `C:\ConEmu\ConEmu` | папка, содержащая ConEmuC.exe |
| ConEmuWorkDir | `C:\Users` | рабочая папка, где был запущен ваш shell |
| ConEmuWorkDrive | `C:` | диск с двоеточием, где был запущен ваш shell |
| ConEmuArgs | <i>вариант</i> | аргументы, с которыми был запущен ConEmu.exe |
| ConEmuConfig | <i>вариант</i> | имя активной конфигурации, читайте про ключ `/config` |
| ConEmuBuild | `141126c` | текущий билд ConEmu |
| ConEmuPID | <i>число</i> | PID (ИД процесса) ConEmu GUI |
| ConEmuServerPID | <i>number</i> | PID (ИД процесса) ConEmuC сервера |
| ConEmuHWND | `0x8HEXDGTS` | дескриптор главного окна ConEmu |
| ConEmuDrawHWND | `0x8HEXDGTS` | дескриптор дескриптор окна виртуальной консоли (дочернее окно ConEmu), окно отрисовки текста консоли |
| ConEmuBackHWND | `0x8HEXDGTS` | подложка для окна отрисовки, может быть больше окна отрисовки при наличии «padding» или «scrollbars» |
| ConEmuIsAdmin | `ADMIN` или не задана | устанавливается для тех табов/сплитов, которые запущены с повышенными полномочиями (UAC) |
| ConEmuANSI | `ON` или `OFF` | установлено в `ON` если доступен «ANSI X3.64» |
| [ConEmuHooks](ConEmuEnvironment.html#Disabling_hooks_temporarily) | `Enabled`,`OFF`,`NOARG`,`NOSTART` | можно временно отключить установку inject-ов на время запуска длинных команд или инициализационных скриптов |
| [ConEmuFakeDT](ConEmuEnvironment.html#Cheating_system_time) | `2014-12-31` | that will cheat system and local current time for console processes |
| [ConEmuMacroResult](GuiMacro.html#Far3-pre-Lua) | *вариант* | устанавливается из плагина ConEmu's Far Manager после выполнения [GUI Macro](GuiMacro.html) |
| [ConEmuCpCvt](ConEmuEnvironment.html#ConEmuCpCvt) | perl.exe:1252:1251 | изменить кодовую страницу выводимого текста |
| [ConEmuDefaultCp](ConEmuEnvironment.html#ConEmuDefaultCp) | 1251 | установить кодовую страницу вместо использования chcp |


<h2 id="PATH_modifications"> Изменения PATH </h2>

[Settings page Environment](SettingsEnvironment.html) has an options ‘Add %ConEmuDir% to %PATH%’, ‘Add %ConEmuBaseDir% to %PATH%’
and edit box for settings user-defined environment variables.

Variables `%ConEmuDir%` and `%ConEmuBaseDir%` are set by default to allow easily run
executables and scripts and macros from ConEmu's folders. For example:

~~~
ConEmuC -GuiMacro Progress 3
~~~

or

~~~
csudo dism.exe /online /enable-feature /featurename:NetFX3 /All /Source:D:\sources\sxs /LimitAccess
~~~


<h2 id="Debug_purposed_variables"> Debug purposed variables </h2>

| **Name** | **Example** | **Description** |
|:---------|:------------|:----------------|
| `ConEmuSleepIndicator` | `TITLE`, `NUM` or `OFF` | Turns on monitoring feature of ‘Sleep in background’, when `ConEmuSleepIndicator=NUM` ConEmu will turn off NumLock when going sleep and turn on NumLock when full active back, when `ConEmuSleepIndicator=TITLE` - state will be shown in the TabBar or window title. |
| `ConEmuReportExe` | `perl.exe` | Shows message box like ‘perl.exe loaded’ when `perl.exe` started inside ConEmu tab; option ‘Inject [ConEmuHk](ConEmuHk.html)’ must be enabled |


<h2 id="Export_variables"> Export variables </h2>

When you start new console - it inherits environment strings (`%PATH%` also)
from parent process (ConEmu GUI).

When you change %PATH% in your shell - it applies to this shell and its
children processes (that is started in current console/tab).

If you need to fixate this temporarily environment changes - you may execute

~~~
ConEmuC /export PATH
~~~

This will ‘copy’ your current `%PATH%` value to ConEmu GUI
and it will be applied to all new ConEmu's consoles.


<h3 id="Full_syntax_of_Export_command"> Full syntax of Export command </h3>

~~~
ConEmuC /EXPORT[=CON|ALL] [Var1 [Var2 [...]]]
ConEmuC /export[=CON|ALL] [Var1 [Var2 [...]]]
  VarN        - may contains one trailing/middle asterisk (sort of filemask support).
  /export     - export to all processes of current console and ConEmu GUI
  /export=CON - export to all processes of current console only
  /export=GUI - export to ConEmu GUI only
  /export=ALL - export to all processes of opened tabs and ConEmu GUI
~~~

* Note! ‘Inject ConEmuHk’ required to set variables.
* Some shells may ignores environment changes by `/EXPORT=ALL` because of their features.
* Shells comments
* ‘Far Manager’ & ‘TCC/LE’ - OK;
* ‘cmd’ - fails partially (required to run smth from active cmd, for example "cmd /k exit", to ‘apply’ changes);
* ‘bash’ - fails completely (seems, it does not support outside changing of env.vars).


<h2 id="Disabling_hooks_temporarily"> Disabling hooks temporarily </h2>

You may temporarily disable injects when running ‘long’ batches or initialization scripts:

~~~
cmd /k set ConEmuHooks=OFF & "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.cmd" -new_console:sV -new_console:t:SDK & set ConEmuHooks=
~~~

Actually, `ConEmuHooks` may be set to comma-delimited set of `OFF`,`NOARG`,`NOSTART` or simple `Enabled`.
So if you want temporarily disable processing of `-new_console` and `start`
(which both are forcing command into the new [ConEmu tab](Tabs.html))
you may set the following:

~~~
set ConEmuHooks=NOARG,NOSTART
~~~


<h2 id="Cheating_system_time"> Cheating system time </h2>

Environment variable "ConEmuFakeDT".
That will cheat system and local current time for console processes.
Use carefully! Console applications will think that time was freezed!
‘Inject [ConEmuHk](ConEmuHk.html)’ must be on! Some examples (cmd):

~~~
set ConEmuFakeDT=%DATE% %TIME%
set ConEmuFakeDT=2013-12-31T23:59:59.99
set ConEmuFakeDT=2013-01-31 9:0:0
set ConEmuFakeDT=2013-11-30
~~~


<h2 id="ConEmuCpCvt"> ConEmuCpCvt </h2>

Codepage hack to force output CP conversion.

If some command uses wrong CP while converting ANSI to Unicode
(the example may be perl.exe from `git add -p`)
set variable to correct its output. Use asterisk for all apps.
This hack affects ONLY `WriteConsoleW` function calls.

~~~
Format:
<exename>:<badcp>:<goodcp>[;<exename>:<badcp>:<goodcp>[...]]
Example:
set ConEmuCpCvt=perl.exe:1252:1251;*:850:866;
~~~


<h2 id="ConEmuDefaultCp"> ConEmuDefaultCp </h2>

Codepage hack to change output CP if you don't want to use chcp.

If you can't use `chcp <codepage>` to change whole console CP output,
you may change it using environment variable ConEmuDefaultCp.
It will affect only `WriteFile` and `WriteConsoleA` functions.
So, if you need to run several apps in one console simultaneously...

~~~
set ConEmuDefaultCp=1251
ConEmuC -fork -c App1.exe
set ConEmuDefaultCp=866
ConEmuC -fork -c App2.exe
set ConEmuDefaultCp=
~~~
