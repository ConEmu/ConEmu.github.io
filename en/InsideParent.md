---
title: "ConEmu | Inside Parent (Embedding)"

description: "Feature ‘ConEmu Inside’ or ‘Embedding’ allows to run it
   inside any other window, for example inside Windows' Explorer's
   details pane. Like ‘ConEmu Here’."

breadcrumbs:
 - url: TableOfContents.html#features
   title: Features

readalso:
 - url: SettingsIntegration.html
   title: "Settings: ConEmu Here & Inside"
 - url: CygwinStartDir.html
   title: "Cygwin Startup Directory"
 - url: StartupDir.html
   title: "ConEmu Startup Directory"
 - url: ConEmuArgs.html
   title: "ConEmu.exe Command Line Switches"

otherlang:
   en: /en/InsideParent.html
   ru: /ru/InsideParent.html
---

# ConEmu-Inside or Embedding

The ‘Inside’ mode allows to run ConEmu-Maximus5
inside any other window.

* [As a pane of Windows Explorer](#explorer) - select
  from [context menu](#settings) of drive/folder/file item ‘ConEmu Inside’
  ([register it first](SettingsIntegration.html)
  and inside your Explorer window selected shell
  (cmd/powershell/bash) would be started in the current folder.
* [As child window inside any desired window](#terminal).
  This mode may be used to implement handy and powerful terminal
  inside other products, for example GitExtensions.
  Just start ConEmu with switch `-insidewnd 0xHWND`.



## Configuration for use inside Windows Explorer  {#settings}

The mode was inspired by the question
‘[How to embed PowerShell into Explorer or Explorer-like tool](http://superuser.com/a/441531/139371)’?

Add item ‘ConEmu Inside’ into Windows ‘Explorer’ context menu,
it will open ConEmu as child window inside ‘Explorer’ window.
It's similar to ‘ConEmu Here’ - working folder will be current folder from ‘Explorer’ window.

All options on the [Integration page](SettingsIntegration.html) of [Settings dialog](Settings.html).

{% if site.url != 'local' %}{% include in_article.html %}{% endif %}


### Group ‘ConEmu Inside’   {#inside-group}
You may create several Explorer's context menu items
and view/edit previously defined items
(just choose desired item in the ‘Menu Item’ list).


### Option ‘Sync current directory (Explorer > ConEmu)’   {#sync-dir}
At the moment, the option is not stored in the [Settings dialog](Settings.html),
but written as ConEmu command line option when you press ‘Register’ button.
While Inside mode [StatusBar](StatusBar.html) shows ‘Sync’ column
to turn synchronization On/Off.

The idea of the option is that ConEmu will monitor current folder in the
Explorer window and synchronize it with the shell, by executing `cd /d ...`
in the console.
You may define another command for other shell, for example if you use ‘bash’
the command may be: `cd '\2'\n`.

Note for WinXP/Win2k3. You have to show full active folder path
in the Explorer window title.


## Run from Explorer window  {#explorer}

![ConEmu Inside Explorer's window](/img/ConEmuInside.png)

In this mode ConEmu may be started from Explorer's context menu.
The default name of menu item is ‘ConEmu Inside’, but you may
choose any other name,
or create several items for different shells.

**NB**
This mode requires some free space (Details, Preview or Status areas)
to ‘inject’ terminal inside it.

| OS | Panel |
|:----|:----|
| Windows 2000 | Unchecked |
| Windows XP <br/> Windows 2003 | The panel ‘**Tip of the Day**’. <br/> Explorer's menu ‘View’ > ‘Explorer Bar’ > ‘Tip of the Day’. |
| Windows Vista | Unchecked |
| Windows 7 | Increase the height of the **status** area or turn on **preview** area. |
| Windows 8 | Turn on either ‘**Preview pane**’ or ‘**Details pane**’. |

**Hint**
If you hold ‘Shift’ pressed while starting ConEmu from menu item,
ConEmu would start the console ‘As Administrator’.

If ConEmu was already started in the Inside mode, new console would be started as new ‘Tab’.
But [TabBar](TabBar.html) is not shown by default
(you may turn it on in [Settings](SettingsTabBar.html)),
so you may switch tabs through clicks on the [StatusBar's](StatusBar.html)
field ‘ActiveCon/TotalCount’.



## Run Inside third-party applications  {#terminal}

![ConEmu Inside third-party application](/img/ConEmuInside2.png)

You (user or developer) may start ConEmu as child terminal window.
The only thing you shall implement or provide is some child window,
which ‘HWND’ you pass as ConEmu.exe switch `-insidewnd 0xHWND`
when you run the terminal. `HWND` is hexadecimal window descriptor.

There is sample [conemu-inside](https://github.com/Maximus5/conemu-inside)
project which demostrates how you may create and control child terminal.



## ConEmu command line switches  {#inside-switches}

| | |
|:----|:----|
| `-inside` | Automatic mode. Used to run ConEmu in the Explorer window. <br/> ConEmu will search for appropriate parent process window suitable to embed into. |
| `-insidepid PID` | Same as ‘-inside’ but you define exact Process ID, in which window ConEmu must integrate. <br/> *PID* is a decimal process identifier. |
| `-insidewnd 0xHWND` | Directly specified window handle (HWND) to embed into. Unlike automatic mode ConEmu will cover all client area of this HWND. <br/> *HWND* - window descriptor (hex). |
