---
title: "ConEmu | Settings"

description: "Где хранятся настройки, описание диалога настроек,
  конвертация из реестра в xml, экспорт настроек."

breadcrumbs:
 - url: TableOfContents.html#settings
   title: Settings

otherlang:
   en: /en/Settings.html
   ru: /ru/Settings.html
---

# Настройка ConEmu

* [Where settings are stored](#Where_settings_are_stored)
  * [Registry](#Registry)
  * [ConEmu.xml](#ConEmu_xml)
* [Manual change of settings](#Manual_change_of_settings)
  * [Using registry](#Using_registry)
  * [Using ConEmu.xml](#Using_ConEmu_xml)
* [Диалог настроек «Settings»](#Settings_dialog)
  * Common controls
    * [Save settings](#id1610)
    * [Export...](#id2572)
    * [Look up an option](#id2569)
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
  * [Mark and Copy](#Mark_and_Copy)
  * [Paste](#Paste)
  * [Highlight](#Highlight)
  * [Far Manager](#Far_Manager)
  * [Far macros](#Far_macros)
  * [Far Views](#Far_Views)
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


### ConEmu.xml   {#ConEmu_xml}

Любая [версия](VersionComparison.html) ConEmu может быть «портабельной»,
то есть может хранить настройки в xml-файле.
Хотя при желании может быть использован и реестр Windows.

Обычно вам будет предложено выбрать режим хранения настроек при [первом запуске](SettingsFast.html).

Подробнее о хранении настроек:

* [Порядок поиска ConEmu.xml](ConEmuXml.html#search-sequence)
* [Переход от реестра к xml и обратно](ConEmuXml.html#switch-location)
* [Использование специальных xml-файлов](ConEmuXml.html#special-xml-files)
* [Как отправить настройки сообщая о проблемах](ConEmuXml.html#send-to-developer)


## Manual change of settings  {#Manual_change_of_settings}

So, You want to change a few settings, which are absent in the Settings dialog.
List and description of each setting You may find
in the `Settings-ConEmu.reg` or `ConEmu_Sample.xml` files.


### Using registry   {#Using_registry}

Go to Registry editor (be careful!) and change appropriate value in the ConEmu subkeys:

* `[HKEY_CURRENT_USER\Software\ConEmu\.Vanilla]`, when [/config](ConEmuArgs.html) switch is not used;
* `[HKEY_CURRENT_USER\Software\ConEmu\<configname>]`, when /config switch specified in the ConEmu command line.


### Using ConEmu.xml   {#Using_ConEmu_xml}

Open ConEmu.xml file using any text editor (Far Manager, Notepad, Vim and so on)
find appropriate value and change it.


## Settings dialog  {#Settings_dialog}

Открыть диалог настроек можно несколькими способами

* выбрав пункт «Settings...» из [системного меню](SystemMenu.html) ConEmu, которое можно открыть
* щелкнув правой кнопкой мышки по кнопке "Меню" в тулбаре
* щелкнув правой кнопкой мышки по заголовку окна
* щелкнув левой кнопкой мышки по иконке в заголовке окна
* нажав на клавиатуре Win+Alt+Space
* щелкнув правой кнопкой мышки по иконке ConEmu на панели задач (в Windows 7 нужно удерживать кнопку Shift)
* если в [TSA](ConEmuTerms.html#TSA) включено отображение иконки, можно щелкнуть по ней правой кнопкой мышки
* нажать на клавиатуре Win+Alt+P

### Common controls

#### Save settings  {#id1610}
Almost all changes in options are applied immediately when you change them.
But if you want these changes persist on next ConEmu start,
you have to press ‘Save settings’ button.

**NB** Button ‘Save settings’ may be disabled when [settings file](ConEmuXml.html)
is write-protected or ConEmu was started with [-basic](ConEmuArgs.html) switch.
You may store changes in another [xml file](ConEmuXml.html) by pressing button
[Export...](#id2572).

#### Export...  {#id2572}
Click it, you need to make a copy of your settings in the [xml file](ConEmuXml.html).

#### Look up an option  {#id2569}
If you can't find a desired option the easiest way to do that is ‘Search field’.
Just press `Ctrl+F` in the Settings dialog, type something, the ‘title’ for example,
and wait a bit. ConEmu would activate appropriate page and show the hint on the
found control. You may use `Enter` or ‘Lens icon’ in the search field to find
next occurrence of the string.


<a name="screenshots"></a>

### Main   {#Main}

[![ConEmu settings, Main page](/img/Settings-Main.png "Щелкните чтобы открыть описание")](SettingsMain.html)


### Size and Pos   {#Size_and_Pos}

[![ConEmu settings, Size and position page](/img/Settings-SizePos.png "Щелкните чтобы открыть описание")](SettingsSizePos.html)


### Appearance   {#Appearance}

[![ConEmu settings, Appearance page](/img/Settings-Appearance.png "Щелкните чтобы открыть описание")](SettingsAppearance.html)


### Background   {#Background}

[![ConEmu settings, Background page](/img/Settings-Background.png "Щелкните чтобы открыть описание")](SettingsBackground.html)


### Tabs   {#Tabs}

[![ConEmu settings, Tabs page](/img/Settings-TabBar.png "Щелкните чтобы открыть описание")](SettingsTabBar.html)


### Confirm   {#Confirm}

[![ConEmu settings, Confirm page](/img/Settings-Confirm.png "Щелкните чтобы открыть описание")](SettingsConfirm.html)


### Task bar   {#Task_bar}

[![ConEmu settings, Task bar page](/img/Settings-TaskBar.png "Щелкните чтобы открыть описание")](SettingsTaskBar.html)


### Automatic update   {#Automatic_update}

[![ConEmu settings, Update page](/img/Settings-Update.png "Щелкните чтобы открыть описание")](SettingsUpdate.html)


### Startup   {#Startup}

[![ConEmu settings, Startup page](/img/Settings-Startup.png "Щелкните чтобы открыть описание")](SettingsStartup.html)


### Tasks   {#Tasks}

* [Простой способ запуска часто используемых оболочек](Tasks.html) в [табах](TabBar.html) или [сплитах](SplitScreen.html)
* [Запуск задач из списка переходов панели задач](Windows7Taskbar.html#Customizable_Jump_list)

[![ConEmu settings, Tasks page](/img/Settings-Tasks.png "Щелкните чтобы открыть описание")](SettingsTasks.html)


### ComSpec   {#ComSpec}

[![ConEmu settings, Comspec page](/img/Settings-Comspec.png "Щелкните чтобы открыть описание")](SettingsComspec.html)


### Environment   {#Environment}

[![ConEmu settings, Environment page](/img/Settings-Environment.png "Щелкните чтобы открыть описание")](SettingsEnvironment.html)


### Features   {#Features}

[![ConEmu settings, Features page](/img/Settings-Features.png "Щелкните чтобы открыть описание")](SettingsFeatures.html)


#### RealConsole font  {#RealConsole_font}

* [RealConsole](RealConsole.html)
* [Unicode support](UnicodeSupport.html)

[![ConEmu settings, RealConsole font](/img/Settings-More-RealFont.png "Щелкните чтобы открыть описание")](RealConsole.html)


### Text cursor   {#Text_cursor}

[![ConEmu settings, Text cursor page](/img/Settings-TextCursor.png "Щелкните чтобы открыть описание")](SettingsTextCursor.html)


### Colors   {#Colors}

[![ConEmu settings, Colors page](/img/Settings-Colors.png "Щелкните чтобы открыть описание")](SettingsColors.html)

[![ConEmu settings, Predefines palettes](/img/Settings-Colors2.png "Щелкните чтобы открыть описание")](SettingsColors.html)


### Transparency   {#Transparency}

[![ConEmu settings, Transparency page](/img/Settings-Transparency.png "Щелкните чтобы открыть описание")](SettingsTransparency.html)


### Status bar   {#Status_bar}

[![ConEmu settings, Status bar page](/img/Settings-StatusBar.png "Щелкните чтобы открыть описание")](SettingsStatusBar.html)


### App distinct   {#App_distinct}

[![ConEmu settings, App distinct page](/img/Settings-AppDistinct.png "Щелкните чтобы открыть описание")](SettingsAppDistinct.html)

[![ConEmu settings, App distinct page](/img/Settings-AppDistinct2.png "Щелкните чтобы открыть описание")](SettingsAppDistinct.html)

[![ConEmu settings, App distinct page](/img/Settings-AppDistinct3.png "Щелкните чтобы открыть описание")](SettingsAppDistinct.html)


### Integration   {#Integration}

[![ConEmu settings, Integration page](/img/Settings-Integration.png "Щелкните чтобы открыть описание")](SettingsIntegration.html)


### Default Terminal   {#Default_term}

* [ConEmu как терминал «по умолчанию»](DefaultTerminal.html)

[![ConEmu settings, DefTerm page](/img/Settings-DefTerm.png "Щелкните чтобы открыть описание")](SettingsDefTerm.html)


### Keys and Macro   {#Keys_and_Macro}

[![ConEmu settings, Keys and Macro page](/img/Settings-Hotkeys.png "Щелкните чтобы открыть описание")](SettingsHotkeys.html)

[![ConEmu settings, Few GuiMacros](/img/Settings-Hotkeys2.png "Щелкните чтобы открыть описание")](SettingsHotkeys.html)


### Controls   {#Controls}

[![ConEmu settings, Controls page](/img/Settings-Controls.png "Щелкните чтобы открыть описание")](SettingsControls.html)


### Mark and Copy   {#Mark_and_Copy}

* [Пометка, копирование и вставка текста](TextSelection.html)

[![ConEmu settings, Text selection](/img/Settings-MarkCopy.png "Щелкните чтобы открыть описание")](SettingsMarkCopy.html)


### Paste   {#Paste}

[![ConEmu settings, Paste page](/img/Settings-Paste.png "Щелкните чтобы открыть описание")](SettingsPaste.html)


### Highlight   {#Highlight}

[![ConEmu settings, Highlight page](/img/Settings-Highlight.png "Щелкните чтобы открыть описание")](SettingsHighlight.html)


### Far Manager   {#Far_Manager}

[![ConEmu settings, Far Manager page](/img/Settings-Far.png "Щелкните чтобы открыть описание")](SettingsFar.html)


### Far macros   {#Far_macros}

![ConEmu settings, Far macros page](/img/Settings-Far-Macros.png "ConEmu settings, Far macros page")


### Far Views   {#Far_Views}

This is settings for ‘Panel Views’ Far Manager plugin.


![ConEmu settings, Views page](/img/Settings-Far-View.png "ConEmu settings, Views page")


### Info   {#Info}

[![ConEmu settings, Info page](/img/Settings-Info.png "Щелкните чтобы открыть описание")](SettingsInfo.html)


### Debug   {#Debug}

Enables advanced logging of console processes creation, ANSI output and keypresses.

[![ConEmu settings, Debug page](/img/Settings-Debug.png "Щелкните чтобы открыть описание")](SettingsDebug.html)
