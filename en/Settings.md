---
title: "ConEmu | Settings"

description: "Where the settings are stored, Settings dialog description,
  convertation from registry to xml."

otherlang:
   eng: /en/Settings.html
   rus: /ru/Settings.html
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
  * [Background](#Background)
  * [Tabs](#Tabs)
  * [Confirm](#Confirm)
  * [Task bar](#Task_bar)
  * [Automatic update](#Automatic_update)
  * [Startup](#Startup)
  * [Tasks](#Tasks)
  * [ComSpec](#ComSpec)
  * [Environment](#Environment)
  * [Features](#Features)
    * [RealConsole font](#RealConsole_font)
  * [Text cursor](#Text_cursor)
  * [Colors](#Colors)
  * [Transparency](#Transparency)
  * [Status bar](#Status_bar)
  * [App distinct](#App_distinct)
  * [Integration](#Integration)
  * [Default Terminal](#Default_term)
  * [Keys and Macro](#Keys_and_Macro)
  * [Controls](#Controls)
  * [Mark & Copy](#Mark_and_Copy)
  * [Paste](#Paste)
  * [Highlight](#Highlight)
  * [Far Manager](#Far_Manager)
  * [Far macros](#Far_macros)
  * [Views](#Far_views)
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

Any ConEmu [installation](VersionComparison.html) may be ‘portable’,
i.e. it may store settings in the xml files.
But it may use Windows registry too.

In most cases you will choose settings storage location at the [first start](SettingsFast.html).

Read more about settings storage options:

* [ConEmu.xml search sequence](ConEmuXml.html#search-sequence)
* [Switching from registry to xml and back](ConEmuXml.html#switch-location)
* [Using specially defined xml files](ConEmuXml.html#special-xml-files)
* [How to send settings when reporting issues](ConEmuXml.html#send-to-developer)


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

[![ConEmu settings, Main page](/img/Settings-Main.png "Click to open description")](SettingsMain.html)


<h3 id="Size_and_Pos"> Size and Pos </h3>

[![ConEmu settings, Size and position page](/img/Settings-SizePos.png "Click to open description")](SettingsSizePos.html)


<h3 id="Appearance"> Appearance </h3>

[![ConEmu settings, Appearance page](/img/Settings-Appearance.png "Click to open description")](SettingsAppearance.html)


<h3 id="Background"> Background </h3>

[![ConEmu settings, Background page](/img/Settings-Background.png "Click to open description")](SettingsBackground.html)


<h3 id="Tabs"> Tabs </h3>

[![ConEmu settings, Tabs page](/img/Settings-TabBar.png "Click to open description")](SettingsTabBar.html)


<h3 id="Confirm"> Confirm </h3>

[![ConEmu settings, Confirm page](/img/Settings-Confirm.png "Click to open description")](SettingsConfirm.html)


<h3 id="Task_bar"> Task bar </h3>

[![ConEmu settings, Task bar page](/img/Settings-TaskBar.png "Click to open description")](SettingsTaskBar.html)


<h3 id="Automatic_update"> Automatic update </h3>

[![ConEmu settings, Update page](/img/Settings-Update.png "Click to open description")](SettingsUpdate.html)


<h3 id="Startup"> Startup </h3>

[![ConEmu settings, Startup page](/img/Settings-Startup.png "Click to open description")](SettingsStartup.html)


<h3 id="Tasks"> Tasks </h3>

* [Simple way to store oft-used commands](Tasks.html) and run them in [tabs](TabBar.html) or [splits](SplitScreen.html)
* [Using tasks from TaskBar Jump Lists](Windows7Taskbar.html#Customizable_Jump_list)

[![ConEmu settings, Tasks page](/img/Settings-Tasks.png "ConEmu settings, Tasks page")](SettingsTasks.html)


<h3 id="ComSpec"> ComSpec </h3>

[![ConEmu settings, Comspec page](/img/Settings-Comspec.png "Click to open description")](SettingsComspec.html)


<h3 id="Environment"> Environment </h3>

[![ConEmu settings, Environment page](/img/Settings-Environment.png "Click to open description")](SettingsEnvironment.html)


<h3 id="Features"> Features </h3>

[![ConEmu settings, Features page](/img/Settings-Features.png "Click to open description")](SettingsFeatures.html)


<h4 id="RealConsole_font"> RealConsole font </h4>

* [RealConsole](RealConsole.html)
* [Unicode support](UnicodeSupport.html)

[![ConEmu settings, RealConsole font](/img/Settings-More-RealFont.png "Click to open description")](RealConsole.html)


<h3 id="Text_cursor"> Text cursor </h3>

[![ConEmu settings, Text cursor page](/img/Settings-TextCursor.png "Click to open description")](SettingsTextCursor.html)


<h3 id="Colors"> Colors </h3>

[![ConEmu settings, Colors page](/img/Settings-Colors.png "Click to open description")](SettingsColors.html)

[![ConEmu settings, Predefines palettes](/img/Settings-Colors2.png "Click to open description")](SettingsColors2.html)


<h3 id="Transparency"> Transparency </h3>

[![ConEmu settings, Transparency page](/img/Settings-Transparency.png "Click to open description")](SettingsTransparency.html)


<h3 id="Status_bar"> Status bar </h3>

[![ConEmu settings, Status bar page](/img/Settings-StatusBar.png "Click to open description")](SettingsStatusBar.html)


<h3 id="App_distinct"> App distinct </h3>

[![ConEmu settings, App distinct page](/img/Settings-AppDistinct.png "Click to open description")](SettingsAppDistinct.html)

[![ConEmu settings, App distinct page](/img/Settings-AppDistinct2.png "Click to open description")](SettingsAppDistinct2.html)

[![ConEmu settings, App distinct page](/img/Settings-AppDistinct3.png "Click to open description")](SettingsAppDistinct3.html)


<h3 id="Integration"> Integration </h3>

[![ConEmu settings, Integration page](/img/Settings-Integration.png "Click to open description")](SettingsIntegration.html)


<h3 id="Default_term"> Default Terminal </h3>

* [Set up ConEmu as Default Windows Terminal](DefaultTerminal.html)

[![ConEmu settings, DefTerm page](/img/Settings-DefTerm.png "Click to open description")](SettingsDefTerm.html)


<h3 id="Keys_and_Macro"> Keys and Macro </h3>

[![ConEmu settings, Keys and Macro page](/img/Settings-Hotkeys.png "Click to open description")](SettingsHotkeys.html)

[![ConEmu settings, Few GuiMacros](/img/Settings-Hotkeys2.png "Click to open description")](SettingsHotkeys2.html)


<h3 id="Controls"> Controls </h3>

[![ConEmu settings, Controls page](/img/Settings-Controls.png "Click to open description")](SettingsControls.html)


<h3 id="Mark_and_Copy"> Mark and Copy </h3>

* [Text mark up, copy and paste](TextSelection.html)

[![ConEmu settings, Text selection](/img/Settings-MarkCopy.png "Click to open description")](SettingsMarkCopy.html)


<h3 id="Paste"> Paste </h3>

[![ConEmu settings, Paste page](/img/Settings-Paste.png "Click to open description")](SettingsPaste.html)


<h3 id="Highlight"> Highlight </h3>

[![ConEmu settings, Highlight page](/img/Settings-Highlight.png "Click to open description")](SettingsHighlight.html)


<h3 id="Far_Manager"> Far Manager </h3>

[![ConEmu settings, Far Manager page](/img/Settings-Far.png "Click to open description")](SettingsFar.html)


<h3 id="Far_macros"> Far macros </h3>

![ConEmu settings, Far macros page](/img/Settings-Far-Macros.png "ConEmu settings, Far macros page")


<h3 id="Far_Views"> Far Views </h3>

This is settings for ‘Panel Views’ Far Manager plugin.


![ConEmu settings, Views page](/img/Settings-Far-View.png "ConEmu settings, Views page")


<h3 id="Info"> Info </h3>

[![ConEmu settings, Info page](/img/Settings-Info.png "Click to open description")](SettingsInfo.html)


<h3 id="Debug"> Debug </h3>

Enables advanced logging of console processes creation, ANSI output and keypresses.

[![ConEmu settings, Debug page](/img/Settings-Debug.png "Click to open description")](SettingsDebug.html)
