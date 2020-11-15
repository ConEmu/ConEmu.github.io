---
redirect_from:
 - /ru/LaunchNewTab.html

title: "ConEmu | Launch New Tab"

breadcrumbs:
 - url: TableOfContents.html#launch-apps
   title: Launch Apps
   
readalso:
 - url: RestartTab.html
   title: Restart Tab
 - url: NewConsole.html
   title: "-new_console and -cur_console"
---

# Launching applications in ConEmu

* [Using ConEmu switches](#Using_ConEmu_switches)
* [Create new console dialog](#Create_new_console_dialog)
  * [Create new console without dialog](#Create_new_console_without_dialog)
* [Tasks](#Tasks)
* [Create new tab from existing one](#Create_new_tab_from_existing_one)
  * [Take care about double quotes](#double_quotes)
* [Duplicate root](#Duplicate_root)
* [Default terminal feature](#Default_terminal_feature)
* [Attach existing console or GUI application](#Attach_existing_console_or_GUI_application)
* [Attach from command prompt](#Attach_from_command_prompt)
* [Automatic attach of cmd](#Automatic_attach_of_cmd)
* [Gui Macro](#Gui_Macro)

{% include in_article.html %}


## [Using ConEmu switches](ConEmuArgs.html)  {#Using_ConEmu_switches}

When you run something from `Win+R` or shortcut from your Desktop,
you may use `-run` or `-runlist` to run your application. Remember, `-run` or `-runlist` will be the last ConEmu's GUI interpreted switch. The rest of command line will be used to start your application. Read more in the [wiki](ConEmuArgs.html). Example:

~~~
ConEmu -reuse -dir "c:\projects" -run "set PATH=C:\MinGW\bin;%PATH%" & chcp 65001 & sh -l -i
~~~




## Create new console dialog  {#Create_new_console_dialog}

How to start application (tcc, powershell, far, putty) in ConEmu tab?

![ConEmu confirmation of new console creation](/img/ConEmuCreate.png)

This dialog may be opened by:

* [Keyboard shortcut](SettingsHotkeys.html) (`Win+Shift+W` by default)
* [Toolbar's](ToolBar.html) <code class="plus">[+]</code> button,
  hold `Shift` key if [confirmation](SettingsConfirm.html#id1546) is disabled <br/>
  ![Toolbar](/img/ConEmuAddBtn.png)
* [System menu -> New console...](SystemMenu.html), hold `Shift` key if [confirmation](SettingsConfirm.html#id1546) is disabled <br/>
  ![System menu](/img/ConEmuAddSys.png)
* GuiMacro [Create(0,1)](GuiMacro.html#Recreate)

Well, what you can do with this dialog?

* Choose command line and startup directory for new process.
  You may use environment variables in both fields.
  Also, you may choose from drop down list either any of predefined
  [tasks](Tasks.html) or any command from history.
* Choose another user name and password,
  ‘Restricted current user’ account or ‘Run as administrator’ feature.
* You may split active tab vertically or horizontally.
* And it is possible to start new tab in the new ConEmu window,
  new `ConEmu.exe` process will be started.
* Dialog's system menu contains ‘Reset command history’ menu item.

Similar dialog may be opened when you [Restart current console](RestartTab.html).



### Create new console without dialog   {#Create_new_console_without_dialog}

You may switch off create new console confirmation,
just disable ‘Confirm creating new console/tab’ checkbox on the
[Confirm](Settings.html#Confirm) settings page.

**NB** You may pop up confirmation dialog even if ‘Create confirmation’ unchecked.
Just hold Shift while creating console from toolbar, System menu,
or Keyboard (`Win+Shift+W` by default).



## [Tasks](Tasks.html)  {#Tasks}

You may define your own tasks or just use predefined one.
Choose the task from drop down menu or run task by hotkey.
You may choose task in the ‘Create new console’ dialog too.



## Create new tab from existing one with -new_console  {#Create_new_tab_from_existing_one}

Use [-new_console](NewConsole.html) switch while executing command.
For example, if you want to start PuTTY in new ConEmu tab,
type in command prompt (`cmd.exe` started in ConEmu tab)

~~~
putty -new_console
~~~

and it will be launched in the new tab of ConEmu.

`-new_console` works even in batch files.

**NB** Option [Inject ConEmuHk](ConEmuHk.html) must be turned on [Settings / Features](SettingsFeatures.html).

**NB** Switch `-new_console` has a lot of [sub-switches](NewConsole.html).
For example, you may start command in new elevated tab using `-new_console:a`.

~~~
cmd -new_console:a
~~~


### Take care about double quotes  {#double_quotes}

Some shells (e.g. PowerShell) do preprocessing of the typed command line
**before** passing it to the starting application.

You must properly **escape** double quotes. Please consult with your shell manual.

Example below starts new PowerShell tab from **PowerShell prompt** or script
using specified Tab icon.

```
& powershell "-new_console:C:`"C:\path with spaces\favicon.ico`""
```



## Duplicate root  {#Duplicate_root}

Well, this interesting feature offers a way to duplicate shell
([root process](RootProcess.html) of current tab) state to the new ConEmu tab.
For example, you have started `cmd.exe`, set up environment variables,
cd somewhere, run any program (vim for example) and call ‘Duplicate root...’
from tab popup menu.

This will create ‘copy’ of `cmd.exe` at most recent state (when possible).

The feature strongly depends on ability to determine current shell directory.
Unfortunately most of shells don't call [Window API](WinApi.html) function ‘**SetCurrentDirectory**’,
that's why you have to set up your shell (profile).
Examples are described in the [Shell Working Directory](ShellWorkDir.html) article.

**NB**. If your shell explicitly changed directory to you home (for example) on startup,
ConEmu is not able to force it to retain [shell Startup Directory](StartupDir.html).

**NB**. This is not real fork of the shell, but ConEmu tries to inherit environment
variables from the shell if it is possible.



## Default terminal feature  {#Default_terminal_feature}

This allows to seize creation of console processes from many (selected by user) applications.
For example, when you run ‘Command prompt’ shortcut from ‘Start menu’ cmd.exe
may start in the new ConEmu tab.

Read more about [Default terminal feature](DefaultTerminal.html).



## Attach existing console or GUI application  {#Attach_existing_console_or_GUI_application}

Choose ‘Attach...’ from [system menu](SystemMenu.html).

![Attach running application](/img/AttachRunningApp.png)

The ‘Alternative mode’ options means don't inject ConEmuHk.dll into running process.
The effect is similar to [-cur_console:i](NewConsole.html) switch.



## Attach from command prompt  {#Attach_from_command_prompt}

Batch file `Attach.cmd` is shipped with ConEmu package.
Run this file from any cmd.exe to attach this console into the new ConEmu tab.
This batch just run following command

~~~
ConEmuC.exe /ATTACH /NOCMD
~~~

which you may run from any other console shell or even from your own console application.



## Automatic attach of cmd  {#Automatic_attach_of_cmd}

Mostly like as ‘Attach from command prompt’ but you may set up automatic execution
of ‘Attach’ on cmd.exe startup.
This also works with TCC/LE.

Set up feature on [‘ComSpec’](SettingsComspec.html) page of ‘Settings’ dialog.



## Gui Macro  {#Gui_Macro}

You may set up several most used shells or build environments via [GuiMacro](GuiMacro.html).
Example: open ‘Keys & Macro’ settings page, click ‘Macros’ radio (it filters long key list)
and in the free ‘Macro XX’ slot type

~~~
shell("","C:\Windows\System32\cmd.exe /E:ON /V:ON /T:0E /K ""C:\\Program Files\\Microsoft SDKs\\Windows\\v7.1\\Bin\\SetEnv.cmd"" /Release /x86")
~~~

choose any wanted hotkey (`Ctrl+Shift+1` for example) and **Save settings**.
