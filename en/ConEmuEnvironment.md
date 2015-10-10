---
title: ConEmu | Environment Variables

description: "List of environment variables set by ConEmu.
   Ability to export variables into console processes.
   Cheating with system time and console code page.
   Usage examples."

breadcrumbs:
 - url: TableOfContents.html#features
   title: Features

readalso:
  - url: WindowsEnvironment.html
    title: Windows Environment Variables
  - url: UnicodeSupport.html
    title: Unicode Support in ConEmu

otherlang:
   eng: /en/ConEmuEnvironment.html
   rus: /ru/ConEmuEnvironment.html
---

# ConEmu Environment variables

* [List of environment variables set by ConEmu](#List_of_environment_variables_set_by_ConEmu)
* [PATH modifications](#PATH_modifications)
* [Debug purposed variables](#Debug_purposed_variables)
* [Export variables](#Export_variables)
  * [Full syntax of Export command](#Full_syntax_of_Export_command)
* [Disabling hooks temporarily](#Disabling_hooks_temporarily)
* [Cheating system time](#Cheating_system_time)
* [ConEmuCpCvt - hack to force output CP conversion](#ConEmuCpCvt)
* [ConEmuDefaultCp - hack to change output CP if you don't want to use ‘chcp’](#ConEmuDefaultCp)


## List of environment variables set by ConEmu  {#List_of_environment_variables_set_by_ConEmu}

| **Name** | **Example** | **Description** |
|:---------|:------------|:----------------|
| ConEmuDir | `C:\ConEmu` | folder, containing ConEmu.exe |
| ConEmuDrive | `C:` | drive letter with colon, containing ConEmu.exe |
| ConEmuBaseDir | `C:\ConEmu\ConEmu` | folder, containing ConEmuC.exe |
| ConEmuWorkDir | `C:\Users` | folder, from where your shell was started |
| ConEmuWorkDrive | `C:` | drive letter with colon, from where your shell was started |
| ConEmuArgs | <i>vary</i> | arguments were specified to ConEmu.exe |
| ConEmuConfig | <i>vary</i> | current configuration name, see `/config` switch |
| ConEmuBuild |  `141126c` | current ConEmu build number |
| ConEmuPID | <i>number</i> | PID (process ID) of ConEmu GUI |
| ConEmuServerPID | <i>number</i> | PID (process ID) of ConEmuC server executable |
| ConEmuHWND | `0x8HEXDGTS` | main ConEmu window handle |
| ConEmuDrawHWND | `0x8HEXDGTS` | virtual console window handle (child window of ConEmu), this is canvas for console text painting |
| ConEmuBackHWND | `0x8HEXDGTS` | backing for canvas, it may be larger than canvas if padding or scrollbars exists |
| ConEmuIsAdmin |  `ADMIN` or not defined | set for those tabs/splits which were started elevated (UAC) |
| ConEmuANSI | `ON` or `OFF` | set by ConEmu to `ON` when ‘ANSI X3.64’ if enabled |
| [ConEmuHooks](ConEmuEnvironment.html#Disabling_hooks_temporarily) | `Enabled`,`OFF`,`NOARG`,`NOSTART` | you may temporarily disable injects when running ‘long’ batches or initialization scripts |
| [ConEmuFakeDT](ConEmuEnvironment.html#Cheating_system_time) | `2014-12-31` | will cheat system and local current time for console processes |
| [ConEmuMacroResult](GuiMacro.html#Far3-pre-Lua) | *vary* | may be set only by ConEmu's Far Manager plugin after executing [GUI Macro](GuiMacro.html) |
| [ConEmuCpCvt](ConEmuEnvironment.html#ConEmuCpCvt) | `perl.exe:1252:1251` | to force output CP conversion |
| [ConEmuDefaultCp](ConEmuEnvironment.html#ConEmuDefaultCp) | `1251` | to change output CP if you don't want to use chcp |


## PATH modifications  {#PATH_modifications}

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


## Debug purposed variables  {#Debug_purposed_variables}

| **Name** | **Example** | **Description** |
|:---------|:------------|:----------------|
| `ConEmuSleepIndicator` | `TITLE`, `NUM` or `OFF` | Turns on monitoring feature of ‘Sleep in background’, when `ConEmuSleepIndicator=NUM` ConEmu will turn off NumLock when going sleep and turn on NumLock when full active back, when `ConEmuSleepIndicator=TITLE` - state will be shown in the TabBar or window title. |
| `ConEmuReportExe` | `perl.exe` | Shows message box like ‘perl.exe loaded’ when `perl.exe` started inside ConEmu tab; option ‘Inject [ConEmuHk](ConEmuHk.html)’ must be enabled. This may be used for [crash dump creation](CrashDump.html#How_to_create_required_dump). |


## Export variables  {#Export_variables}

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


### Full syntax of Export command   {#Full_syntax_of_Export_command}

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


## Disabling hooks temporarily  {#Disabling_hooks_temporarily}

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


## Cheating system time  {#Cheating_system_time}

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


## ConEmuCpCvt  {#ConEmuCpCvt}

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


## ConEmuDefaultCp  {#ConEmuDefaultCp}

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
