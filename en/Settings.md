---
title: "ConEmu | Settings"

description: "Where the settings are stored, Settings dialog description,
  convertation from registry to xml."
---

# ConEmu setup

* [Where settings are stored](#Where_settings_are_stored)
  * [Registry](#Registry)
  * [ConEmu.xml](#ConEmu_.xml)
* [Manual change of settings](#Manual_change_of_settings)
  * [Using registry](#Using_registry)
  * [Using ConEmu .xml](#Using_ConEmu_.xml)
* [Settings dialog](#Settings_dialog)
  * [Main](#Main)
  * [Size and Pos](#Size_and_Pos)
  * [Appearance](#Appearance)
  * [Task bar](#Task_bar)
  * [Automatic update](#Automatic_update)
  * [Startup](#Startup)
  * [Tasks](#Tasks)
  * [ComSpec](#ComSpec)
  * [Features](#Features)
    * [RealConsole font](#RealConsole_font)
  * [Text cursor](#Text_cursor)
  * [Colors](#Colors)
  * [Transparency](#Transparency)
  * [Tabs](#Tabs)
  * [Status bar](#Status_bar)
  * [Integration](#Integration)
  * [App distinct](#App_distinct)
  * [Keys and Macro](#Keys_and_Macro)
  * [Controls](#Controls)
  * [Mark & Paste](#Mark_&_Paste)
  * [Far Manager](#Far_Manager)
  * [Views](#Views)
  * [Info](#Info)
  * [Debug](#Debug)
* [Alphabetical](SettingsAlphabetical.html)


<h2 id="Where_settings_are_stored"> Where settings are stored </h2>

ConEmu may store its settings in the Windows registry (HKCU), or in the ConEmu.xml file.


<h3 id="Registry"> Registry </h3>

All settings are stored in registry in the following key:

~~~
[HKEY_CURRENT_USER\Software\ConEmu\.Vanilla]
~~~

When You specify the [/config](ConEmuArgs.html) switch in the ConEmu.exe command line settings will be stored here:

~~~
[HKEY_CURRENT_USER\Software\ConEmu\<configname>]
~~~


<h3 id="ConEmu_.xml"> ConEmu.xml </h3>

You may use ConEmu in ‘portable’ mode,
so all settings will be stored in the *ConEmu.xml* file
or its dotted variant *.ConEmu.xml*.
File without leading dot has priority.

ConEmu search sequence of this file:

|:---|:---|
| `%ConEmuDir%\` | Folder with `ConEmu.exe` and `ConEmu64.exe` |
| `%ConEmuBaseDir%\` | Folder with `ConEmuC.exe` and `ConEmuC64.exe` |
| `%APPDATA%\` | I don't think this is really ‘portable’, but many users was asked about `%APPDATA%` |
| Windows registry | If the xml file does not exist in any of the specified folders ConEmu will use Windows registry |

On [first time ConEmu run](SettingsFast.html),
you may choose ‘portable’ mode and location of xml file.

Or you may create manually a new empty `ConEmu.xml`
or just rename `ConEmu_Sample.xml` to `ConEmu.xml` for engaging xml-mode.
Template file `ConEmu_Sample.xml` is shipped with ConEmu.

You may use [named configuration (/config)](ConEmuArgs.html) switch with xml-mode too.

Also, there are switches [/loadcfgfile and /safecfgfile](ConEmuArgs.html)
to use any special locations (may be not so useful for daily using, but available).


**Note**. You may rename/create `ConEmu.xml` file any time,
even after ConEmu starts and loads its settings from registry.


<h2 id="Manual_change_of_settings"> Manual change of settings </h2>

So, You want to change a few settings, which are absent in the Settings dialog.
List and description of each setting You may find
in the `Settings-ConEmu.reg` or `ConEmu_Sample.xml` files.


<h3 id="Using_registry"> Using registry </h3>

Go to Registry editor (be careful!) and change appropriate value in the ConEmu subkeys:

* `[HKEY_CURRENT_USER\Software\ConEmu\.Vanilla]`, when [/config](ConEmuArgs.html) switch is not used;
* `[HKEY_CURRENT_USER\Software\ConEmu\<configname>]`, when /config switch specified in the ConEmu command line.


<h3 id="Using_ConEmu_.xml"> Using ConEmu.xml </h3>

Open ConEmu.xml file using any text editor (Far Manager, Notepad, Vim and so on)
find appropriate value and change it.


<h2 id="Settings_dialog"> Settings dialog </h2>

You may open settings dialog in several ways

* Choosing «Settings...» menu item in ConEmu [system menu](SystemMenu.html), which can be opened
* by right-clicking on the ‘Menu’ icon on the toolbar
* by right-clicking on the window title
* by left-clicking on the icon in the ConEmu title bar
* by pressing Win+Alt+Space on the keyboard
* by right-clicking on the ConEmu (running) icon in the taskbar (in Windows 7 you must hold down Shift key)
* by right-clicking on the ConEmu icon in [TSA](ConEmuTerms.html#TSA) (if you enable TSA feature)
* Or, you may press Win+Alt+P on the keyboard (predefined hotkey)


<a name="screenshots"></a>

<h3 id="Main"> Main </h3>

![ConEmu settings, Main page](/img/Settings-Main.png "ConEmu settings, Main page")


<h3 id="Size_and_Pos"> Size and Pos </h3>

![ConEmu settings, Size and position page](/img/Settings-SizePos.png "ConEmu settings, Size and position page")


<h3 id="Appearance"> Appearance </h3>

![ConEmu settings, Appearance page](/img/Settings-Appearance.png "ConEmu settings, Appearance page")


<h3 id="Background"> Background </h3>

![ConEmu settings, Background page](/img/Settings-Background.png "ConEmu settings, Background page")


<h3 id="Tabs"> Tabs </h3>

![ConEmu settings, Tabs page](/img/Settings-TabBar.png "ConEmu settings, Tabs page")


<h3 id="Confirm"> Confirm </h3>

![ConEmu settings, Confirm page](/img/Settings-Confirm.png "ConEmu settings, Confirm page")


<h3 id="Task_bar"> Task bar </h3>

![ConEmu settings, Task bar page](/img/Settings-TaskBar.png "ConEmu settings, Task bar page")


<h3 id="Automatic_update"> Automatic update </h3>

![ConEmu settings, Update page](/img/Settings-Update.png "ConEmu settings, Update page")


<h3 id="Startup"> Startup </h3>

![ConEmu settings, Startup page](/img/Settings-Startup.png "ConEmu settings, Startup page")


<h3 id="Tasks"> Tasks </h3>

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

и рабочую папку, в которой будет запущен указанный процесс, например

~~~
/dir "c:\Program Files"
~~~

После настройки списка задач включите флажок «Add ConEmu tasks to taskbar» и (по желанию)
«Add commands from history, too». Нажмите кнопку «Update Now!».
В случае успеха вы увидите сообщение «Taskbar jump list was updated successfully», ну или сообщение об ошибке.
Есть способ инициировать Jump list при запуске ConEmu (<a title="Jump Lists/Task window problem" href="http://code.google.com/p/conemu-maximus5/issues/detail?id=576"> Issue 576 </a>,
может кому еще понадобится для автоматизации установки, например) для этого запустите (однократно) ConEmu.exe с аргументом `/updatejumplist`.


<h3 id="ComSpec"> ComSpec </h3>

![ConEmu settings, Comspec page](/img/Settings-Comspec.png "ConEmu settings, Comspec page")


<h3 id="Features"> Features </h3>

![ConEmu settings, Features page](/img/Settings-Features.png "ConEmu settings, Features page")


<h4 id="RealConsole_font"> RealConsole font </h4>

![ConEmu settings, RealConsole font](/img/Settings-More-RealFont.png "ConEmu settings, RealConsole font")


<h3 id="Text_cursor"> Text cursor </h3>

![ConEmu settings, Text cursor page](/img/Settings-TextCursor.png "ConEmu settings, Text cursor page")


<h3 id="Colors"> Colors </h3>

![ConEmu settings, Colors page](/img/Settings-Colors.png "ConEmu settings, Colors page")


![ConEmu settings, Predefines palettes](/img/Settings-Colors2.png "ConEmu settings, Predefines palettes")


<h3 id="Transparency"> Transparency </h3>

[Read more](SettingsTransparency.html)


![ConEmu settings, Transparency page](/img/Settings-Transparency.png "ConEmu settings, Transparency page")


<h3 id="Status_bar"> Status bar </h3>

![ConEmu settings, Status bar page](/img/Settings-StatusBar.png "ConEmu settings, Status bar page")


<h3 id="App_distinct"> App distinct </h3>

![ConEmu settings, App distinct page](/img/Settings-AppDistinct.png "ConEmu settings, App distinct page")


![ConEmu settings, App distinct page](/img/Settings-AppDistinct2.png "ConEmu settings, App distinct page")


![ConEmu settings, App distinct page](/img/Settings-AppDistinct3.png "ConEmu settings, App distinct page")


<h3 id="Integration"> Integration </h3>

![ConEmu settings, Integration page](/img/Settings-Integration.png "ConEmu settings, Integration page")


<h3 id="Default_term"> Default Terminal </h3>

[Go to description](DefaultTerminal.html)


![ConEmu settings, DefTerm page](/img/Settings-DefTerm.png "ConEmu settings, DefTerm page")


<h3 id="Keys_and_Macro"> Keys and Macro </h3>

![ConEmu settings, Keys and Macro page](/img/Settings-Hotkeys.png "ConEmu settings, Keys and Macro page")


![ConEmu settings, Few GuiMacros](/img/Settings-Hotkeys2.png "ConEmu settings, Few GuiMacros")


<h3 id="Controls"> Controls </h3>

![ConEmu settings, Controls page](/img/Settings-Controls.png "ConEmu settings, Controls page")


<h3 id="Mark_and_Copy"> Mark and Copy </h3>

[Go to description](TextSelection.html)


![ConEmu settings, Text selection](/img/Settings-MarkCopy.png "ConEmu settings, Text selection")


<h3 id="Paste"> Paste </h3>

![ConEmu settings, Paste page](/img/Settings-Paste.png "ConEmu settings, Paste page")


<h3 id="Highlight"> Highlight </h3>

![ConEmu settings, Highlight page](/img/Settings-Highlight.png "ConEmu settings, Highlight page")


<h3 id="Far_Manager"> Far Manager </h3>

![ConEmu settings, Far Manager page](/img/Settings-Far.png "ConEmu settings, Far Manager page")


<h3 id="Far_macros"> Far macros </h3>

![ConEmu settings, Far macros page](/img/Settings-Far-Macros.png "ConEmu settings, Far macros page")


<h3 id="Far_Views"> Far Views </h3>

This is settings for ‘Panel Views’ Far Manager plugin.


![ConEmu settings, Views page](/img/Settings-Far-View.png "ConEmu settings, Views page")


<h3 id="Info"> Info </h3>

![ConEmu settings, Info page](/img/Settings-Info.png "ConEmu settings, Info page")


<h3 id="Debug"> Debug </h3>

Enables advanced logging of console processes creation, ANSI output and keypresses.

![ConEmu settings, Debug page](/img/Settings-Debug.png "ConEmu settings, Debug page")
