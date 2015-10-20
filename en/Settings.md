---
title: "ConEmu | Settings"

description: "Where the settings are stored, Settings dialog description,
  convertation from registry to xml."

breadcrumbs:
 - url: TableOfContents.html#settings
   title: Settings

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


## Where settings are stored  {#Where_settings_are_stored}

ConEmu may store its settings in the Windows registry (HKCU), or in the ConEmu.xml file.


### Registry   {#Registry}

All settings are stored in registry in the following key:

~~~
[HKEY_CURRENT_USER\Software\ConEmu\.Vanilla]
~~~

When You specify the [/config](ConEmuArgs.html) switch in the ConEmu.exe command line settings will be stored here:

~~~
[HKEY_CURRENT_USER\Software\ConEmu\<configname>]
~~~


### ConEmu.xml   {#ConEmu_.xml}

Any ConEmu [installation](VersionComparison.html) may be ‘portable’,
i.e. it may store settings in the xml files.
But it may use Windows registry too.

In most cases you will choose settings storage location at the [first start](SettingsFast.html).

Read more about settings storage options:

* [ConEmu.xml search sequence](ConEmuXml.html#search-sequence)
* [Switching from registry to xml and back](ConEmuXml.html#switch-location)
* [Using specially defined xml files](ConEmuXml.html#special-xml-files)
* [How to send settings when reporting issues](ConEmuXml.html#send-to-developer)


## Manual change of settings  {#Manual_change_of_settings}

So, You want to change a few settings, which are absent in the Settings dialog.
List and description of each setting You may find
in the `Settings-ConEmu.reg` or `ConEmu_Sample.xml` files.


### Using registry   {#Using_registry}

Go to Registry editor (be careful!) and change appropriate value in the ConEmu subkeys:

* `[HKEY_CURRENT_USER\Software\ConEmu\.Vanilla]`, when [/config](ConEmuArgs.html) switch is not used;
* `[HKEY_CURRENT_USER\Software\ConEmu\<configname>]`, when /config switch specified in the ConEmu command line.


### Using ConEmu.xml   {#Using_ConEmu_.xml}

Open ConEmu.xml file using any text editor (Far Manager, Notepad, Vim and so on)
find appropriate value and change it.


## Settings dialog  {#Settings_dialog}

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

### Main   {#Main}

[![ConEmu settings, Main page](/img/Settings-Main.png "Click to open description")](SettingsMain.html)


### Size and Pos   {#Size_and_Pos}

[![ConEmu settings, Size and position page](/img/Settings-SizePos.png "Click to open description")](SettingsSizePos.html)


### Appearance   {#Appearance}

[![ConEmu settings, Appearance page](/img/Settings-Appearance.png "Click to open description")](SettingsAppearance.html)


### Background   {#Background}

[![ConEmu settings, Background page](/img/Settings-Background.png "Click to open description")](SettingsBackground.html)


### Tabs   {#Tabs}

[![ConEmu settings, Tabs page](/img/Settings-TabBar.png "Click to open description")](SettingsTabBar.html)


### Confirm   {#Confirm}

[![ConEmu settings, Confirm page](/img/Settings-Confirm.png "Click to open description")](SettingsConfirm.html)


### Task bar   {#Task_bar}

[![ConEmu settings, Task bar page](/img/Settings-TaskBar.png "Click to open description")](SettingsTaskBar.html)


### Automatic update   {#Automatic_update}

[![ConEmu settings, Update page](/img/Settings-Update.png "Click to open description")](SettingsUpdate.html)


### Startup   {#Startup}

[![ConEmu settings, Startup page](/img/Settings-Startup.png "Click to open description")](SettingsStartup.html)


### Tasks   {#Tasks}

* [Simple way to store oft-used commands](Tasks.html) and run them in [tabs](TabBar.html) or [splits](SplitScreen.html)
* [Using tasks from TaskBar Jump Lists](Windows7Taskbar.html#Customizable_Jump_list)

[![ConEmu settings, Tasks page](/img/Settings-Tasks.png "ConEmu settings, Tasks page")](SettingsTasks.html)


### ComSpec   {#ComSpec}

[![ConEmu settings, Comspec page](/img/Settings-Comspec.png "Click to open description")](SettingsComspec.html)


### Environment   {#Environment}

[![ConEmu settings, Environment page](/img/Settings-Environment.png "Click to open description")](SettingsEnvironment.html)


### Features   {#Features}

[![ConEmu settings, Features page](/img/Settings-Features.png "Click to open description")](SettingsFeatures.html)


#### RealConsole font  {#RealConsole_font}

* [RealConsole](RealConsole.html)
* [Unicode support](UnicodeSupport.html)

[![ConEmu settings, RealConsole font](/img/Settings-More-RealFont.png "Click to open description")](RealConsole.html)


### Text cursor   {#Text_cursor}

[![ConEmu settings, Text cursor page](/img/Settings-TextCursor.png "Click to open description")](SettingsTextCursor.html)


### Colors   {#Colors}

[![ConEmu settings, Colors page](/img/Settings-Colors.png "Click to open description")](SettingsColors.html)

[![ConEmu settings, Predefines palettes](/img/Settings-Colors2.png "Click to open description")](SettingsColors.html)


### Transparency   {#Transparency}

[![ConEmu settings, Transparency page](/img/Settings-Transparency.png "Click to open description")](SettingsTransparency.html)


### Status bar   {#Status_bar}

[![ConEmu settings, Status bar page](/img/Settings-StatusBar.png "Click to open description")](SettingsStatusBar.html)


### App distinct   {#App_distinct}

[![ConEmu settings, App distinct page](/img/Settings-AppDistinct.png "Click to open description")](SettingsAppDistinct.html)

[![ConEmu settings, App distinct page](/img/Settings-AppDistinct2.png "Click to open description")](SettingsAppDistinct.html)

[![ConEmu settings, App distinct page](/img/Settings-AppDistinct3.png "Click to open description")](SettingsAppDistinct.html)


### Integration   {#Integration}

[![ConEmu settings, Integration page](/img/Settings-Integration.png "Click to open description")](SettingsIntegration.html)


### Default Terminal   {#Default_term}

* [Set up ConEmu as Default Windows Terminal](DefaultTerminal.html)

[![ConEmu settings, DefTerm page](/img/Settings-DefTerm.png "Click to open description")](SettingsDefTerm.html)


### Keys and Macro   {#Keys_and_Macro}

[![ConEmu settings, Keys and Macro page](/img/Settings-Hotkeys.png "Click to open description")](SettingsHotkeys.html)

[![ConEmu settings, Few GuiMacros](/img/Settings-Hotkeys2.png "Click to open description")](SettingsHotkeys.html)


### Controls   {#Controls}

[![ConEmu settings, Controls page](/img/Settings-Controls.png "Click to open description")](SettingsControls.html)


### Mark and Copy   {#Mark_and_Copy}

* [Text mark up, copy and paste](TextSelection.html)

[![ConEmu settings, Text selection](/img/Settings-MarkCopy.png "Click to open description")](SettingsMarkCopy.html)


### Paste   {#Paste}

[![ConEmu settings, Paste page](/img/Settings-Paste.png "Click to open description")](SettingsPaste.html)


### Highlight   {#Highlight}

[![ConEmu settings, Highlight page](/img/Settings-Highlight.png "Click to open description")](SettingsHighlight.html)


### Far Manager   {#Far_Manager}

[![ConEmu settings, Far Manager page](/img/Settings-Far.png "Click to open description")](SettingsFar.html)


### Far macros   {#Far_macros}

![ConEmu settings, Far macros page](/img/Settings-Far-Macros.png "ConEmu settings, Far macros page")


### Far Views   {#Far_Views}

This is settings for ‘Panel Views’ Far Manager plugin.


![ConEmu settings, Views page](/img/Settings-Far-View.png "ConEmu settings, Views page")


### Info   {#Info}

[![ConEmu settings, Info page](/img/Settings-Info.png "Click to open description")](SettingsInfo.html)


### Debug   {#Debug}

Enables advanced logging of console processes creation, ANSI output and keypresses.

[![ConEmu settings, Debug page](/img/Settings-Debug.png "Click to open description")](SettingsDebug.html)
